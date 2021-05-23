package game;

public class RandomDTO {
	int max = 360;
	int random =(int)(Math.random()*max);
	float fromAngle = random+2160;
	
	public int getMax() {
		return max;
	}
	public void setMax(int max) {
		this.max = max;
	}
	public int getRandom() {
		return random;
	}
	public float getFromAngle() {
		return fromAngle;
	}
	public void setFromAngle(float fromAngle) {
		this.fromAngle = fromAngle;
	}
	
	
}
