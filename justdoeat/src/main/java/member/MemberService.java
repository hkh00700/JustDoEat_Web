package member;

import java.util.HashMap;

public interface MemberService {
	MemberVO member_login(HashMap<String, String> map); 
	boolean member_social_id(MemberVO vo); 				
	boolean member_social_insert(MemberVO vo);			
	boolean member_social_update(MemberVO vo);			
	
	int member_join(MemberVO vo); 						
	MemberVO member_load(String id);   					
	int member_update(MemberVO vo); 					
	boolean member_id_check(String id);					
	
	
}
