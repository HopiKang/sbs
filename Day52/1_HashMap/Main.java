import java.util.HashMap;

public class Main {
    public static void main(String[] args) {
        HashMap<String, Pokemon> pokemonbag = new HashMap<>();
        pokemonbag.put("피카츄", new Pokemon("피카츄")); // key, value 생성
        pokemonbag.put("파이리", new Pokemon("파이리"));
        pokemonbag.put("꼬부기", new Pokemon("꼬부기"));
        pokemonbag.put("이상해씨", new Pokemon("이상해씨"));
        pokemonbag.put("캐터피", new Pokemon("캐터피"));
        System.out.println(pokemonbag.get("피카츄"));

        pokemonbag.put("피카츄", new Pokemon("라이츄")); // 덮어쓰기
        System.out.println(pokemonbag.get("피카츄"));

        for (String key : pokemonbag.keySet()){ // 전체출력
            System.out.println(pokemonbag.get(key));
        }
    }
}
