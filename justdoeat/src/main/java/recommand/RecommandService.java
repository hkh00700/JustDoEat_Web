package recommand;

public interface RecommandService {
	String[] food_allergy(String m_nikname);	//회원정보의 알레르기 가져오기
	RecommandDTO recommand_food(String num);	//테이블에서 음식 추천 받기
}
