package admin;

import java.util.List;

public interface RestrantService {
	
	int restrant_join(RestrantVO vo); //가게 등록
	RestrantVO restrant_detail(int m_uq); //자기 가게 내용 보기
	RestrantVO restrant_modify(RestrantVO vo); //가게 정보 수정
	int restrant_delete_req(int m_uq);//가게 삭제 요청
	
	List<RestrantVO> ad_restrant_list();//관리자전체 가게 보기
	RestrantVO ad_restrant_detail(int r_uq);//관리자 가게 내용 자세히보기
	int ad_restrant_delete(int r_uq);//관리자 가게 삭제
	int ad_rstrant_modify(RestrantVO vo);	//관리자가 가게 정보 수정
	List<RestrantVO> ad_restrant_search(RestrantVO list);	//관리자가 가게 정보 검색

	
	

}
