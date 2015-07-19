import java.util.Random;
public class coinflip {
    public static int randInt(int min, int max) {
        Random rand = new Random();
        int randomNum = rand.nextInt((max - min) + 1) + min;
        
        return randomNum;
    }
    public static void main(String[] args) {
        int heads = 0;
        int tails = 0;
        String num = args[0];
        int coins = Integer.parseInt(num);
        for(int i=1; i<=coins; i++) {
            int theCoin=(randInt(1, 50));
            if (theCoin <= 25) {
                String actualCoin = "H";
                heads++;
                System.out.print(actualCoin);
            } else {
                String actualCoin = "T";
                tails++;
                System.out.print(actualCoin);
            }
            
        }
        System.out.println();
        System.out.println("HEADS   " + heads);
        System.out.println("TAILS   " + tails);
    }
}
