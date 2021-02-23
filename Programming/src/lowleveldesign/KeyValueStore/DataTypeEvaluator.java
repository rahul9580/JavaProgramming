package lowleveldesign.KeyValueStore;

public class DataTypeEvaluator {

    public static DataType evaluateDataType(Object value) {
        if(isBoolean(value)) {
            return DataType.BOOLEAN;
        } else if(isCharacter(value)) {
            return DataType.CHAR;
        } else if(isInteger(value)) {
            return DataType.INT;
        } else if(isDouble(value)) {
            return DataType.DOUBLE;
        } else if(isString(value)) {
            return DataType.STRING;
        }
        return DataType.NAN;
    }

    private static boolean isBoolean(Object data) {
        try {
            Boolean.valueOf((Boolean) data);
            return true;
        } catch (ClassCastException e) {
            return false;
        }
    }

    private static boolean isCharacter(Object data) {
        try {
            Character.valueOf((Character) data);
            return true;
        } catch (ClassCastException e) {
            return false;
        }
    }

    private static boolean isInteger(Object data) {
        try {
            Integer.valueOf((Integer) data);
            return true;
        } catch (ClassCastException e) {
            return false;
        }
    }

    private static boolean isDouble(Object data) {
        try {
            Double.valueOf((Double) data);
            return true;
        } catch (ClassCastException e) {
            return false;
        }
    }

    private static boolean isString(Object data) {
        try {
            String.valueOf((String) data);
            return true;
        } catch (ClassCastException e) {
            return false;
        }
    }
}
