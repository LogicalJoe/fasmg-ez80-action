SRC := src/example.asm
EXE_NAME := example
RELEASE_DIR := EXAMPLE
RELEASE_ZIP := EXAMPLE

all:
	fasmg $(SRC) $(EXE_NAME).8xp

release: all
	mkdir -p  $(RELEASE_DIR)
	mv $(EXE_NAME).8xp $(RELEASE_DIR)/$(EXE_NAME).8xp
	cp README.md $(RELEASE_DIR)/README.md
	zip -9r $(RELEASE_ZIP) $(RELEASE_DIR)
	rm -rf  $(RELEASE_DIR)
