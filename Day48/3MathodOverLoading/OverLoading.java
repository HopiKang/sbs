public class OverLoading {
    int add(int pMeterA, int pMeterB){
        return pMeterA + pMeterB;
    }

    int add(int pMeterA, int pMeterB, int pMeterC){
        return pMeterA + pMeterB + pMeterC;
    }

    double add(double pMeterA, double pMeterB){
        return pMeterA + pMeterB;
    }

    public static void main(String[] args){
        OverLoading overLoading = new OverLoading();

        System.out.println(overLoading.add(2, 4));
        System.out.println(overLoading.add(2, 4,9));
        System.out.println(overLoading.add(3.14, 5.85));
    }
}

// 메소드 오버로딩
// 하나의 메소드이름으로 여러가지 역할을 할수있다
// 매개변수의 타입과 갯수, 순서 중에서 하나가 달라야 가능하다
// 사용자가 사용할때 다양한 매개값을 사용하기 위해서 메소드 오버로딩이 필요하다
// 주의사항 : 매개변수의 타입과 갯수, 순서가 모두 동일한데 매개 변수의 이름만 변경하는것은 오버로딩이 아니다
// 또한 return타입만 다르고 매개변수가 동일한 경우도 오버로딩이라 할수없다.