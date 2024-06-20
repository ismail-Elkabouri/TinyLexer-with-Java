

package lexer;

public class Token {
    public final int type;
    public final String value;

    public Token(int type, String value) {
        this.type = type;
        this.value = value;
    }

    @Override
    public String toString() {
        return "<" +
                sym.getTokenName(type) +
                ", '" + value + '\'' +
                ">";
    }
}
