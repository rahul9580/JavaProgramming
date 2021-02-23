package companies.walmart;

import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

class Charr implements Comparable<Charr> {
    Character c;
    int x;
    int y;
    double distance;
    @Override
    public int compareTo(Charr o) {
        return this.distance < o.distance ? -1 : 1;
    }
}

public class Walmart2 {

    public static int getUniqueChar(List<Charr> chars) {
        for(Charr charr : chars) {
            charr.distance = Math.sqrt(Math.pow(charr.x, 2) + Math.pow(charr.y, 2));
        }

        Collections.sort(chars);

        Set<Character> hash = new HashSet<>();
        int count = 0;
        int i = 0;
        while (i < chars.size()) {
            Charr charr = chars.get(i);
            if(hash.contains(charr.c)) {
                return count;
            } else {
                if(i==chars.size()-1) {
                    count++;
                } else {
                    double thisDistance = charr.distance;
                    int localCount = 0;
                    i++;
                    Charr nextChar = chars.get(i);
                    while(thisDistance == nextChar.distance) {
                        if(!hash.contains(nextChar.c)) {
                            localCount++;
                            hash.add(nextChar.c);
                        } else {
                           return count;
                        }
                        i++;
                    }
                    count+=localCount;
                }

            }
            i++;
        }

        return count;
    }
    public static void main(String[] args) {

    }
}
