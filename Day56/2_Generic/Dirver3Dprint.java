public class Dirver3Dprint {
    public static void main(String[] args) {
        ThreeDprinter<ABSFilament> absFilament = new ThreeDprinter<ABSFilament>();
        absFilament.setMaterial(new ABSFilament());
        System.out.println(absFilament);
    }


}
