import java.util.*;

public class Hand {
	
	private ArrayList<Card> hand = new ArrayList<Card>();
	private int totalValue = 0;
	private boolean isDealer;
	
	public void addCard(Card card) {
		totalValue += card.getValue();
		hand.add(card);
	}

	public int getTotalValue() {
		return totalValue;
	}
	
	public Hand(boolean isDealer) {
		this.isDealer = isDealer;
	}

	
	
	public String toString() {
		String out = (isDealer) ? "Dealer's Hand:\n\t" : "Player's Hand:\n\t";
		out += (isDealer) ? "Card: ?????\n\t" : hand.get(0) + "\n\t";
		for (int i = 1; i < hand.size(); ++i) {
			out += hand.get(i) + "\n\t";
		}
		return out + ((isDealer) ? "" : ("Current total: " + totalValue));
	}
	
	public String toString(String dealerRevealed) {
		String out = "Dealer's Revealed Hand:\n\t";
		for (int i = 0; i < hand.size(); ++i) {
			out += hand.get(i) + "\n\t";
		}
		return out + ("Current total: " + totalValue);
	}
	
}
