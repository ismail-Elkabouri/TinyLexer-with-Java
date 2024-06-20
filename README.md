# Lexer For Tiny Language With Jflex

## Introduction

This project implements a lexical analyzer for the Tiny programming language using JFlex. The analyzer identifies and categorizes tokens in Tiny language source files.

## Setup Instructions

## To set up and run the lexical analyzer, follow these steps:

1. **Clone the repository:**
   ```sh
   git clone <repository-url>
   cd TinyLexer
   ```

--------------------------------------------------------------------------------------------------------

2. **Generate the lexer:**
   ```sh
   make lexer
   ```

---------------------------------------------------------------------------------------------------------

3. **Build the project:**
   ```sh
   make build
   ```

---------------------------------------------------------------------------------------------------------

4. **Run the program with test files:**
   ```sh
   java -cp out main.Main <choose a test file>
   ```

--------------------------------------------------------------------------------------------------------

## Lexical Analyzer Overview

The lexical analyzer reads the source code of a Tiny program and converts it into a series of tokens. Each token represents a meaningful element of the program, such as a keyword, identifier, operator, or symbol.

----------------------------------------------------------------------------------------------------------

## Token Definitions

-----------------------------------------------------------------------------------------------------------

The following tokens are identified by the lexical analyzer:

- **Keywords:** `if`, `then`, `else`, `end`, `repeat`, `until`, `read`, `write`, `return`...`
- **Operators:** `<`, `<=`, `=`, `<>`, `>`, `>=`, `+`, `-`, `*`, `/`
- **Assignment:** `:=`
- **Symbols:** `(`, `)`, `;`, `{`, `}`, `.` ...
- **Identifiers and Numbers:** `[a-zA-Z][a-zA-Z0-9]*`, `[0-9]+`
- ** Logical Operators:** `&&`, `||`, `?=` ...
- **Comments:** Single-line (`//`), Multi-line (`/* ... */`)
- **Whitespace:** Spaces, tabs, newlines

------------------------------------------------------------------------------------------------------------

### DFA Generation


### RegEx --> to NFA--------------------------------------------------------------------------------------

Each regular expression is first converted into an NFA (Nondeterministic Finite Automaton). This step involves creating states and transitions for each character in the regular expression.

### NFA --> to DFA ---------------------------------------------------------------------------------------

The NFA is then converted into a DFA (Deterministic Finite Automaton) which has a unique transition for each character in the alphabet from each state.

### DFA Visualization -------------------------------------------------------------------------------------

To visualize the DFA, we use Graphviz and the DOT language. The DOT file for the DFA is generated as follows:

-------------------------------------------------------------------------------------------------------------
```dot
digraph DFA {

   size = 10.8;
   node["Attributes"]      //  which represent the final states .
   node["Attributes"]     // which represent other states.


  s0["Attributes"]      // initail state

  // Transitions goeas here

  // Keywords
  .
  .
  .

  // Identifiers
  .
  .
  .
  // Operators
  .
  .
  .
  // Numbers
  .
  .
  .

}
--------------------------------------------------------------------------------------------------------------
### OUTPUT
 See the dfa.png file  which is a well representation for commone  RegEX for Tiny Language
--------------------------------------------------------------------------------------------------------------
### Generating the DFA Graph

To generate the DFA graph, use Graphviz with the following command:
-----------------------------------------
```sh
 dot -Tpng -Gdpi=1000 dfa.dot -o dfa.png
