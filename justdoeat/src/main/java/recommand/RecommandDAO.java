package recommand;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RecommandDAO implements RecommandService {
	@Autowired private SqlSession sql;

	@Override
	public String[] food_allergy(String m_nikname) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public RecommandDTO recommand_food(String num) {
	
		return sql.selectOne("recommand.mapper.food", num);
	}
	

}
