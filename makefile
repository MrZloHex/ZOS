ASMC = zas
ASM_FLAGS = build -v

SRC = src/start.asm

TARGET = zos.bin

all: clean build

build: $(TARGET)

$(TARGET): $(SRC)
	$(ASMC) $(ASM_FLAGS) -i=$(SRC) -o=$(TARGET)

run:
	./$(TARGET)


clean:
	-rm -f $(TARGET)


