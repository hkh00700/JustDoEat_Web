package admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RestrantDAO implements RestrantService{
	@Autowired private SqlSession sql;
	
	
	@Override
	public int restrant_join(RestrantVO vo) {
		return sql.insert("admin.mapper.resInsert", vo);
	}

	@Override
	public RestrantVO restrant_detail(int m_uq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public RestrantVO restrant_modify(RestrantVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int restrant_delete_req(int m_uq) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<RestrantVO> ad_restrant_list() {
		return sql.selectList("admin.mapper.rlist");
	}

	@Override
	public RestrantVO ad_restrant_detail(int r_uq) {
		return sql.selectOne("admin.mapper.r_detail", r_uq);
	}

	@Override
	public int ad_restrant_delete(int r_uq) {
		return sql.delete("admin.mapper.r_delete", r_uq);
	}

	@Override
	public int ad_rstrant_modify(RestrantVO vo) {
		return sql.update("admin.mapper.r_modify", vo);
	}

	@Override
	public List<RestrantVO> ad_restrant_search(RestrantVO list) {
		return sql.selectList("admin.mapper.slist", list);
	}

	@Override
	public int ad_restrant() {
		return (Integer)sql.selectOne("admin.mapper.rsall");
	}

	@Override
	public int today_rstrant() {
		return (Integer)sql.selectOne("admin.mapper.rstoday");
	}

}
