import java.util.ArrayList;

public class Main {
    // 오징어게임
    /*
    n명의 참가자가 동그랗게 서있습니다 한명씩 수를 세어가며 j 번째 사람이
    탈락하게 된다 ex) 8명의 참가자가 있고 3명마다 탈락된다면
    3 > 6 > 1 > 5 > 2> 8 > 4 > 7
    하지만 우승을 하고 싶은 기훈은 마지막까지 살아남아 우승을 하려고 합니다
    파라미터로 정수 n과 정수 j를 받고 기훈을 우승시키기 위해서 있어야할
    자리 int 를 리턴해주는 프로그램을 만드시오
    (20, 5)
    5번 참가자 탈락
    10번 참가자 탈락
    15번 참가자 탈락
    20번 참가자 탈락
    6번 참가자 탈락 ---
    7번째 자리에 서있으면 우승입니다
    */

    /*
    public static int squidGame(int n, int j){
        ArrayList<Integer> member = new ArrayList<Integer>();

        for (int i = 1; i <= n; i++){
            member.add(i);
        }

        ArrayList<Integer> out_member = new ArrayList<>();
        while (n >= 2){
            for (int i = 1; i <=j - 1; i++){
                member.add(member.get(0));
                member.remove(0);
            }
            out_member.add(member.get(0));
            member.remove(0);
            n--;
        }
        for (Integer out : out_member){
            System.out.println(out + "번 참가자 탈락");
        }

         return member.get(0);
    }

    public static void main(String[] args) {


        System.out.println(squidGame(20, 5) + "번째 자리에 서있으면 우승입니다");
    }
    */

    public static int squidGame(int n, int j){
        ArrayList<Integer> member = new ArrayList<>();

        for (int membernumber = 1; membernumber <= n; membernumber++){
            member.add(membernumber);
        }

        int out_member = 0;
        while (member.size() > 1){
            out_member = (out_member + j - 1) % member.size();
            System.out.println(member.remove(out_member) + "번 참가자 탈락");
        }
        return member.get(0);
    }

    public static void main(String[] args) {
        System.out.println(squidGame(20, 5) + "번자리에 서있으면 우습입니다");
    }

}
