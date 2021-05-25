package member;

import java.util.HashMap;

public interface MemberService {
	MemberVO member_login(HashMap<String, String> map); 
	boolean member_social_id(MemberVO vo); 				
	boolean member_social_insert(MemberVO vo);			
	boolean member_social_update(MemberVO vo);			
	

	int member_join(MemberVO vo); 						//회원가입 회원정보 저장
	MemberVO member_load(String id);   					//마이페이지에서 회원정보보기
	boolean member_update(MemberVO vo); 					//내정보수정에서 회원정보수정저장
	boolean member_id_check(String id);					//아이디중복확인
	boolean member_nik_check(String m_nickname);		//닉네임중복확인

	
	
}
