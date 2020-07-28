# for test
CC = icc

TGTNAME = transParam

TSTDIR = .
BINDIR = $(TSTDIR)/bin
TARGET = $(BINDIR)/$(TGTNAME)
SRCDIR = $(TSTDIR)/src
HEADDIR = $(SRCDIR)/h
CPPDIR = $(SRCDIR)/cpp
CPPLIST = $(patsubst %,%.cpp,$(TGTNAME))
TSTCPP = $(CPPLIST:%.cpp=$(CPPDIR)/%.cpp)
OBJDIR = $(TSTDIR)/obj
OBJLIST = $(patsubst %.cpp,%.o,$(CPPLIST))
TSTOBJ = $(OBJLIST:%.o=$(OBJDIR)/%.o)

INCLUDE = -I $(HEADDIR)

$(TSTOBJ): $(TSTCPP)
	$(CC) -c $(INCLUDE) -o $@ $<

.PHONY: test
test: $(TARGET)
$(TARGET): $(TSTOBJ)
	$(CC) $(INCLUDE) -o $@ $<
.PHONY: clean
clean:
	rm -f $(BINDIR)/* $(OBJDIR)/*
