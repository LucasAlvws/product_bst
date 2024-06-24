C := gcc
CFLAGS := -lncurses -std=c99 -pedantic -lm

BINARY := bstp

SRCDIR := src
INCLUDEDIR := include
OBJDIR := obj

SOURCES := $(shell find $(SRCDIR) -name "*.c")
OBJECTS := $(patsubst $(SRCDIR)/%.c,$(OBJDIR)/%.o,$(SOURCES))
INCLUDES := $(addprefix -I,$(INCLUDEDIR))

all: $(OBJDIR) $(BINARY)

$(BINARY): $(OBJECTS)
	$(CC) -o $@ $^ $(CFLAGS)

$(OBJDIR):
	mkdir $(OBJDIR)

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	$(CC) $(INCLUDES) -c -o $@ $^

clean:
	rm -rf $(OBJDIR) $(BINARY)
