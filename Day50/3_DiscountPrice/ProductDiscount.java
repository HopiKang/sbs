public class ProductDiscount {
    private String productName;
    private  int launchPrice;
    private int discountPrice;

    public ProductDiscount(String productName, int launchPrice){
        //생성장의 파라미터로 전달 받은 값들을 인스턴스 변수에 지정하기
        //discountPrice가 0% 보다 작거나 100% 보다 큰 경우 0으로 설정
        this(productName, launchPrice, 0);

    }

    public  ProductDiscount(String productName, int launchPrice, int discountPrice){
        //두번째 생성자는 discountPrice 의 기본값으로 0을 넣어주세요
        this.productName = productName;
        this.launchPrice = launchPrice;
        if (discountPrice < 0 || discountPrice > 100){
            discountPrice = 0;
        }
        this.discountPrice = discountPrice;
    }

    /*
    Getter 와 Setter 메소드
    productName, launchPrice 는  getter메소드만 만들기
    값을 지정해주는 것은 생성자에서 완료되었기 때문에 별도로 만들 필요가 없다
    discountPrice 는 바뀔 수 있기 때문에 getter 와 setter 메소드를 모두 만들기

    public int getDiscountedRate(){
        //할인가를 리턴해주는 메소드를 만들기
    }
    */
    public String getProductName(){
        return productName;
    }

    public int getLaunchPrice(){
        return launchPrice;
    }

    public void setDiscountPrice(int discountPrice){
        this.discountPrice = discountPrice;
    }

    public int getDiscountPrice(){
        return  discountPrice;
    }

    public int getDiscountRate(){
        return (int) (launchPrice * (1 - discountPrice / 100.0));
        // 형변환을 유의해야함(할인율이 들어가니 double 형으로 해야하기때문)
        // (double) discountPrice / 1s
    }






}
