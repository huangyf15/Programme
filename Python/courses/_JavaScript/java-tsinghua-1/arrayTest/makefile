PLATFORM = YUNFAN

JAVAC = javac
JAVA  = java

PARAS = 

#======================================
# Directory aliases
TGTNAME = ArrayTest
MAKEDIR = .
BINDIR = $(MAKEDIR)/bin
SRCDIR = $(MAKEDIR)/src

#======================================
# Platform and Compiler
ifeq ($(PLATFORM), YUNFAN)

endif
#======================================
# Files' aliases
#- output src files' list
TGTLIST = $(patsubst %,%.class,$(TGTNAME))
TARGET = $(BINDIR)/$(TGTLIST)

#======================================
# Compile Options

#--------------------------------------
#- Debug options

#======================================
# Make options
all: cls run
# Output .class files
.PHONY: cls
cls: $(TARGET)
$(BINDIR)/%.class: $(SRCDIR)/%.java
	$(JAVAC) -d $(BINDIR) $^

# Run Java programs
.PHONY: run
run:
	$(JAVA) -cp $(BINDIR) $(TGTNAME) $(PARAS)

.PHONY: clean
clean:
	rm -f $(BINDIR)/*

