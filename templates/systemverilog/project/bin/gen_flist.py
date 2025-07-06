#!/usr/bin/env python3

import sys
from pathlib import Path
from itertools import chain
from collections.abc import Iterable


# -----------------------------------------------------------------------------
# Constants
# -----------------------------------------------------------------------------


MODULE_PATH: Path = Path(__file__).resolve()
ROOT_DIRECTORY: Path = MODULE_PATH.parents[1]

TOP_FLIST_PATH: Path = ROOT_DIRECTORY / "top.f"
PKG_FLIST_PATH: Path = ROOT_DIRECTORY / "pkg.f"

TOP_SEARCH_PATH: Path = ROOT_DIRECTORY / "top"
PKG_SEARCH_PATH: Path = ROOT_DIRECTORY / "pkg"
TEST_SEARCH_PATH: Path = ROOT_DIRECTORY / "test"


# -----------------------------------------------------------------------------
# Types
# -----------------------------------------------------------------------------


PathType: type = str | Path


# -----------------------------------------------------------------------------
# Functions
# -----------------------------------------------------------------------------


def _check_path(search_path: Path) -> None:
    if not search_path.exists():
        err = f"Path '{search_path}' does not exist."
        raise ValueError(err)
    if not search_path.is_dir():
        err = f"Path '{search_path}' is not a directory."
        raise ValueError(err)


def _systemverilog_flist(search_path: PathType) -> Iterable[Path]:
    if isinstance(search_path, str):
        search_path = Path(search_path).resolve()
    _check_path(search_path)
    files = tuple(search_path.glob("*"))
    return tuple(filter(lambda f: f.suffix in (".v", ".sv"), files))


def systemverilog_flist(
    *search_paths: PathType | Iterable[PathType],
) -> Iterable[Path]:
    if isinstance(search_paths, PathType):
        search_paths = [search_paths]
    return chain(
        *(_systemverilog_flist(search_path) for search_path in search_paths)
    )


# -----------------------------------------------------------------------------
# Main
# -----------------------------------------------------------------------------


def main() -> int:
    pkg_files = systemverilog_flist(PKG_SEARCH_PATH)
    top_files = systemverilog_flist(
        PKG_SEARCH_PATH, TEST_SEARCH_PATH, TOP_SEARCH_PATH
    )
    pkg_flist = "".join(
        f"+incdir+{file.parent}\n{file}\n" for file in pkg_files
    )
    top_flist = "".join(
        f"+incdir+{file.parent}\n{file}\n" for file in top_files
    )
    PKG_FLIST_PATH.write_text(pkg_flist, encoding="utf-8")
    TOP_FLIST_PATH.write_text(top_flist, encoding="utf-8")
    return 0


if __name__ == "__main__":
    sys.exit(main())
