ASMC = zas
ASM_FLAGS = build -v

SRC = src/start.asm
INC = inc

TARGET = zos.bin

all: clean build

build: $(TARGET)

$(TARGET): $(SRC)
	$(ASMC) $(ASM_FLAGS) -i=$(SRC) -o=$(TARGET) -I=$(INC)

run:
	./$(TARGET)


clean:
	-rm -f $(TARGET)


