import java.util.*;

public class Deck {

	
	private ArrayList<Card> deck= new ArrayList<Card>();
	
	
	public Deck() {
		for (int i = 1; i <= 13; ++i) {
			for (int j = 1; j <= 4; ++j) {
				deck.add(new Card(i,j));
			}
		}
	}
	
	public void shuffle() {
		Random rand = new Random();
		int n1;
		int n2;
		Card tempCard;
		for (int i = 0; i < 9999; ++i) {
			n1 = rand.nextInt(52);
			n2 = rand.nextInt(52);
			tempCard = deck.get(n1);
			deck.set(n1, deck.get(n2));
			deck.set(n2,  tempCard);
		}
	}
	
	public Card draw() {
		return deck.remove(deck.size()-1);
	}

}
