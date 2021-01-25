import java.util.Scanner
public class prog3 {
	public static void main(String[] args){
	    double[] array={-2,98,0.36,7};
	    double large=array[0];

	    for(double n: array){
		    if(large<n){
			    large=n;
		    }
	    }
	   System.out.println("%f",large);
	    
	}
}	

		
