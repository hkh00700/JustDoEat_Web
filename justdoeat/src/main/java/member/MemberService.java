package member;

import java.util.HashMap;

public interface MemberService {
	MemberVO member_login(HashMap<String, String> map); //로그인처리
	boolean member_social_id(MemberVO vo); 				//소셜로그인회원 존재여부
	boolean member_social_insert(MemberVO vo);			//소셜로그인시 회원정보 신규저장
	boolean member_social_update(MemberVO vo);			//소셜로그인시 회원정보 변경저장
	
	int member_join(MemberVO vo); 						//회원가입 회원정보 저장
	MemberVO member_load(String id);   					//마이페이지에서 회원정보보기
	int member_update(MemberVO vo); 					//내정보수정에서 회원정보수정저장
	boolean member_id_check(String id);					//아이디중복확인
	
	
}
