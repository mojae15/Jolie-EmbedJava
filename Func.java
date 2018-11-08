import jolie.runtime.JavaService;
import jolie.runtime.Value;


public class Func extends JavaService{

    /**
     * Splits a string into an array
     * @param request
     * @return
     */
    public Value split(Value request){
        String s = request.getFirstChild("s").strValue();
        String reg = request.getFirstChild("reg").strValue();
        
        String[] res = s.split(reg);

        Value s_res = Value.create();

        for(String sT: res){
            s_res.getNewChild("s_array").setValue(sT);
        }

        return s_res;
    }

}