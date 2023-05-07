#!/bin/sh

set -ex

python3 -m venv venv

source venv/bin/activate

export FORCE_CUDA=1

# build torchvision

curl -L -O https://pub-1cbfe09f357e4aa1a82dc7a43cc443ab.r2.dev/wheel/torch-2.0.1%2Bgitd0d0524-cp310-cp310-linux_x86_64.whl
pip install torch-2.0.1%2Bgitd0d0524-cp310-cp310-linux_x86_64.whl

curl -L -O https://github.com/pytorch/vision/archive/refs/tags/v0.15.2.tar.gz
tar -xzvf v0.15.2.tar.gz

cd vision-0.15.2
echo 0.15.2 > version.txt

pip install setuptools wheel cmake ninja 

python setup.py bdist_wheel

cd ..
