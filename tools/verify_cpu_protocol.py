"""Run actual PowerShell packet code with CIM replaced by local test functions.

No real Get-CimInstance / Invoke-CimMethod or EC driver is called.
"""
from pathlib import Path
import sys,base64,json,subprocess,os,re,hashlib
ROOT=Path(__file__).resolve().parent.parent
sys.path.insert(0,str(ROOT))
import bm5235_cpu as cpu

SHIM=r"""
$script:StubCustomMode=0
$script:Seen=@()
function Get-CimClass {
    param($Namespace,$ClassName)
    if ($ClassName -ne 'MICommonInterface') { throw 'Wrong class' }
    [pscustomobject]@{CimClassQualifiers=@{Guid=[pscustomobject]@{Value='{b60bfb48-3e5b-49e4-a0e9-8cffe1b3434b}'}}}
}
function Get-CimInstance {
    param($Namespace,$ClassName)
    [pscustomobject]@{Active=$true}
}
function Invoke-CimMethod {
    param($InputObject,$MethodName,$Arguments)
    $packet=[byte[]]$Arguments.InData
    if ($packet.Length -ne 32 -or $MethodName -ne 'MiInterface') { throw 'Wrong packet contract' }
    $script:Seen += ,@($packet)
    if ($packet[1] -eq 0xFB -and $packet[3] -eq 0x17) {
        if ($packet[4] -eq 1 -and -not $script:RejectEnable) { $script:StubCustomMode=1 }
        if ($packet[4] -eq 0) { $script:StubCustomMode=0 }
    }
    $output=[byte[]]::new(30)
    $output[1]=0x80
    $output[3]=$packet[3]
    if ($packet[1] -eq 0xFA) { $output[4]=$script:StubCustomMode }
    if ($script:BadHeader) { $output[1]=0xE0 }
    [pscustomobject]@{OutData=$output;Reserved=0}
}
"""

def case(actions,settings=''):
    payload=base64.b64encode(json.dumps(actions).encode()).decode()
    script=SHIM+settings+'\n'+cpu.WMI_SCRIPT.replace('__TASK_B64__',payload)+r'''
[Console]::WriteLine([Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes(
    (@{seen=@($script:Seen);mode=$script:StubCustomMode}|ConvertTo-Json -Compress -Depth 6))))
'''
    encoded=base64.b64encode(script.encode('utf-16le')).decode()
    shell=Path(os.environ.get('SystemRoot',r'C:\Windows'))/'System32/WindowsPowerShell/v1.0/powershell.exe'
    result=subprocess.run([str(shell),'-NoProfile','-NonInteractive','-EncodedCommand',encoded],
                          capture_output=True,encoding='utf-8',timeout=15,creationflags=subprocess.CREATE_NO_WINDOW)
    assert result.returncode==0,result.stderr
    rows=[json.loads(base64.b64decode(v).decode('utf-8')) for v in result.stdout.strip().splitlines()]
    assert len(rows)==2,rows
    return rows

checks=[]
actions=[{'op':'query','expect':0},{'op':'temperature','value':85},{'op':'sustained','value':55},
         {'op':'fast','value':75},{'op':'enable'},{'op':'query','expect':1}]
result,trace=case(actions)
assert result['ok'] and len(trace['seen'])==6,(result,trace)
prefixes=[p[:7] for p in trace['seen']]
assert prefixes==[[0,0xFA,0,0x17,0,0,0],[0,0xFB,0,0x17,4,85,0],
                  [0,0xFB,0,0x17,2,55,0],[0,0xFB,0,0x17,3,75,0],
                  [0,0xFB,0,0x17,1,0,0],[0,0xFA,0,0x17,0,0,0]]
checks.append('Exact 32-byte OEM query/enable/temperature/sustained/fast packet prefixes')
result,trace=case([{'op':'enable'},{'op':'query','expect':1},{'op':'sustained','value':55}],
                  '$script:RejectEnable=$true')
assert result['ok'] is False and len(trace['seen'])==2
checks.append('Rejected mode transition stops later writes')
result,trace=case([{'op':'query'},{'op':'enable'}],'$script:BadHeader=$true')
assert result['ok'] is False and len(trace['seen'])==1
checks.append('Wrong OEM response header stops batch')
result,trace=case([{'op':'disable'},{'op':'profile','value':2},{'op':'query','expect':0}])
assert result['ok'] and trace['seen'][1][:7]==[0,0xFB,0,8,2,0,0]
checks.append('Factory restore uses FB00/0800 and verifies disabled mode')

def method(source,name):
    match=re.search(r'Method\s*\('+name+r',',source)
    assert match,name
    start=source.index('{',match.start());depth=1;p=start+1
    while depth:
        if source[p]=='{':depth+=1
        if source[p]=='}':depth-=1
        p+=1
    return re.sub(r'\s+','',source[start:p])

report={'result':'PASS','checks':checks,'count':len(checks),
        'hardware_io':False,'real_wmi_invocations':False,'real_cpu_settings_changed':False}
(ROOT/'build/cpu-protocol-check.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8')
print(json.dumps(report))
