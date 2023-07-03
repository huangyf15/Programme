# CMAKE CPP(CUDA) TEMPLATE

## virtual env
all further steps are suggested to perform in virtual environment

``` bash
pip install virtualenv
mkdir <my_virtual_env>
virtualenv --no-site-packages <my_virtual_env>

# activate
source <my_virtual_env>/bin/activate

# deactivate
deactivate
```

## tools
``` bash
# cpplint
pip install cpplint
# clang-format
pip install clang-format
```

## pre-commit
``` bash
pip install pre-commit
# install hooks
cd <some_git_repo>
pre-commit install-hooks
pre-commit autoupdate
pre-commit install 
```
## gitlint
``` bash
pip install gitlint
# install hooks
cd <some_git_repo>
gitlint install-hook
```
## usage

``` bash
git add .
pre-commit
```
or
``` bash
git add .
git commit
```
