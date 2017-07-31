package Util;

/**
 * Created by menginar on 11.07.2017.
 */
public class Warnings {

    String[] Warnings = {
            "OPERATION SUCCESSFUL",
            "OPERATION FAILED",
            "OTHER OPERATIONS SUCCESSFUL",
            "OTHER OPERATIONS FAILED"
    };

    public String getWarnings(int indexException) {
        return Warnings[indexException];
    }
}
