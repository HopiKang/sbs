import java.util.ArrayList;
import java.util.Random;

public class DeckofCards {
    // 카드 더미

    private ArrayList<Card> cards;

    public DeckofCards(){
        cards = new ArrayList<Card>();
    }

    public void addCard(Card card){
        cards.add(card);
    }

    public void print(){
        for (Card card : cards){
            System.out.println(card.toString());
        }
    }

    public void shuffleCards(){
        Random random = new Random();

        for (int i = 0; i < cards.size(); i++){
            int randIndex = random.nextInt(cards.size());
            Card temp = cards.get(i);
            cards.set(i, cards.get(randIndex));
            cards.set(randIndex, temp);
        }
    }

    // count 만큼 현재 카드뭉치에서 카드를 넘겨줄때
    // count 가 7이면 현재 카드뭉치에서 마지막장 7 빼고 7장을
    // cards에 반환
    public DeckofCards player(int count){
        DeckofCards hand = new DeckofCards();

        int size = cards.size();
        for (int i = size - 1; i >= size - count; i--){
            hand.addCard(cards.remove(i));
        }
        return hand;
    }
}
