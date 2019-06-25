package Model;

public class Vote {
	private Integer id;
	private String voter_ip;
	private Integer voted_comid;
	private Integer voted_contestantid;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getVoter_ip() {
		return voter_ip;
	}
	public void setVoter_ip(String voter_ip) {
		this.voter_ip = voter_ip;
	}
	public Integer getVoted_comid() {
		return voted_comid;
	}
	public void setVoted_comid(Integer voted_comid) {
		this.voted_comid = voted_comid;
	}
	public Integer getVoted_contestantid() {
		return voted_contestantid;
	}
	public void setVoted_contestantid(Integer voted_contestantid) {
		this.voted_contestantid = voted_contestantid;
	}
	
}
