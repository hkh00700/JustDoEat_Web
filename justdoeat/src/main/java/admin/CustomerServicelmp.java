package admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustomerServicelmp implements CustomerService {
	@Autowired private CustomerDAO dao;
	
	@Override
	public List<CustomerVO> customer_list() {
		return dao.customer_list();
	}

	@Override
	public CustomerVO customer_detail(int m_uq) {
		return dao.customer_detail(m_uq);
	}

	@Override
	public void customer_update(CustomerVO vo) {
		dao.customer_update(vo);
		
	}

	@Override
	public void customer_delete(int m_uq) {
		dao.customer_delete(m_uq);
	}

	@Override
	public List<CustomerVO> customer_search(CustomerVO vo) {
		return dao.customer_search(vo);
	}



}
