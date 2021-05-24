package member;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO implements MemberService {
	
	@Autowired private SqlSession sql;
	
	@Override
	public MemberVO member_login(HashMap<String, String> map) {
		return sql.selectOne("member.mapper.login", map);
	}
	
	@Override
	public boolean member_social_id(MemberVO vo) {
		return (Integer)sql.selectOne("member.mapper.social_id", vo) == 0 
				? false : true;
	}

	@Override
	public boolean member_social_insert(MemberVO vo) {
		return sql.insert("member.mapper.social_insert", vo)>0 
				? true : false;
	}

	@Override
	public boolean member_social_update(MemberVO vo) {
		return sql.update("member.mapper.social_update", vo)>0 
				? true : false;
	}


	@Override
	public int member_join(MemberVO vo) {
		return sql.insert("member.mapper.join", vo);
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
		return (Integer)sql.selectOne("member.mapper.id_check", id)==0 
				? true : false;
	}
	
}
