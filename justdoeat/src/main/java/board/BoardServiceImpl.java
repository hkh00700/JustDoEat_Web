package board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired private BoardDAO dao;
	
	@Override
	public int board_insert(BoardVO vo) {
		return dao.board_insert(vo);
	}

	@Override
	public BoardPage board_list(BoardPage page) {
		return dao.board_list(page);
	}

	@Override
	public BoardVO board_detail(int no) {
		return dao.board_detail(no);
	}

	@Override
	public int board_read(int no) {
		return dao.board_read(no);
	}

	@Override
	public int board_update(BoardVO vo) {
		return dao.board_update(vo);
	}

	@Override
	public int board_delete(int no) {
		return dao.board_delete(no);
	}

	@Override
	public BoardVO board_detail_no(int no) {
		return dao.board_detail_no(no);
	}



}
