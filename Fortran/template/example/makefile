#======================================
# Author: Yunfan Huang
# Institute: Tsinghua University
# Updated: Aug 06, 2020
# Notice:
#    Input "make mod" before "make"!
#======================================

WORKDIR = D:\\Research\\@Codes\\Language\\Fortran\\project\\example
MAKEDIR = D:\\Research\\@Codes\\Language\\Fortran\\project\\example
#======================================
# Directory aliases
TARGET = $(BINDIR)\\helloWorld
BINDIR = $(MAKEDIR)\\bin
OBJDIR = $(MAKEDIR)\\obj
MODDIR = $(OBJDIR)
SRCDIR = $(MAKEDIR)\\src

SRCLIST = helloWorld.f90
OBJ = $(OBJDIR)\\helloWorld.obj
#======================================
# Output .obj files
$(OBJDIR)\\%.obj: $(SRCDIR)\\%.f90
	ifort -c -o $@ $^
#======================================
# Make options
.PHONY: all
all: $(TARGET)
$(TARGET): $(OBJ)
	ifort -o $(TARGET) $(OBJ) \

.PHONY: clean
clean:
	rm -f $(OBJ) $(TARGET)

.PHONY: realclean
realclean:
	rm -f $(OBJ) $(MOD) $(TARGET)