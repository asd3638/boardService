package net.developia.spring03.mapper;

import net.developia.spring03.dto.BoardDTO;
import net.developia.spring03.dto.Criteria;

import java.util.List;

public interface BoardMapper {

    List<BoardDTO> getList();

    List<BoardDTO> getListWithPaging(Criteria cri);

    void insert(BoardDTO board);

    Integer insertSelectKey(BoardDTO board);

    BoardDTO read(Long bno);

    int delete(Long bno);

    int update(BoardDTO board);

    int getTotalCount(Criteria cri);

    void updateReadCount(Long bno);
}