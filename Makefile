REPO_NAME := fasmg-ez80-action
SRC := src/example.asm
EXE_NAME := EXAMPLE
RELEASE_DIR := $(REPO_NAME)
RELEASE_ZIP := $(REPO_NAME)

all:
	fasmg $(SRC) $(EXE_NAME).8xp

compress: all
	convbin -k 8xp-compressed -e zx0 -u -n $(EXE_NAME) -j 8x -i $(EXE_NAME).8xp -o $(EXE_NAME).zx0b.8xp
	rm -f $(EXE_NAME).8xp

release: compress
	mkdir -p  $(RELEASE_DIR)
	mv $(EXE_NAME).zx0b.8xp $(RELEASE_DIR)/$(EXE_NAME).8xp
	cp README.md $(RELEASE_DIR)/README.md
	zip -9r $(RELEASE_ZIP) $(RELEASE_DIR)
	rm -rf $(RELEASE_DIR)
