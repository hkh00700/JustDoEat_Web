package member;

import java.util.HashMap;

public interface MemberService {
	MemberVO member_login(HashMap<String, String> map); //로그인처리
}
