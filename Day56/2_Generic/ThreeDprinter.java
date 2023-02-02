public class ThreeDprinter<T> {
    // Dirver3Dprint 클래스에서 <T>부분이 <ABSFilament> 로 전부 전달받게된다
    // 고로 불필요한 캐스팅을 안해도된다
    private T material;

    public T getMaterial(){
        return material;
    }

    public void setMaterial(T material){
        this.material = material;
    }

    @Override
    public String toString(){
        return material.toString();
    }
}
