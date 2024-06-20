// src/lexer/sym.java
package lexer;

public class sym {
    public static final int IF = 1;
    public static final int THEN = 2;
    public static final int ELSE = 3;
    public static final int END = 4;
    public static final int REPEAT = 5;
    public static final int UNTIL = 6;
    public static final int READ = 7;
    public static final int WRITE = 8;
    public static final int LT = 9;
    public static final int LE = 10;
    public static final int EQ = 11;
    public static final int NE = 12;
    public static final int GT = 13;
    public static final int GE = 14;
    public static final int PLUS = 15;
    public static final int MINUS = 16;
    public static final int MUL = 17;
    public static final int DIV = 18;
    public static final int LPAREN = 19;
    public static final int RPAREN = 20;
    public static final int RBRACE = 21;
    public static final int LBRACE = 22;
    public static final int ASSIGN = 23;
    public static final int SEMI = 24;
    public static final int COMMA = 25;
    public static final int NUM = 26;
    public static final int ID = 27;
    public static final int LOGIC_OR = 28;
    public static final int LOGIC_AND = 29;
    public static final int STRING_START = 30;
    public static final int STRING_CONTENT = 31;
    public static final int STRING_END = 32;
    public static final int COLON = 33;
    public static final int RETURN = 34;
    public static final int EOF = 35;

    public static String getTokenName(int tokenType) {
        switch (tokenType) {
            case IF: return "IF";
            case THEN: return "THEN";
            case ELSE: return "ELSE";
            case END: return "END";
            case REPEAT: return "REPEAT";
            case UNTIL: return "UNTIL";
            case READ: return "READ";
            case WRITE: return "WRITE";
            case LT: return "LT";
            case LE: return "LE";
            case EQ: return "EQ";
            case NE: return "NE";
            case GT: return "GT";
            case GE: return "GE";
            case PLUS: return "PLUS";
            case MINUS: return "MINUS";
            case MUL: return "MUL";
            case DIV: return "DIV";
            case LPAREN: return "LPAREN";
            case RPAREN: return "RPAREN";
            case RBRACE: return "RBRACE";
            case LBRACE: return "LBRACE";
            case ASSIGN: return "ASSIGN";
            case SEMI: return "SEMI";
            case COMMA : return "COMMA"; 
            case NUM: return "NUM";
            case ID: return "ID";
            case LOGIC_OR: return "LOGIC_OR";
            case LOGIC_AND: return "LOGIC_AND";
            case STRING_START: return "STRING_START";
            case STRING_CONTENT: return "STRING_CONTENT";
            case STRING_END: return "STRING_END";
            case COLON: return "COLON";
            case RETURN 
            : return "RETURN";
            case EOF: return "EOF";
            default: return "UNKNOWN";
        }
    }
}

