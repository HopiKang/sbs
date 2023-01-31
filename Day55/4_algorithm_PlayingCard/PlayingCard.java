public class PlayingCard {
    public static void main(String[] args) {
        // 카드 52장 생성
        DeckofCards deckofCards = new DeckofCards();

        for (int suit = 1; suit <= 4;suit++){
            for (int rank = 1; rank <= 13; rank++){
                Card newCard = new Card(suit, rank);
//                System.out.println(newCard.toString()); 확인
                deckofCards.addCard(newCard);
            }
        }

        // 카드 셔플
        deckofCards.shuffleCards();

        // 카드 나눠주기
        // player1, player2
        DeckofCards player1 = deckofCards.player(7);
        DeckofCards player2 = deckofCards.player(7);

        // 출력
        player1.print();
        System.out.println();
        player2.print();

        /*
        출력 결과 예시
        4 of Hearts



        */
    }
}
