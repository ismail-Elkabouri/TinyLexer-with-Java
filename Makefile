

# Makefile

JAVAC=javac
JFLEX=jflex
JAVAC_FLAGS=-d out -sourcepath src

SRC_DIR=src
OUT_DIR=out

LEXER_SRC=$(SRC_DIR)/lexer/lexer/TinyLexer.flex
GENERATED_LEXER=$(SRC_DIR)/lexer/TinyLexer.java
JAVA_SRCS=$(shell find $(SRC_DIR) -name "*.java")

.PHONY: all clean lexer build run

all: lexer build

lexer: $(LEXER_SRC)
	$(JFLEX) $(LEXER_SRC)
	mv TinyLexer.java $(SRC_DIR)/lexer/lexer/TinyLexer.java

build: $(JAVA_SRCS)
	mkdir -p $(OUT_DIR)
	$(JAVAC) $(JAVAC_FLAGS) $(JAVA_SRCS)

run:
	java -cp $(OUT_DIR) main.Main

clean:
	rm -rf $(OUT_DIR) $(GENERATED_LEXER)
