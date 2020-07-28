# for test
COMPILER = INTEL
#COMPILER = GXX

TGTNAME = main

#-------------------------------------------
# File Path aliases
MAKEDIR = .
BINDIR = $(MAKEDIR)/bin
TARGET = $(BINDIR)/$(TGTNAME)
SRCDIR = $(MAKEDIR)/src
HEADDIR = $(SRCDIR)/h
MAINDIR = $(SRCDIR)/cpp
CLSDIR = $(SRCDIR)/cls
OBJDIR = $(MAKEDIR)/obj

#-------------------------------------------
# File aliases
MAINLIST = $(patsubst %,%.cpp,$(TGTNAME))
TSTMAIN = $(MAINLIST:%.cpp=$(MAINDIR)/%.cpp)
CLSLIST = $(notdir $(TSTCLS))
TSTCLS = $(wildcard $(CLSDIR)/*.cpp)

MAINOBJLIST = $(patsubst %.cpp,%.o,$(MAINLIST))
MAINOBJ = $(MAINOBJLIST:%.o=$(OBJDIR)/%.o)
CLSOBJLIST = $(patsubst %.cpp,%.o,$(CLSLIST))
CLSOBJ = $(CLSOBJLIST:%.o=$(OBJDIR)/%.o)
TSTOBJ = $(MAINOBJ) $(CLSOBJ)

#-------------------------------------------
# Method definition
ifeq ($(COMPILER), INTEL)
OPTLIB =
INCLUDE = -I $(HEADDIR)
LINK =
CC = icc
endif

ifeq ($(COMPILER), GXX)
OPTLIB =
INCLUDE = -I $(HEADDIR)
LINK =
CC = g++
endif

#-------------------------------------------
.PHONY: all
all: obj_cls obj_main target

obj_cls: $(CLSOBJ)
$(OBJDIR)/%.o: $(CLSDIR)/%.cpp
	$(CC) -c $(INCLUDE) $(LINK) -o $@ $<

obj_main: $(MAINOBJ)
$(MAINOBJ): $(TSTMAIN)
	$(CC) -c $(INCLUDE) $(LINK) -o $@ $<

target: $(TARGET)
$(TARGET): $(TSTOBJ)
	$(CC) $(INCLUDE) $(LINK) -o $@ $^

.PHONY: clean
clean:
	rm -f $(BINDIR)/* $(OBJDIR)/*
