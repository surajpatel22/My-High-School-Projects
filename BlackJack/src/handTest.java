public class handTest
{
public static void main(String[] args)
{
Hand h = new Hand(true);
Deck d = new Deck();
d.shuffle();
h.addCard(d.draw());
h.addCard(d.draw());
h.addCard(d.draw());
System.out.println(h);
}
}