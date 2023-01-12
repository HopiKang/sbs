public class Main {
    public static void main(String[] args) {
        ProductDiscount p1 = new ProductDiscount("BMW ix", 14400000);
        ProductDiscount p2 = new ProductDiscount("BMW 5", 70000000, 15);
        ProductDiscount p3 = new ProductDiscount("BMW 3", 55000000, 20);

        System.out.println(p1.getProductName() + "의 할인율 : " + p1.getDiscountPrice() + "%");
        System.out.println(p2.getProductName() + "의 할인율 : " + p2.getDiscountPrice() + "%");
        System.out.println(p3.getProductName() + "의 정상가격 : " + p3.getLaunchPrice() + "원");
        System.out.println(p3.getProductName() + "의 할인가격 : " + p3.getDiscountPrice() + "원");
        System.out.println("특별 프로모션 진행" + p3.getProductName() + "의 할인율이 50% 입니다");
        p3.setDiscountPrice(50);
        System.out.println(p3.getProductName() + "의 할인가격 :" + p3.getDiscountRate() + "원");
    }
}
