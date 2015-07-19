import java.util.Scanner;
public class piglatin {
    public static void main(String[] args) {
        Scanner theword = new Scanner( System.in );
        System.out.println("Enter a word.");
        String word;
        word = theword.next();
        String chars[] = word.split("");
        String fChar = chars[0];
        if (fChar.equals("a") || fChar.equals("e") || fChar.equals("i") || fChar.equals("o") || fChar.equals("u")) {
            System.out.println(word + "yay");
        } else {
            String rest = word.substring(1);
            System.out.println(rest + fChar + "ay");
        }
        }
    }
