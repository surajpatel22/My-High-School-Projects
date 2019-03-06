
public class Card {
	
	private int rank;
	private int value;
	private int suit;
	
	
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}
	public int getSuit() {
		return suit;
	}
	public void setSuit(int suit) {
		this.suit = suit;
	}
	
	
	public Card(int rank, int suit) {
		this.rank = rank;
		this.suit = suit;
		
		if (rank == 1) {
			value = 11;
		}else if(rank > 10) {
			value = 10;
		}else {
			value = rank;
		}
	}
	
	public String toString() {
		return "Card: " + (new String[]{"Ace","2","3","4","5","6","7","8","9","10","Jack","Queen","King"})[rank-1] + " of " + (new String[]{"Spades", "Hearts", "Clubs", "Diamonds"})[suit-1];
	}
	
	
	
	
}
