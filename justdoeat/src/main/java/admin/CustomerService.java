package admin;

import java.util.List;



public interface CustomerService {
	List<CustomerVO> customer_list();	//고개목록 전체 조회
	List<CustomerVO> customer_search(CustomerVO vo);	//고객 검색 조회
	CustomerVO customer_detail(int m_uq);	//고객상세정보 조회
	void customer_update(CustomerVO vo);	// 고객정보 변경 저장 처리
	void customer_delete(int m_uq);	//고객정보 삭제처리
}
