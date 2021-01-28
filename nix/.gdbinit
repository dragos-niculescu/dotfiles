set disassembly-flavor intel
set history save on



#source ~/bin/peda/peda.py

#source ~/.gdb-dashboard

#standard gdb
#layout split
#layout regs

#dashboard examples
#dashboard stackmemory  watch $ebp-20 40
#dashboard stackmemory -output /dev/pts/7

source /home/dniculescu/curs/iocla/pwndbg/gdbinit.py
set context-sections 'regs disasm stack '
set show-flags on
set dereference-limit 2


