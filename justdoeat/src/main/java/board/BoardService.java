package board;

public interface BoardService {
	
	int board_insert(BoardVO vo); //신규 방명록 저장
	BoardPage board_list(BoardPage page); //방명록 목록 조회
	BoardVO board_detail(int no); //방명록 상세 조회
	int board_read(int no); //방명록 글 조회수 증가 처리
	int board_update(BoardVO vo); //방명록 수정저장 처리 
	int board_delete(int no); //방명록 글 삭제 처리
	
}
