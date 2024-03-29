IDIR = ./include
ODIR = obj
CFLAGS = -I$(IDIR)
CC = gcc

_DEPS = call_rop.h
DEPS = $(patsubst %, $(IDIR)/%, $(_DEPS))

_OBJ = call_rop_stack_overflow_vul.o
OBJ = $(patsubst %, $(ODIR)/%, $(_OBJ))

$(ODIR)/%.o: %.c $(DEPS)
	$(CC) -c -g -o $@ $< $(CFLAGS) -fno-stack-protector -no-pie

vul: $(OBJ)
	$(CC) -g -o $@ $^ $(CFLAGS) -fno-stack-protector -no-pie

.PHONY: clean
clean: 
	rm -f $(ODIR)/*.o *~ core $(INCDIR)/*~
