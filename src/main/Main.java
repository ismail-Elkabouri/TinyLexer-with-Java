// src/main/Main.java
package main;

import lexer.TinyLexer;
import lexer.Token;
import java.io.FileReader;

public class Main {
    public static void main(String[] args) {
        try {
            FileReader file = new FileReader("test.tiny");
            TinyLexer lexer = new TinyLexer(file);
            Token token;
            while ((token = lexer.yylex()) != null) {
                System.out.println("Token: " + token);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

