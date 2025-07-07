#!/usr/bin/env python3

from __future__ import annotations

from pathlib import Path
from collections.abc import Iterable


# -----------------------------------------------------------------------------
# Types
# -----------------------------------------------------------------------------


PathType = str | Path


# -----------------------------------------------------------------------------
# Constants
# -----------------------------------------------------------------------------


MODULE_PATH: Path = Path(__file__).resolve()
ROOT_DIRECTORY: Path = MODULE_PATH.parents[1]

TOP_FLIST_PATH: Path = ROOT_DIRECTORY / "top.f"
PKG_FLIST_PATH: Path = ROOT_DIRECTORY / "pkg.f"

TOP_SEARCH_PATH: Path = (ROOT_DIRECTORY / "top").resolve()
PKG_SEARCH_PATH: Path = (ROOT_DIRECTORY / "src").resolve()
TEST_SEARCH_PATH: Path = (ROOT_DIRECTORY / "test").resolve()


# -----------------------------------------------------------------------------
# Functions
# -----------------------------------------------------------------------------


def _v_flist(search_path: Path) -> list[str]:
    files = [f"-v {fp}" for fp in search_path.glob("*.v")]
    return files and [f"-y {search_path}", *files]


def _sv_flist(search_path: Path) -> list[str]:
    files = [str(fp) for fp in search_path.glob("*.sv")]
    return files and [f"+incdir+{search_path}", *files]


def _flist(search_path: PathType) -> list[str]:
    if isinstance(search_path, str):
        search_path = Path(search_path).resolve()
    return [*_sv_flist(search_path), *_v_flist(search_path)]


def flist(*search_paths: PathType | Iterable[PathType]) -> list[str]:
    if isinstance(search_paths, PathType):
        search_paths = (search_paths,)
    return [
        file
        for path in search_paths
        if isinstance(path, PathType)
        for file in _flist(path)
    ]


def main() -> int:
    rv = 0
    pkg_files = flist(PKG_SEARCH_PATH)
    top_files = flist(PKG_SEARCH_PATH, TEST_SEARCH_PATH, TOP_SEARCH_PATH)
    rv |= PKG_FLIST_PATH.write_text("\n".join(pkg_files), encoding="utf-8")
    rv |= TOP_FLIST_PATH.write_text("\n".join(top_files), encoding="utf-8")
    return rv


if __name__ == "__main__":
    exit(main())
