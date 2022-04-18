package net.developia.spring03.service;

import net.developia.spring03.dto.BoardAttachDTO;
import net.developia.spring03.dto.BoardDTO;
import net.developia.spring03.dto.Criteria;

import java.util.List;

public interface BoardService {

	void register(BoardDTO board);

	BoardDTO get(Long bno);

	boolean modify(BoardDTO board);

	boolean remove(Long bno);

	List<BoardDTO> getList(Criteria cri);

	int getTotal(Criteria cri);

	List<BoardAttachDTO> getAttachList(Long bno);

	void updateReadCount(Long bno);

}

