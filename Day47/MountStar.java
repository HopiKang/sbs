public class MountStar {

    public void star(int num){
        for (int i = 1; i <= num; i++){
            for (int j = 0; j < i; j++){
                System.out.print("*");
            }
            System.out.println("");
        }
    }
    public static void main(String[] args) {

        MountStar mountStar = new MountStar();
        int num = 3;
        mountStar.star(num);
    }
}
