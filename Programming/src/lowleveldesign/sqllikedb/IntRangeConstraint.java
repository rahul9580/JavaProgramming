package lowleveldesign.sqllikedb;

public class IntRangeConstraint implements ColumnConstraint {
    int minValue;
    int maxValue;

    public void setMinValue(int minValue) {
        this.minValue = minValue;
    }

    public void setMaxValue(int maxValue) {
        this.maxValue = maxValue;
    }

    public int getMinValue() {
        return minValue;
    }

    public int getMaxValue() {
        return maxValue;
    }

    @Override
    public boolean validate(String value) {
        int v = Integer.valueOf(value);
        if(v >= minValue && v <= maxValue) {
            return true;
        }
        return false;
    }
}