```
-----------------------------------------


## Usage
---------------------------------------------------------------------------------------------------------------
To use the lexical analyzer, run the program with one or more Tiny source files as arguments. The analyzer will output the tokens identified in each file.

## Examples
______________________________________________________________________________________________________________
**Example Tiny Source File (`test1.tiny`):**
_______________________________________________________________________________________________________________
if x < 10 then
  read y;
  write y + 1;
end
_______________________________________________________________________________________________________________
**Example Tiny Source File (`tes2.tiny`):**
______________________________________________________________________________________________________________
```sh
int sum(int a, int b)
{
	return a + b;
}
int main()
{
	int val, counter;
	read val;

	counter := 0;

	repeat
		val := val - 1;
		write "Iteration number [";
		write counter;
		write "] the value of x = ";
		write val;
		write endl;
		counter := counter+1;
	until val = 1

	write endl;

	string s := "number of Iterations = ";
	write s;

	counter := counter-1;

	write counter;


	float z1 := 3*2*(2+1)/2-5.3;
	z1 := z1 + sum(a,y);

	if  z1 > 5 || z1 < counter && z1 = 1
	then
		write z1;
	elseif z1 < 5
	then
		z1 := 5;
	else
	    z1 := counter;
	end

	return 0;
}
```
_______________________________________________________________________________________________________________

## OUTPUT
______________________________________________________________________________________________________________

##Processing file: test1.tiny
-------------------------------------------------------------------------------------------------------------
```sh
|__________________________|
| Token: <READ, 'read'>
|__________________________|
| Token: <ID, 'x'>
|__________________________|
| Token: <SEMI, ';'>
|__________________________|
| Token: <IF, 'if'>
|__________________________|
| Token: <ID, 'x'>
|__________________________|
| Token: <GT, '>'>
|__________________________|
| Token: <NUM, '0'>
|__________________________|
| Token: <THEN, 'then'>
|__________________________|
| Token: <ID, 'fact'>
|__________________________|
| Token: <ASSIGN, ':='>
|__________________________|
| Token: <NUM, '1'>
|__________________________|
| Token: <SEMI, ';'>
|__________________________|
| Token: <REPEAT, 'repeat'>
|__________________________|
| Token: <ID, 'fact'>
|__________________________|
| Token: <ASSIGN, ':='>
|__________________________|
| Token: <ID, 'fact'>
|__________________________|
| Token: <MUL, '*'>
|__________________________|
| Token: <ID, 'x'>
|__________________________|
| Token: <SEMI, ';'>
|__________________________|
| Token: <ID, 'x'>
|__________________________|
| Token: <ASSIGN, ':='>
|__________________________|
| Token: <ID, 'x'>
|__________________________|
| Token: <MINUS, '-'>
|__________________________|
| Token: <NUM, '1'>
|__________________________|
| Token: <UNTIL, 'until'>
|__________________________|
| Token: <ID, 'x'>
|__________________________|
| Token: <EQ, '='>
|__________________________|
| Token: <NUM, '0'>
|__________________________|
| Token: <SEMI, ';'>
|__________________________|
| Token: <WRITE, 'write'>
|__________________________|
| Token: <ID, 'fact'>
|__________________________|
| Token: <END, 'end'>
|__________________________|
```
---------------------------------------------------------------------------------------------------------------
 Processing file: test2.tiny
--------------------------------------------------------------------------------------------------------------
```sh
|__________________________|
| Token: <ID, 'int'>
|__________________________|
| Token: <ID, 'sum'>
|__________________________|
| Token: <LPAREN, '('>
|__________________________|
| Token: <ID, 'int'>
|__________________________|
| Token: <ID, 'a'>
|__________________________|
| Token: <COMMA, ','>
|__________________________|
| Token: <ID, 'int'>
|__________________________|
| Token: <ID, 'b'>
|__________________________|
| Token: <RPAREN, ')'>
|__________________________|
| Token: <LBRACE, '{'>
|__________________________|
| Token: <RETURN, 'return'>
|__________________________|
| Token: <ID, 'a'>
|__________________________|
| Token: <PLUS, '+'>
|__________________________|
| Token: <ID, 'b'>
|__________________________|
| Token: <SEMI, ';'>
|__________________________|
| Token: <RBRACE, '}'>
|__________________________|
| Token: <ID, 'int'>
|__________________________|
| Token: <ID, 'main'>
|__________________________|
| Token: <LPAREN, '('>
|__________________________|
| Token: <RPAREN, ')'>
|__________________________|
| Token: <LBRACE, '{'>
|__________________________|
| Token: <ID, 'int'>
|__________________________|
| Token: <ID, 'val'>
|__________________________|
| Token: <COMMA, ','>
|__________________________|
| Token: <ID, 'counter'>
|__________________________|
| Token: <SEMI, ';'>
|__________________________|
| Token: <READ, 'read'>
|__________________________|
| Token: <ID, 'val'>
|__________________________|
| Token: <SEMI, ';'>
|__________________________|
| Token: <ID, 'counter'>
|__________________________|
| Token: <ASSIGN, ':='>
|__________________________|
| Token: <NUM, '0'>
|__________________________|
| Token: <SEMI, ';'>
|__________________________|
| Token: <REPEAT, 'repeat'>
|__________________________|
| Token: <ID, 'val'>
|__________________________|
| Token: <ASSIGN, ':='>
|__________________________|
| Token: <ID, 'val'>
|__________________________|
| Token: <MINUS, '-'>
|__________________________|
| Token: <NUM, '1'>
|__________________________|
| Token: <SEMI, ';'>
|__________________________|
| Token: <WRITE, 'write'>
|__________________________|
| Token: <STRING_START, '"'>
|__________________________|
| Token: <STRING_CONTENT, 'Iteration number ['>
|__________________________|
| Token: <STRING_END, '"'>
|__________________________|
| Token: <SEMI, ';'>
|__________________________|
| Token: <WRITE, 'write'>
|__________________________|
| Token: <ID, 'counter'>
|__________________________|
| Token: <SEMI, ';'>
|__________________________|
| Token: <WRITE, 'write'>
|__________________________|
| Token: <STRING_START, '"'>
|__________________________|
| Token: <STRING_CONTENT, '] the value of x = '>
|__________________________|
| Token: <STRING_END, '"'>
|__________________________|
| Token: <SEMI, ';'>
|__________________________|
| Token: <WRITE, 'write'>
|__________________________|
| Token: <ID, 'val'>
|__________________________|
| Token: <SEMI, ';'>
|__________________________|
| Token: <WRITE, 'write'>
|__________________________|
| Token: <ID, 'endl'>
|__________________________|
| Token: <SEMI, ';'>
|__________________________|
| Token: <ID, 'counter'>
|__________________________|
| Token: <ASSIGN, ':='>
|__________________________|
| Token: <ID, 'counter'>
|__________________________|
| Token: <PLUS, '+'>
|__________________________|
| Token: <NUM, '1'>
|__________________________|
| Token: <SEMI, ';'>
|__________________________|
| Token: <UNTIL, 'until'>
|__________________________|
| Token: <ID, 'val'>
|__________________________|
| Token: <EQ, '='>
|__________________________|
| Token: <NUM, '1'>
|__________________________|
| Token: <WRITE, 'write'>
|__________________________|
| Token: <ID, 'endl'>
|__________________________|
| Token: <SEMI, ';'>
|__________________________|
| Token: <ID, 'string'>
|__________________________|
| Token: <ID, 's'>
|__________________________|
| Token: <ASSIGN, ':='>
|__________________________|
| Token: <STRING_START, '"'>
|__________________________|
| Token: <STRING_CONTENT, 'number of Iterations = '>
|__________________________|
| Token: <STRING_END, '"'>
|__________________________|
| Token: <SEMI, ';'>
|__________________________|
| Token: <WRITE, 'write'>
|__________________________|
| Token: <ID, 's'>
|__________________________|
| Token: <SEMI, ';'>
|__________________________|
| Token: <ID, 'counter'>
|__________________________|
| Token: <ASSIGN, ':='>
|__________________________|
| Token: <ID, 'counter'>
|__________________________|
| Token: <MINUS, '-'>
|__________________________|
| Token: <NUM, '1'>
|__________________________|
| Token: <SEMI, ';'>
|__________________________|
| Token: <WRITE, 'write'>
|__________________________|
| Token: <ID, 'counter'>
|__________________________|
| Token: <SEMI, ';'>
|__________________________|
| Token: <ID, 'float'>
|__________________________|
| Token: <ID, 'z1'>
|__________________________|
| Token: <ASSIGN, ':='>
|__________________________|
| Token: <NUM, '3'>
|__________________________|
| Token: <MUL, '*'>
|__________________________|
| Token: <NUM, '2'>
|__________________________|
| Token: <MUL, '*'>
|__________________________|
| Token: <LPAREN, '('>
|__________________________|
| Token: <NUM, '2'>
|__________________________|
| Token: <PLUS, '+'>
|__________________________|
| Token: <NUM, '1'>
|__________________________|
| Token: <RPAREN, ')'>
|__________________________|
| Token: <DIV, '/'>
|__________________________|
| Token: <NUM, '2'>
|__________________________|
| Token: <MINUS, '-'>
|__________________________|
| Token: <NUM, '5'>
|__________________________|
| Token: <COLON, '.'>
|__________________________|
| Token: <NUM, '3'>
|__________________________|
| Token: <SEMI, ';'>
|__________________________|
| Token: <ID, 'z1'>
|__________________________|
| Token: <ASSIGN, ':='>
|__________________________|
| Token: <ID, 'z1'>
|__________________________|
| Token: <PLUS, '+'>
|__________________________|
| Token: <ID, 'sum'>
|__________________________|
| Token: <LPAREN, '('>
|__________________________|
| Token: <ID, 'a'>
|__________________________|
| Token: <COMMA, ','>
|__________________________|
| Token: <ID, 'y'>
|__________________________|
| Token: <RPAREN, ')'>
|__________________________|
| Token: <SEMI, ';'>
|__________________________|
| Token: <IF, 'if'>
|__________________________|
| Token: <ID, 'z1'>
|__________________________|
| Token: <GT, '>'>
|__________________________|
| Token: <NUM, '5'>
|__________________________|
| Token: <LOGIC_OR, '||'>
|__________________________|
| Token: <ID, 'z1'>
|__________________________|
| Token: <LT, '<'>
|__________________________|
| Token: <ID, 'counter'>
|__________________________|
| Token: <LOGIC_AND, '&&'>
|__________________________|
| Token: <ID, 'z1'>
|__________________________|
| Token: <EQ, '='>
|__________________________|
| Token: <NUM, '1'>
|__________________________|
| Token: <THEN, 'then'>
|__________________________|
| Token: <WRITE, 'write'>
|__________________________|
| Token: <ID, 'z1'>
|__________________________|
| Token: <SEMI, ';'>
|__________________________|
| Token: <ID, 'elseif'>
|__________________________|
| Token: <ID, 'z1'>
|__________________________|
| Token: <LT, '<'>
|__________________________|
| Token: <NUM, '5'>
|__________________________|
| Token: <THEN, 'then'>
|__________________________|
| Token: <ID, 'z1'>
|__________________________|
| Token: <ASSIGN, ':='>
|__________________________|
| Token: <NUM, '5'>
|__________________________|
| Token: <SEMI, ';'>
|__________________________|
| Token: <ELSE, 'else'>
|__________________________|
| Token: <ID, 'z1'>
|__________________________|
| Token: <ASSIGN, ':='>
|__________________________|
| Token: <ID, 'counter'>
|__________________________|
| Token: <SEMI, ';'>
|__________________________|
| Token: <END, 'end'>
|__________________________|
| Token: <RETURN, 'return'>
|__________________________|
| Token: <NUM, '0'>
|__________________________|
| Token: <SEMI, ';'>
|__________________________|
| Token: <RBRACE, '}'>
|__________________________|
```

------------------------------------------------------------------------------------------
## References.


- https://www3.nd.edu/~dthain/compilerbook/

- https://www.jflex.de/manual.html

- https://a7medayman6.github.io/Tiny-Compiler/

- https://www.graphviz.org/

- Compiler Principles Techniques and Tools (2nd Edition) Book.


## Acknowlegement
  

I would like to express my gratitude to everyone who supported and guided me throughout the development of this project. 

Special thanks to:

- Professors and Mentors: For their invaluable guidance and insightful feedback.
- Open Source Community: For providing tools like JFlex and resources that were crucial in building this lexical analyzer.

This project would not have been possible without the contributions and support from these individuals and communities.


