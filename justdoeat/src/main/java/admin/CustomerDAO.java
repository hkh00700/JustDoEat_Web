package admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CustomerDAO implements CustomerService{
	@Autowired private SqlSession sql;
	
	@Override
	public List<CustomerVO> customer_list() {
		return sql.selectList("admin.mapper.list");
	}

	@Override
	public CustomerVO customer_detail(int m_uq) {
		System.out.println(m_uq + "m_uq");
		return sql.selectOne("admin.mapper.detail", m_uq);
	}

	@Override
	public void customer_update(CustomerVO vo) {
		sql.update("admin.mapper.update", vo);
	}

	@Override
	public void customer_delete(int m_uq) {
		sql.delete("admin.mapper.delete", m_uq);
	}

	@Override
	public List<CustomerVO> customer_search(CustomerVO vo) {
		System.out.println(vo.getKeyword() + vo.getSearch());
		return sql.selectList("admin.mapper.search", vo);
	}




}
