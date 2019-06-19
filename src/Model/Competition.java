package Model;

public class Competition {
	private Integer id;
	private String competition_name;
	private Integer competition_status;
	private Integer vote_type;
	private String vote_start;
	private String vote_end;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCompetition_name() {
		return competition_name;
	}
	public void setCompetition_name(String competition_name) {
		this.competition_name = competition_name;
	}
	public Integer getCompetition_status() {
		return competition_status;
	}
	public void setCompetition_status(Integer competition_status) {
		this.competition_status = competition_status;
	}
	public Integer getVote_type() {
		return vote_type;
	}
	public void setVote_type(Integer vote_type) {
		this.vote_type = vote_type;
	}
	public String getVote_start() {
		return vote_start;
	}
	public void setVote_start(String vote_start) {
		this.vote_start = vote_start;
	}
	public String getVote_end() {
		return vote_end;
	}
	public void setVote_end(String vote_end) {
		this.vote_end = vote_end;
	}
	
	
}
