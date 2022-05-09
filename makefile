ASMC = zas
ASM_FLAGS = build -v

EMU = emuZCS
EMU_FLAGS = run

SRC = src/start.asm
INC = inc

TARGET = zos.bin

all: clean build

build: $(TARGET)

$(TARGET): $(SRC)
	$(ASMC) $(ASM_FLAGS) -i=$(SRC) -o=$(TARGET) -I=$(INC)

run: all
	$(EMU) $(EMU_FLAGS) -r=$(TARGET)


clean:
	-rm -f $(TARGET)
	-rm -f test
	-rm -f macro_rules.m4
	-rm -f output.zas

test: clean
	$(ASMC) $(ASM_FLAGS) -i=tests/test.asm -o=test -I=$(INC)


