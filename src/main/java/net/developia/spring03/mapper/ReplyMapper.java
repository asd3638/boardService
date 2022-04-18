package net.developia.spring03.mapper;

import net.developia.spring03.dto.Criteria;
import net.developia.spring03.dto.ReplyDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReplyMapper {

	int insert(ReplyDTO replyDTO);

	ReplyDTO read(Long bno);

	int delete(Long bno);

	int update(ReplyDTO reply);

	List<ReplyDTO> getListWithPaging(@Param("cri") Criteria cri, @Param("bno") Long bno);

	int getCountByBno(Long bno);
}
