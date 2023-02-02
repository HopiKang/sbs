public class TestString {
    public static void main(String[] args) {
        StringConcat impl = new StringConcatImpl();
        impl.stringConcat("hello", "JAVA");

        StringConcat lambdaImpl = (s1, s2) -> System.out.println(s1 + " " + s2);
        lambdaImpl.stringConcat("HELLO", "lambdaJava");

    }
}
