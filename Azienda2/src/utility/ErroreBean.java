package utility;

import java.io.Serializable;



public class ErroreBean implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String mex;

	public ErroreBean() {
		this.mex = "";
	}

	public ErroreBean(String mex) {
		super();
		this.mex = mex;
	}

	public String getMex() {
		return mex;
	}

	public void setMex(String mex) {
		this.mex = mex;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}	
	
	
	
}
