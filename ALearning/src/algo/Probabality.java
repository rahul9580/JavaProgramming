package algo;

public class Probabality {
	
	public static void main(String[] args) {
		int m = 1;
		int n = 2;
		
		float modd = 0;
		float meven = 0;
		float nodd = 0;
		float neven = 0;
		if(m%2 == 0){
			modd = 0.5f;
			meven = 0.5f;
		} else {
			modd = ((m+1)/2)/m;
			meven = ((m-1)/2)/m;
		}
		
		if(n%2 == 0){
			nodd = 0.5f;
			neven = 0.5f;
		} else {
			nodd = ((n+1)/2)/n;
			neven = ((n-1)/2)/n;
		}
		
		float res = modd*neven + meven*nodd;
		
		rational(res);
	}

	
	public static void rational(float d) {
        String s = String.valueOf(d);
        int digitsDec = s.length() - 1 - s.indexOf('.');
        int denom = 1;
        for (int i = 0; i < digitsDec; i++) {
            d *= 10;    
            denom *= 10;
        }

        int num = (int) Math.round(d);
        int g = gcd(num, denom);
        Pojo pojo = new Pojo();
        pojo.num = num / g;
        pojo.denom = denom /g;
    }


	public static int gcd(int num, int denom) {

		int r;
		while (denom != 0) {
			r = num % denom;
			num = denom;
			denom = r;
		}
		return num;
	}
}

class Pojo {
	int num;
	int denom;
}
