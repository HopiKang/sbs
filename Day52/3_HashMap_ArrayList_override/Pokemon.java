public class Pokemon {
    public final String name;

    public final int energy;

    public Pokemon(String name, int energy){
        this.name = name;
        this.energy = energy;
    }

    @Override
    public String toString(){
        return name + "(" + energy + ")";
    }
}
