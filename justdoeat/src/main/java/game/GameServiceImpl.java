package game;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GameServiceImpl implements GameService {

	@Autowired private GameDAO dao;
	
	@Override
	public List<GameDTO> eatSelectRandom() {
		return dao.eatSelectRandom();
	}

}
