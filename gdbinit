set debug-file-directory /usr/lib/debug
set prompt \033[01;1;33mgdb> \033[0m

python
import os, sys
sys.path.insert(0, os.getenv('TOOLS_DIRECTORY') + '/gdb_helpers')

from qt4 import register_qt4_printers
register_qt4_printers (None)

from kde4 import register_kde4_printers
register_kde4_printers (None)

end
