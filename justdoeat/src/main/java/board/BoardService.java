package board;

public interface BoardService {
	
	int board_insert(BoardVO vo); 
	BoardPage board_list(BoardPage page); 
	BoardVO board_detail(int no); 
	int board_read(int no); 
	int board_update(BoardVO vo); 
	int board_delete(int no); 
	
}
