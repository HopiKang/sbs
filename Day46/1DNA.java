public class Main {
    public static void main(String[] args) {
        /*
        염기 서열 (DNA)
        RUFF, TTUF, UFYY 몇개가 있는지 찾기
        */

        String dna = "FURYYFYYYFYYRYFFYYRYYYUUUFRFYRFFFURRUYUFFRFRFUFYYU"
                + "YYUYFYYYFFYRUURRRRRURRRURRRURRRUUUFUYUFUFRYRYUYRYR"
                + "FRYUYRYUFFYRUFUFRFYUFRFFYUYYURYRYUFYRYUYRFYUFYYRRF"
                + "UYYRYYYRFFFYRYYFFRFURRRYUYYYRYYYUUFRUFYRUFFUYRUYUF"
                + "FYUYURFYYUYFUYUYYYUFYRUURRRRRRURRRRYRFRFUUFRYUUFFR"
                + "YRRFYRUYFRRFYYYURFYRFFRURYUUUYYYYRFFFYRYUURYUURYYR"
                + "RYYUYYRYUFYYRYYYYUUFRURRFFFFRRUYUFFYURFUFYRUYYUYUY"
                + "RYUFYYYRUFYYRUYRRFUUUYFRFRRYUFUFYURRRUUFRRUYYYRUYU"
                + "FRRFFFYUUUFRYURYRUUYUYUUUFYYYRRRRRURUFRUURUUUURFRR"
                + "FRURURYRYURFRFURRRURRFUURURRFRRUYRFUUUFRFUFUUUYUFY"
                + "URFFRRFYURFUUUFFUFFYUYUFRYFUFYYUFFYUYUFYYRFFFYFYUF"
                + "UFYFUFUYRYUUUUUUUFUUUUFFYYUFFYFYUYRFFYRYUYFYYRFRUU"
                + "RYYYUFYURRRYFFFUFFYRFUFFYFFFRFFURYUYYRFUFFRYUFFUFR"
                + "RYUUFUYYUFYYRUFYYUUYURFFRFUUUYYYYFRYRYRUYRUUUURUYU"
                + "UUUURRUUYYFFFYFRFURFFYUFFRFYYRFRUURYYYUFYRUYRRFFFU"
                + "FFYRFUFFYUFFUFUURYFYRRFUUYYUFFUFFYFFUFFRRFYUFFFUFY"
                + "YUUFURFFYFYYUYRFYUYRYYUFYYRFFFYFURUFUFRFUFUYRYYFRY"
                + "RYUFUUUUUUUUFUUUUFUUUYFUFFYUYUFRYFYURFYUYURFRUFRYY"
                + "YUFRRUYRRFUFUFFYRUUFFYUFFUFFURYRYRRFUFYYYUUFUFRRRF"
                + "UFRYYUFYYRFUUYUUYURUFYUUFUYURYURYRYRUUUURRRUUUUUUF"
                + "FFYYFFFYUYUFRFFYRYUYUYYRFRUURYYYUFYUYRRRFFFUFFRFFU"
                + "FFRFFFRUFURYUYYRFUYFRYUFFUFRRFFUUUYYUFYYRFFYRUUYUR";

        char[] charArray = dna.toCharArray();

        int RUFF = 0, TTUF = 0, UFYY = 0;

        char[] chararry = new char[4];

        for(int i = 0; i < dna.length() - 3; i++){
            for(int j = 0; j < dna.length(), j++){
                chararry[j] = charArray[i + j];
            }

            String arry = new String(chararry);

            switch (arry){
                case "RUFF";
                    RUFF++;
                    break;
                case "TTUF";
                    TTUF++;
                    break;
                case "UFYY";
                    UFYY++;
                    break;
            }
        }
        System.out.println("RUFF :" + RUFF);
        System.out.println("TTUF :" + TTUF);
        System.out.println("UFYY :" + UFYY);
    }



