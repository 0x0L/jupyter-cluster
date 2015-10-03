pytables
--------

pytables is currently broken and usage of HDF stores in Pandas results in an `Illegal instruction` exception (see [here](https://github.com/PyTables/PyTables/issues/458)).

```sh
# (not so) quick fix: recompile
pip3 uninstall tables
pip3 install tables
```
