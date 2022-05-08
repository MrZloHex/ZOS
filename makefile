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


