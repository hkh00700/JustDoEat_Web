package admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AllergyDAO implements AllergyService {
	@Autowired private SqlSession sql;
	
	
	@Override
	public List<AllergyVO> allergy_list() {
		return sql.selectList("admin.mapper.alist");
	}

	@Override
	public void allergy_insert(AllergyVO vo) {
		sql.insert("admin.mapper.ainsert", vo);
	}

	@Override
	public void allergy_delete(String a_material) {
		sql.delete("admin.mapper.adelete", a_material);
	}

	@Override
	public void allergy_update(AllergyVO vo) {
		System.out.println(vo.getA_material());
		System.out.println(vo.getA_category() + "바쁘네");
		sql.update("admin.mapper.aupdate", vo);
	}

	@Override
	public List<String> allergyrank() {
		return sql.selectList("admin.mapper.malist");
	}

	@Override
	public List<AllergyVO> search_allergy(AllergyVO vo) {
		return sql.selectList("admin.mapper.salist", vo);
	}


}
