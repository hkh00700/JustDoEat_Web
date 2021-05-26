package admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AllergyServiceImp implements AllergyService {
	@Autowired private AllergyDAO dao;
	
	@Override
	public List<AllergyVO> allergy_list() {
		return dao.allergy_list();
	}

	@Override
	public void allergy_insert(AllergyVO vo) {
		dao.allergy_insert(vo);
	}

	@Override
	public void allergy_delete(String a_material) {
		dao.allergy_delete(a_material);
	}

	@Override
	public void allergy_update(AllergyVO vo) {
		dao.allergy_update(vo);
	}

	@Override
	public List<String> allergyrank() {
		return dao.allergyrank();
	}

	@Override
	public List<AllergyVO> search_allergy(AllergyVO vo) {
		return dao.search_allergy(vo);
	}


	
}
