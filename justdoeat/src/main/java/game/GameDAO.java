package game;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GameDAO implements GameService {
	@Autowired private SqlSession sql;
	
	//32개 음식받기
	public List<GameDTO> eatSelectRandom() {
		List<GameDTO> list = sql.selectList("game.mapper.list");
		for(GameDTO dto : list) {
			System.out.println("list : " + dto.getFood());
		}
		return list;
	}



}
