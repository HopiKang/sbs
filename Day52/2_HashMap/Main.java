public class Main {

    public static void main(String[] args) {
        EnglishDictionary englishDictionary = new EnglishDictionary();
        englishDictionary.addWord("innovation", "혁신");

        System.out.println(englishDictionary.find("Innovation"));
    }
}
