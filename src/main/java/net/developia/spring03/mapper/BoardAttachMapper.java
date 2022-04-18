package net.developia.spring03.mapper;

import net.developia.spring03.dto.BoardAttachDTO;

import java.util.List;

public interface BoardAttachMapper {

	void insert(BoardAttachDTO vo);

	void delete(String uuid);

	List<BoardAttachDTO> findByBno(Long bno);

	void deleteAll(Long bno);
}