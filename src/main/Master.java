package main;

import lexer.TinyLexer;
import lexer.Token;
import java.io.FileReader;

public class Master {
    public static void main(String[] args) {
        if (args.length == 0) {
            System.out.println("Usage: java -cp out main.Master <file1> <file2> ... <fileN>");
            return;
        }

        for (String fileName : args) {
            try (FileReader file = new FileReader(fileName)) {
                System.out.println("Processing file: " + fileName);
                System.out.println("__________________________");
                TinyLexer lexer = new TinyLexer(file);
                Token token;
                while ((token = lexer.yylex()) != null) {
                    System.out.println("| Token: " + token);
                    System.out.println("|__________________________|");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
