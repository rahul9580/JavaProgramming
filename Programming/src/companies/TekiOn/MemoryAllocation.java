package companies.TekiOn;

import java.util.*;

public class MemoryAllocation {

    static PriorityQueue<Memory> freeMemoryHeap = new PriorityQueue<>();
    static Map<String, Memory> usedMemoryMap = new HashMap<>();
    static Random random = new Random(10000000);

    private static int free(String ref) {

        Memory memory = usedMemoryMap.get(ref);
        if(null == memory) {
            return -1;
        }

        freeMemoryHeap.offer(memory);
        return 1;
    }

    private static String allocate(long size) {
        if(freeMemoryHeap.size() == 0) {
            return "-1";
        }
        Memory memory = freeMemoryHeap.poll();
        if(memory.sizeInBytes < size) {
            return "-1";
        }

        Memory newMemory = new Memory();
        newMemory.sizeInBytes = memory.sizeInBytes - size;
        newMemory.initialPosition = memory.initialPosition + size;
        freeMemoryHeap.offer(newMemory);

        Memory usedMemory = new Memory();
        usedMemory.sizeInBytes = size;
        usedMemory.initialPosition = memory.initialPosition;

        String randNumber = String.valueOf(random.nextInt());
        usedMemoryMap.put(randNumber, usedMemory);

        return randNumber;
    }

    public void init(long size) {
        Memory memory = new Memory();
        memory.initialPosition = 0;
        memory.sizeInBytes = size;
        freeMemoryHeap.offer(memory);
    }

    public static void main(String[] args) {

    }

}
class Memory {
    long initialPosition;
    long sizeInBytes;
}