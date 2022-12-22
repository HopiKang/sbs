public class Varint {
    public static void main(String[] args) {
/*
        //숫자
        byte a = 130;
        long x = 12345678910L; // L을 붙이는 이유는 long데이터 크기에 들어가지 않기때문

        //소숫점
        // double을 소수형의 기본으로 사용한다
        float f = 3.14f;

        // 문자
        // char는 글자 하나만 입력가능하다
        char charA1 = 'a';
        char charA2 = 97; // 97은 아스키값으로 a를 뜻한다 즉 charA1과 같다고 할수있다
        char charA3 = '\u0061';
        char charA4 = '가';

        //boolean(논리형)
        boolean myBoolean = true;
        myBoolean = false;

        //문자열
        //String은 클래스이다
        String stringA = "Hello, I'm a boy";
        String stringB = ".";

        System.out.println(stringA);
        System.out.println(28);
        System.out.println(stringB);

        // 이름, 생일년, 생일월, 생일 일, 결혼 여부
        // 이름 : 아이유
        // 생일 : 2022년 12월 22일
        // 결혼 : false
        String name = "아이유";
        int year = 2022;
        int month = 12;
        int day = 22;
        boolean marry = false;

        System.out.println("이름 :" + name);
        System.out.println("생일 :" + year + "년" + month + "월" + day + "일");
        System.out.println("결혼여부 :" + marry);


        //문자열 덧셈
        String myString = "안녕하세요" + "코딩을 합시다.";
        System.out.println(myString);

        System.out.println("안녕하세요" + 28 + "살입니다.");
        System.out.println("결과는" + false + "입니다.");

        //\t 탭, \b 백스페이스, \n 줄바꿈, \r 줄바꿈, \f 폼피드
        //문자열 안에 \를 사용하면 큰따옴표를 출력한다
        System.out.println("플라톤은 \"국가도 인간도 다같다. 국가도 인간의 갖가지 성격이다\" 라고 말했다.");

        //숫자연산
        //+, -, *, /, %
        System.out.println(9 / 5); // 소숫점으로 계산하지않아서 정수형으로 나온다
        System.out.println(9.0 / 5); // 소수형으로 계산했을때는 소수점으로 결과가 나온다

        int a = 7;
        System.out.println(-a); // 음수값 출력
        System.out.println(++a); // a값의 증가
        System.out.println(--a); // a값의 증가

        int a = 6;
        int b = 7;
        System.out.println(a > b);
        System.out.println(a >= b);
        System.out.println(a < b);
        System.out.println(a <= b);
        System.out.println(a == b);
        System.out.println(a =! b);

        //and 연산자 둘다true여야 true출력
        System.out.println(true && true);
        System.out.println(true && false);
        System.out.println(false && true);
        System.out.println(false && false);

        //or 연산자 하나만 true면 true출력
        System.out.println(true || true);
        System.out.println(true || false);
        System.out.println(false || true);
        System.out.println(false || false);

        //not 연산자 true면 false (반전출력)
        System.out.println(!true);
        System.out.println(!false;
        System.out.println(!(false && (true || false))); //true출력

        // format과 printf은 뒤에 변수를 %s에 순서대로 입력해서 출력하게된다
        String name = "아이유";
        String name1 = "헤이즈";
        System.out.format("%s님 안녕하세요\n", name);
        System.out.format("%s님 %s님 반갑습니다\n", name, name1);
        System.out.println("--------------------");
        System.out.printf("%s님 안녕하세요\n", name);
        System.out.printf("%s님 %s님 반갑습니다\n", name, name1);


        //리터럴 소스코드의 고정된값
        //사이즈
        //정수 byte 1, short 2, int 4, long 8  실수 : float 4, double 8
        // 오른쪽에서 왼쪽으로는 형변환이 가능하지만 왼쪽에서 오른쪽은 형변환이 되지않는다
        int myInt = 123;
        byte myByte = 38;
        short myShort = 2;

        long myLong = 12345678910L;

        long e = 132;
        long f = 123L;

        float g = 3.14;
        float h = 3.14f;
        float i = 314f;

        double j = 3.14;
        double k = 314d;


        //형변환
        int a = 3;
        double b = (double) a; // 형변환이 가능한경우 앞에 (데이터형)을 넣어주면 형변환이 가능하다
        long c = (long) a;

        //데이터형이 형변환이 안되는걸 형변환하면 데이터손실을 일으킨다
        double pi = 3.14;
        int myInt = (int) pi;
        System.out.println(int) pi;

        int a = 9, b = 5;
        System.out.println((double) a / b); //원래는 1로출력되지만 double형으로 소숫점까지 출력된다

        //자바스크립트, 데이터베이스, 자바, html 평균구하기
        int jasct = 80, db = 65, java = 70, html = 55;
        double avg = (double) (jasct + db + java + html) / 4);
        System.out.println(avg);

        //조건문
        int myNumber = 13;
        if(myNumber % 2 == 0){ //조건부분
            System.out.println("Even Number");
        }else{
            System.out.println("Odd Number");
        }

        int myX = 10;
        int myY = 1;
        if(myX != 10 || myY % 2 != 0){ // 조건부분 1
            System.out.println(myX);
        }else if (myY == 1){ // 조건부분 2
            System.out.println(myY);
        }else {
            System.out.println(myX + myY);
        }

        // 1.a와 b가 같으면 "a와 b가 같습니다 a + b = a의값 출력"
        // 2.a와 b가 다르면 "a와 b가 같지않습니다를 출력"
        // 3. 위 조건 2의 출력문 이후에, a가 b보다 더 큰 경우 "a가 b보다 a,b의 차 만큼 더큽니다를 출력"
        // 4. 위 조건 2의 출력문 이후에, b가 a보다 더 큰 경우 "b가 a보다 a,b의 차 만큼 더큽니다를 출력"
        int a = 10;
        int b = 20;
        if (a == b){
            System.out.println("a + b = " + (a + b));
        } else if (a != b) {
            System.out.println("a와 b가 같지않습니다");
            if(a > b) {
                System.out.println("a가 b보다" + (a - b) + "차 만큼 더큽니다");
            } else if (b > a) {
                System.out.println("b가 a보다" + (b - a) + "만큼 더 큽니다");
            }
        }

        //switch
        switch (a % 3){
            case 0:
                System.out.println("C 구역입니다.");
                break;
            case 1:
                System.out.println("A 구역입니다");
                break;
            default:
                System.out.println("B 구역입니다");
                break; // break문이 switch문을 탈출시키게 해준다
        }

        //while문(반복문)
        //while문 안에도 break문을 넣어서 강제탈출가능하다
        int sum = 0, i = 1;
        while (sum < 10){ // sum이 10이상되면 탈출
            sum += i; // sum에 i더해서 저장
            i++; // i 1씩증가
        }
        System.out.println(sum);
        System.out.println(i);

        //10000미만의 정수중에서 153의 배수중 가장큰값을 출력한다
        int num = 10000, binum = 153;
        while (num % binum > 0 ){ // binum으로 나눴을때 0이하가되면 탈출하고 출력
            num--;
        }
        System.out.println(num);
    }

        //for문(반복문)
        for(int i = 1; i <= 10; i++){ // int i를 선언해서 10초과가 될때까지 i을 1씩증가
        System.out.println(i);
        }
        //구구단
        for(int i = 2; i < 10; i++){
            for(int j = 1; j < 10; j++)
                System.out.println("i * j =" + i*j);
        }


        //배열
        //자료형[] 배열이름 = new 자료형[개수]
        int[] arr = new int[10];
        int arr1[] = new int[10]; // 이렇게도 가능하다

        int[] arr2 = new int[] {101,102,103};
        int[] arr3 = new int[3] {101,102,103}; // 위와같다 다만 미리 배열자리를 만들어놓는것이다
        // 초기화 값없이 선언한 경우 정수는 0, 실수는 0.0, 객체 배열은 null로 초기화가 됩니다

        //따로따로 선언가능하다
        int[] arr4;
        arr4 = new int[5];
        arr4 = {1,2,3,4,5};

        //인덱스값으로 칸이 배열된다
        arr4[0] = 1;
        arr4[1] = 2;
        arr4[2] = 3;
        arr4[3] = 4;
        arr4[4] = 5;

        //배열하나 출력
        System.out.println(arr4[0]);


        int[] arr5 = {1,2,3,4,5};
        int[] arr6 = arr5.clone();
        // 원래는 같은주소값이라 실행되는 명령순서에 상관없이 값이 같게되는데 clone을 사용하면 다르게 사용가능하다

        arr5[100] = 100;
        System.out.println(arr5[0]);
        System.out.println(arr6[0]);
*/
        //foreach문
        //선언된 변수 i 값에 배열의 처음부터 끝까지 값을 넣어서 반복
        int[] arr = {1,2,3,4,5,6};
        for (int i : arr) {
            System.out.println(i);
        }


        //배열의 문자열
        String[] arr7 = new String[5];
        arr7[0] = "딸기";
        arr7[1] = "사과";
        arr7[2] = "수박";
        arr7[3] = "바나나";

        for (String fruit : arr7) {
            System.out.println(fruit);
        }

        //1. 크기가 30인 정수형 배열을 만들기
        //2. 배열의 첫 번째 칸부터 1001, 1002, 1003 ...... 1030순서대로 넣기
        //3. 크기가 4인 문자열형 배열 remains를 만들어 "Zero", "One", "Two", "Three"를 순서대로 넣기
        //4. 배열에 담긴 각 값을 4로 나눈 나머지를 인덱스로 생각하고 remains 배열에서 그 인덱스에 위치한 단어를 출력하기

        int num = 1001;
        int[] arr8 = new int[30];
        for(int i = 1; i < 31; i++){
            arr8[i] = num;
            num++;
            String[] arr9 = new String[4] {"Zero", "One", "Two","Three"};
            for (int j : arr8) {
                System.out.println(arr8[j % 4]);
            }

        }

}
