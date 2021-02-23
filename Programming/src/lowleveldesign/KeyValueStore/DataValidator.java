package lowleveldesign.KeyValueStore;

public class DataValidator {

    /**
     * Throws exception if no compatible data with type
     * @param dataType
     * @param data
     */
    public static void validateData(DataType dataType, Object data) {
        switch(dataType) {
            case INT:
                Integer.valueOf((Integer) data);
            case CHAR:
                Character.valueOf((Character) data);
            case DOUBLE:
                Double.valueOf((Double) data);
            case STRING:
                String.valueOf(data);
            case BOOLEAN:
                Boolean.valueOf((Boolean) data);
            default:

        }
    }
}
