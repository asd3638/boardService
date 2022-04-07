package net.developia.spring03.mapper;

import net.developia.spring03.dto.BoardDTO;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface BoardMapper {

    @Select("select * from board")
    public List<BoardDTO> getList();
}
