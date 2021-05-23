package recommand;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RecommandServiceimpl implements RecommandService {
	
	@Autowired private RecommandDAO dao;
	
	@Override
	public String[] food_allergy(String m_nikname) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public RecommandDTO recommand_food(String num) {
		System.out.println("imp serviceimp : " + num);
		return dao.recommand_food(num);
	}

}