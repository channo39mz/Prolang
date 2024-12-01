import java.io.*;

public class TestLexer {
    public static void main(String[] args) {
        try {
            Lexer lexer = new Lexer(new StringReader("input.txt"));
            lexer.yylex();  
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
