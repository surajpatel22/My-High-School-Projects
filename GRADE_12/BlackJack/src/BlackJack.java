import java.util.*;

public class BlackJack {
	
	static Scanner s = new Scanner(System.in);
	
	private static int amount = 1000;
	private static int bet;
	private static String winner;
	private static Deck deck;
	private static Hand playerHand;
	private static Hand dealerHand;
	
	
	public static void getBet() {
		
		do {
			System.out.print("How much would you like to bet? ");
			bet = s.nextInt();
			s.nextLine(); //moves scanner to next line for future s.nextLine() calls b/c s.nextInt() doesn't automatically
			if (bet <= 0 || bet > amount) { System.out.print("Invalid Input! "); }
		} while (bet <= 0 || bet > amount);
		
	}
	
	public static void playerTurn() {

		String user;
		
		do {	
			System.out.print("Would you like to hit or stand? ");
			user = s.nextLine();
			
			try { Thread.sleep(500); } catch (InterruptedException e) {}

			if (user.equals("hit")){
				playerHand.addCard(deck.draw());
				System.out.println(playerHand + "\n");
			}else if (!user.equals("stand")) {
				System.out.print("Invalid Input! ");
			}else {
				System.out.println(playerHand + "\n");
			}
			
		} while (!user.equals("stand") && playerHand.getTotalValue() <= 21);
		if (playerHand.getTotalValue() > 21) {
			System.out.println("\nYour hand is busted!");
			winner = "dealer";
		}
	}
	
	public static void dealerTurn() {

		System.out.println("Dealer's Turn:");
		
		try { Thread.sleep(200); } catch (InterruptedException e) {}

		System.out.println(dealerHand);
		
		try { Thread.sleep(500); } catch (InterruptedException e) {}
		
		while(dealerHand.getTotalValue() <= 21 && dealerHand.getTotalValue() <= playerHand.getTotalValue()) {
			dealerHand.addCard(deck.draw());
			System.out.println("The dealer decides to hit!\n" + dealerHand);
			
		}
		
		try { Thread.sleep(200); } catch (InterruptedException e) {}

		if (dealerHand.getTotalValue() > 21) {
			winner = "player";
			System.out.println("The dealer's hand is busted!");
		}
		else { 
			winner = "dealer";
			System.out.println("The dealer decides to stand!");
		}
		
		try { Thread.sleep(500); } catch (InterruptedException e) {}

	}
	
	public static void main(String[] args) {

		while (true) {
			
			System.out.println("Thank you for playing Black Jack! You have $" + amount + " to play!");
			
			getBet();
			winner = "";
			deck = new Deck();
			deck.shuffle();
			playerHand = new Hand(false);
			dealerHand = new Hand(true);
			playerHand.addCard(deck.draw());
			playerHand.addCard(deck.draw());
			dealerHand.addCard(deck.draw());
			dealerHand.addCard(deck.draw());
			
			try { Thread.sleep(100); } catch (InterruptedException e) {}

			System.out.println("\n" + playerHand + "\n");
			
			try { Thread.sleep(500); } catch (InterruptedException e) {}
			
			System.out.println(dealerHand);

			try { Thread.sleep(500); } catch (InterruptedException e) {}

			playerTurn();
			
			try { Thread.sleep(500); } catch (InterruptedException e) {}

			if (playerHand.getTotalValue() <= 21 && winner != "dealer") {
				dealerTurn();
			}else {
				winner = (winner.equals("dealer")) ? "dealer" : "player";
			}
			
			System.out.println("\n" + dealerHand.toString("dealer revealed") + "\n");

			try { Thread.sleep(500); } catch (InterruptedException e) {}

			
			if (winner.equals("player")) {
				amount += bet;
				System.out.println("You have won this round!");
			}
			else {
				amount -= bet;
				System.out.println("The dealer has won this round!");
			}
			
			try { Thread.sleep(500); } catch (InterruptedException e) {}
			
		}
		
	}
	
}
