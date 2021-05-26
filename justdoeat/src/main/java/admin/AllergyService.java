package admin;

import java.util.List;

public interface AllergyService {
	List<AllergyVO> allergy_list();	//알러지 전체 리스트
	void allergy_insert(AllergyVO vo);//알러지 추가
	void allergy_delete(String a_material);//알러지 삭제
	void allergy_update(AllergyVO vo);//알러지 수정
	List<AllergyVO> search_allergy(AllergyVO vo);	//알러지 검색
	
	//알러지 링크 매기기
	List<String> allergyrank();

}
