package net.developia.spring03.mapper;

import net.developia.spring03.dto.Criteria;
import net.developia.spring03.dto.ReplyDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReplyMapper {

	public int insert(ReplyDTO replyDTO);

	public ReplyDTO read(Long bno);

	public int delete(Long bno);

	public int update(ReplyDTO reply);

	public List<ReplyDTO> getListWithPaging(@Param("cri") Criteria cri, @Param("bno") Long bno);

	public int getCountByBno(Long bno);
}
