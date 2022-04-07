package net.developia.spring03.service;

import java.util.List;

import net.developia.spring03.dto.BoardAttachDTO;
import net.developia.spring03.dto.BoardDTO;
import net.developia.spring03.dto.Criteria;

public interface BoardService {

	public void register(BoardDTO board);

	public BoardDTO get(Long bno);

	public boolean modify(BoardDTO board);

	public boolean remove(Long bno);

	// public List<BoardDTO> getList();

	public List<BoardDTO> getList(Criteria cri);

	//추가
	public int getTotal(Criteria cri);

	public List<BoardAttachDTO> getAttachList(Long bno);

	public void removeAttach(Long bno);

}
