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
		return dao.member_load(id);
	}
	@Override
	public boolean member_update(MemberVO vo) {
		return dao.member_update(vo);
	}
	@Override
	public boolean member_id_check(String m_id) {
		return dao.member_id_check(m_id);
	}
	@Override
	public boolean member_nik_check(String m_nickname) {
		return dao.member_nik_check(m_nickname);
	}
	@Override
	public boolean member_email_check(String m_email) {
		return dao.member_email_check(m_email);
	}
	
	
	
	
}
