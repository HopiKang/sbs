import java.util.HashMap;

public class EnglishDictionary {
    private HashMap<String, String> word = new HashMap<>();
    public void addWord(String english, String korean){
        word.put(english, korean); // key 와 value 입력
    }

    public String find(String english){
        for (String key : word.keySet()){
            if (key.toLowerCase().equals(english.toLowerCase())){
                return word.get(key);
            }
        }
        return null;
    }
}
