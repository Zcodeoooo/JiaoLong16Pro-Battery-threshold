"""Verify the release requests UAC and contains the smoke-tested payload."""
import sys
import xml.etree.ElementTree as ET

from PyInstaller.archive.readers import CArchiveReader
from PyInstaller.utils.win32.winmanifest import read_manifest_from_executable


def main():
    release_path, diagnostic_path = sys.argv[1:]
    tree = ET.fromstring(read_manifest_from_executable(release_path))
    level = tree.find(".//{urn:schemas-microsoft-com:asm.v3}requestedExecutionLevel")
    if level is None or level.get("level") != "requireAdministrator":
        raise RuntimeError("Release manifest does not require administrator")
    release, diagnostic = CArchiveReader(release_path), CArchiveReader(diagnostic_path)
    if set(release.toc) != set(diagnostic.toc) or release.options != diagnostic.options:
        raise RuntimeError("Release and diagnostic archives differ")
    for name in release.toc:
        if release.extract(name) != diagnostic.extract(name):
            raise RuntimeError("Untested release payload: " + name)
    print(f"Verified requireAdministrator and identical payload ({len(release.toc)} entries).")


if __name__ == "__main__":
    main()
