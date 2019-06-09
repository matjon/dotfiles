#Without this I get the following error message:
#Starting program: /home/mateusz/Studia 10 semestr/Praca magisterska/Pokrycie zbioru/exact_algorithm/debug.out 
#warning: File "/media/Vista/bin/lib/gcc/i686-pc-linux-gnu/4.8.2/libstdc++.so.6.0.18-gdb.py" auto-loading has been declined by your `auto-load safe-path' set to "$debugdir:$datadir/auto-load".
#To enable execution of this file add
#        add-auto-load-safe-path /media/Vista/bin/lib/gcc/i686-pc-linux-gnu/4.8.2/libstdc++.so.6.0.18-gdb.py
#line to your configuration file "/home/mateusz/.gdbinit".

#add-auto-load-safe-path /media/Vista/bin/lib/gcc/i686-pc-linux-gnu/4.8.2/libstdc++.so.6.0.18-gdb.py


#EDIT: nie, 12 lut 2017, 01:01:43 CET
python
import sys
sys.path.insert(0, "/media/Vista/build/kernel/linux/scripts/gdb")
end
source /media/Vista/build/kernel/linux/scripts/gdb/vmlinux-gdb.py
#---

set debug-file-directory /usr/lib/debug

#recommended by 
#http://gcc.gnu.org/onlinedocs/libstdc++/manual/debug.html#debug.gdb
set print pretty on
set print object on
set print static-members on
set print vtbl on
set print demangle on
set demangle-style gnu-v3

#http://sourceware.org/gdb/wiki/STLSupport - outdated
# - pretty printers for containers
#this is exactly the same script as specified in add-auto-load-safe-path above,
#however this is a newer version
python
import sys
sys.path.insert(0, '/media/Vista/install/gdb_STL/python/')
from libstdcxx.v6.printers import register_libstdcxx_printers
register_libstdcxx_printers (None)
end

#Iterators: how to display the item the iterator points at 
#(tested on gdb 6 with a list): print *(iter._M_current)





#nie, 12 lut 2017, 01:06:19 CET
set history save on
#set history size unlimited
#set history filename /home/mateusz/.gdbhistory

