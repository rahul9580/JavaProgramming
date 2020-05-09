package scripts;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 
 */

/**
 * @author delhivery
 *
 */
public class CompareTwoFiles {

	public static void main(String[] args) {

		String athenaFile = "/home/delhivery/Desktop/DatatoMAtch/athena-18-19.csv";

		String monfoFile = "/home/delhivery/Desktop/DatatoMAtch/mongo-18-19.csv";

		String athenaMinusMongoFile = "/home/delhivery/Desktop/DatatoMAtch/athenaMinusMongoFile.csv";

		String mongoMinusAthenaFile = "/home/delhivery/Desktop/DatatoMAtch/mongoMinusAthenaFile.csv";

		BufferedReader br1 = null;
		BufferedReader br2 = null;

		BufferedWriter wr1 = null;
		BufferedWriter wr2 = null;
		String line = "";

		try {

			List<String> athenaMinusMongo = new ArrayList<>();
			List<String> mongoMinusAthena = new ArrayList<>();

			Map<String, Boolean> athenaMap = new HashMap<>();
			Map<String, Boolean> mongoMap = new HashMap<>();

			br1 = new BufferedReader(new FileReader(athenaFile));
			while ((line = br1.readLine()) != null) {
				// line = "\"" + line.trim() + "\"";
				line = line.trim();
				athenaMap.put(line, true);
			}

			br2 = new BufferedReader(new FileReader(monfoFile));
			while ((line = br2.readLine()) != null) {
				//String s[] = line.split(",");
				line = line.trim();
				mongoMap.put(line, true);
				if (athenaMap.get(line) == null)
					mongoMinusAthena.add(line);

			}

			br1 = new BufferedReader(new FileReader(athenaFile));
			while ((line = br1.readLine()) != null) {
				// line = "\"" + line.trim() + "\"";
				line = line.trim();
				if (mongoMap.get(line) == null)
					athenaMinusMongo.add(line);
			}

			System.out.println(athenaMinusMongo.size());
			System.out.println(mongoMinusAthena.size());

			wr1 = new BufferedWriter(new FileWriter(athenaMinusMongoFile));
			wr2 = new BufferedWriter(new FileWriter(mongoMinusAthenaFile));
			for(String s : athenaMinusMongo) {
				wr1.write(s+"\n");
			}
		
			for(String s : mongoMinusAthena) {
				wr2.write(s+"\n");
			}
			
			/*
			 * for(String s : mongoMinusAthena) { System.out.println(s); }
			 */

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (br1 != null) {
				try {
					br1.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}

			if (br2 != null) {
				try {
					br2.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (wr1 != null) {
				try {
					wr1.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (wr2 != null) {
				try {
					wr2.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

	}

}
