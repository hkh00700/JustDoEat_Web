package admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RestrantServiceImp implements RestrantService {
	@Autowired private RestrantDAO dao;
	
	@Override
	public int restrant_join(RestrantVO vo) {
		return dao.restrant_join(vo);
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
		return dao.ad_restrant_list();
	}

	@Override
	public RestrantVO ad_restrant_detail(int m_uq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int ad_restrant_delete(int m_uq) {
		// TODO Auto-generated method stub
		return 0;
	}

}
