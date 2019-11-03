set disassembly-flavor intel
set confirm off
set history save on

define go
  if $argc < 1
    b main
  else
    b $arg0
  end
  r
end


source ~/.gdb-dashboard

#source ~/bin/peda/peda.py
#dashboard examples
#dashboard stackmemory  watch $ebp-20 40
#dashboard stackmemory -output /dev/pts/7

