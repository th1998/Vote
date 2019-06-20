package Model;

import java.util.List;

public class PageResult {
	private List<Contestants> con;
	private List<Con_pk> cpk;

	public List<Con_pk> getCpk() {
		return cpk;
	}

	public void setCpk(List<Con_pk> cpk) {
		this.cpk = cpk;
	}

	public List<Contestants> getCon() {
		return con;
	}

	public void setCon(List<Contestants> con) {
		this.con = con;
	}


	
	
}
