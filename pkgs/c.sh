#!/usr/bin/env bash
emerge sys-devel/gcc
emerge llvm-core/clang

pip install --upgrade pip
python -m venv ~/venvs/cmake-language-server
source ~/venvs/cmake-language-server/bin/activate
pip install cmake-language-server
