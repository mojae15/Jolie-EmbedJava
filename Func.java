import jolie.runtime.JavaService;
import jolie.runtime.Value;
import java.util.Scanner;


public class Func extends JavaService{

    /**
     * Splits a string into an array
     * @param request
     * @return
     */
    public Value split(Value request){
        java.util.Scanner input = new Scanner(System.in);
        String s = "";
        String reg = "";

        // String s = request.getFirstChild("s").strValue();
        // String reg = request.getFirstChild("reg").strValue();

        System.out.println("Specify string to be split");
        

        s = input.nextLine();

        System.out.println("Specify regex");

        reg = input.nextLine();


        String[] res = s.split(reg);

        Value s_res = Value.create();

        for(String sT: res){
            s_res.getNewChild("s_array").setValue(sT);
        }

        return s_res;
    }

}