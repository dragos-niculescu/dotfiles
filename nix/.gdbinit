set disassembly-flavor intel
set history save on

define go
  if $argc < 1
    b main
  else
    b $arg0
  end
  r
end


# source ~/bin/peda/peda.py

source ~/.gdb-dashboard
#dashboard examples
#dashboard stackmemory  watch $ebp-20 40
#dashboard stackmemory -output /dev/pts/7

