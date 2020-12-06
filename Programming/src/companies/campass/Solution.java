package companies.campass;

/*

https://public.karat.io/content/q093/wordlist.txt

The text file at the URL above lists common words in English, together with a count of their occurrence in a certain text. It is tab-delimited and newline-separated. The file is sorted with most common words at the top.

Write a function that, given parameters N and K, downloads the file and returns the N most common words of length [2..K] together with their occurrence counts.

# Sample usage with maximum word length 5, to find top 1000 words:
get_list(1000, 5)

# Expected output (in order, pseudodata):
[
  ['THE', 53097401461],
  ['OF',  30966074232],
  ['AND', 22632024504],
  # ...
  ['OWNED', 30008173],
  ['VARY', 29995673],
  ['AXIS', 29993153]
]



*/
import java.io.*;
import java.util.*;
import java.net.URL;

class WordCount {
    String word;
    long count;
}
public class Solution {
    public static void main(String[] argv) throws Exception {

        List<WordCount> wordCounts = get_list(1000, 5);
        for(WordCount wc : wordCounts) {
            System.out.println(wc.word + " " + wc.count);
        }

    }

    private static List<WordCount> get_list(int n, int k) throws Exception {
        String url = "https://public.karat.io/content/q093/wordlist.txt";
        List<WordCount> wordCounts = downlodFile(url);
        List<WordCount> filteredWordCounts = new ArrayList<>();

        int count = 0;
        // Assuming file is already sorted
        for(WordCount wordCount : wordCounts) {
            if(count==n) {
                break;
            }
            if(wordCount.word.length() >= 2 && wordCount.word.length() <= k) {
                filteredWordCounts.add(wordCount);
                count++;
            }
        }

        return filteredWordCounts;
    }

    private static List<WordCount> downlodFile(String urlString) throws Exception {
        List<WordCount> wordCounts = new ArrayList<>();
        URL url = new URL(urlString);
        BufferedInputStream bis = new BufferedInputStream(url.openStream());
        FileOutputStream fis = new FileOutputStream("hvuRand.txt");
        byte[] buffer = new byte[1024];

        int count = 0;
        while((count = bis.read(buffer, 0 , 1024)) != -1) {
            String line = new String(buffer);
            fis.write(buffer, 0, count);
        }
        bis.close();
        fis.close();

        BufferedReader br = new BufferedReader(new FileReader("hvuRand.txt"));
        String line = null;
        while((line = br.readLine()) != null) {
            String[] toks = line.split("\t");
            WordCount wordCount = new WordCount();
            wordCount.word = toks[0];
            wordCount.count = Long.valueOf(toks[1]);
            wordCounts.add(wordCount);
        }

        return wordCounts;
    }

}
