package member;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	
	
	@Autowired private MemberDAO dao;
	@Override
	public MemberVO member_login(HashMap<String, String> map) {
		return dao.member_login(map);
	}
	@Override
	public boolean member_social_id(MemberVO vo) {
		return dao.member_social_id(vo);
	}
	@Override
	public boolean member_social_insert(MemberVO vo) {
		return dao.member_social_insert(vo);
	}

	@Override
	public boolean member_social_update(MemberVO vo) {
		return dao.member_social_update(vo);
	}
	@Override
	public int member_join(MemberVO vo) {
		return dao.member_join(vo);
	}
	@Override
	public MemberVO member_load(String id) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int member_update(MemberVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public boolean member_id_check(String id) {
		return dao.member_id_check(id);
	}
	
	
	
	
}
