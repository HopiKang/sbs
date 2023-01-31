public class Card {
    // 카드에 대한 클래스

    // 카드의 모양은 총 4가지 입니다. (클로버, 하트, 스페이드, 다이아몬드)
    public final int cardShape;


    // 카드 숫자는 총 13개입니다 ( 1 ~ 13)
    public final int cardNumber;

    //생성자생성 (기본값 초기화를 위해서)
    public Card(int cardShape, int cardNumber){
        this.cardShape = cardShape;
        this.cardNumber = cardNumber;
    }

    // 카드 모양을 만드는 메서드
    public String getShape(){
        switch (cardShape){
            case 1:
                return "Clubs";
            case 2:
                return "Diamond";
            case 3:
                return "Heart";
            case 4:
                return "Spade";
            default:
                return "";
        }
    }

    // 카드 숫자를 만드는 메서드
    public String getNumber(){
        switch (cardNumber){
            case 1:
                return "Ace";
            case 2:
                return "Jack";
            case 3:
                return "Queen";
            case 4:
                return "King";
            default:
                return String.valueOf(cardNumber);
        }
    }
    public String toString(){
        return getNumber() + " of " + getShape();
    }
}
