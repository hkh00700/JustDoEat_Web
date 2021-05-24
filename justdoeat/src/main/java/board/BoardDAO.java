package board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO implements BoardService {
	@Autowired private SqlSession sql;
	
	@Override
	public int board_insert(BoardVO vo) {
		return sql.insert("board.mapper.insert", vo);
	}

	@Override
	public BoardPage board_list(BoardPage page) {
		page.setTotalList( 
		(Integer)sql.selectOne("board.mapper.totalList", page) );
		List<BoardVO> list = sql.selectList("board.mapper.list", page); 
		page.setList(list);
		for (BoardVO boardVO : page.getList()) {
			System.out.println(boardVO.getM_nickname());
		}
		return page;	
	}
	

	@Override
	public BoardVO board_detail(int no) {
		return sql.selectOne("board.mapper.detail", no);
	}

	@Override
	public int board_read(int no) {
		return sql.update("board.mapper.read", no);
	}

	@Override
	public int board_update(BoardVO vo) {
		return sql.update("board.mapper.update", vo);
	}

	@Override
	public int board_delete(int no) {
		return sql.delete("board.mapper.delete", no);
	}

	

}
