package co.kr.brain21c.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class admin {
	private String userid;
	private String username;
	private String email;
	private String password;
	private String last_login_time;
	private String register_time;
	private String update_time;
	
	public admin(String userId, String userName, String email, String password, String last_login_time, String register_time, String update_time) {
		this.userid = userId;
		this.username = userName;
		this.email = email;
		this.password = password;
		this.last_login_time = last_login_time;
		this.register_time = register_time;
		this.update_time = update_time;
		
	}

}
