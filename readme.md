Kernel Project generator, usage:

- ./generator.sh module_name

Above script would create a folder named "module_name", place a module_name.c and a Makefile inside.

- To compile a kernel module, use "make" or "make all"
- To clean temp files, use "make clean"

Module name must be alpha/number only, otherwise it's rejected.
