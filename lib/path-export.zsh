# transfer.sh
transfer() { if [ $# -eq 0 ]; then echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi 
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; }; alias transfer=transfer 

PATH="/home/chahuja/scripts/:$PATH"

# export LD_LIBRARY_PATH for tensorflow
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/local/cuda-7.5/lib64:$LD_LIBRARY_PATH

# virtualenv and virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# tab-complete for python
export PYTHONSTARTUP="/home/chahuja/.pyrc"

# cuda paths
export PATH=/usr/local/cuda-7.0/bin:$PATH
#export PATH=/usr/local/cuda-7.5/lib:$PATH

# caffe to python paths
export PYTHONPATH=/home/chahuja/caffe/python:$PYTHONPATH

# torch path
. /home/chahuja/torch/install/bin/torch-activate


# alias for cudnn
export LD_LIBRARY_PATH=/usr/local/cudann/lib64:$LD_LIBRARY_PATH

# alias import
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#source /home/chahuja/.bazel/bin/bazel-complete.bash
