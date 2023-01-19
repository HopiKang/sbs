public class Main {
    public static void main(String[] args) {
        BackPack backPack = new BackPack();

        backPack.add(new Pokemon("냐옹불", 1203));
        backPack.add(new Pokemon("이홍염", 1752));
        backPack.add(new Pokemon("원시그란돈", 1821));
        backPack.add(new Pokemon("이브이", 502));
        backPack.add(new Pokemon("이브이", 600));
        backPack.add(new Pokemon("꼬부기", 715));

        System.out.println(backPack.getStrongPower("이브이"));
        System.out.println(backPack.getStrongPower());
        System.out.println(backPack.getStrongPower("라이츄"));

    }
}
