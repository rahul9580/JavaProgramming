package sqllikedb;

import java.util.Objects;

public class StringMaxLengthConstraint  implements ColumnConstraint {
    int maxLen;

    public void setMaxLen(int maxLen) {
        this.maxLen = maxLen;
    }

    public int getMaxLen() {
        return maxLen;
    }

    @Override
    public boolean validate(String value) {
        if(Objects.nonNull(value) && value.length() <= maxLen) {
            return true;
        }
        return false;
    }

}
