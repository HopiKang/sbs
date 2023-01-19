import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

public class BackPack {
    private final HashMap<String, ArrayList<Pokemon>> pokemons = new HashMap<>();
    public ArrayList<Pokemon> getPokemons(String name){
        return pokemons.get(name);
    }

    public void add(Pokemon pokemon){
        String name = pokemon.name;

        if (getPokemons(name) == null){
            pokemons.put(name, new ArrayList<Pokemon>());
        }
        getPokemons(name).add(pokemon);
    }



    public Pokemon getStrongPower(String name){
        ArrayList<Pokemon> pokemonList = getPokemons(name);

        if (pokemonList == null){
            return null;
        }

        Pokemon stronggest = null;
        for (Pokemon pokemon : pokemonList){
            if (stronggest == null || pokemon.energy > stronggest.energy){
                stronggest = pokemon;
            }
        }
        return stronggest;
    }

    public Pokemon getStrongPower(){
        Pokemon strongest = null;

        for (String key : pokemons.keySet()){
            Pokemon power = getStrongPower(key);

            if (strongest == null || power.energy > strongest.energy){
                strongest = power;
            }
        }
        return strongest;
    }

}
