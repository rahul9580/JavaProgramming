package goal20;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class EightHouses {

    public List<Integer> cellCompete(int[] states, int days) {
        List<Integer> out = new ArrayList<>();
        if (days == 0) {
            for(int i : states) {
                out.add(i);
            }
            return out;
        }
        if(states.length == 1) {
            out.add(0);
            return  out;
        }

        Integer newStates[] = new Integer[states.length];
        int day = 0;
        while(day < days) {
            if(states[1] == 0) {
                newStates[0] = 0;
            } else {
                newStates[0] = 1;
            }
            if(states[states.length - 2] == 0) {
                newStates[states.length - 1] = 0;
            } else {
                newStates[states.length - 1] = 1;
            }

            for(int i = 1; i < states.length - 1; i++) {
                if(states[i-1] == states[i+1]) {
                    newStates[i] = 0;
                } else {
                    newStates[i] = 1;
                }
            }

            for(int i = 0; i < newStates.length; i++) {
                states[i] = newStates[i];
            }
            day++;
        }

        out = Arrays.asList(newStates);
        return out;
    }

    public static void main(String[] args) {
    }
}
