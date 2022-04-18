package net.developia.spring03.service;

import net.developia.spring03.dto.Criteria;
import net.developia.spring03.dto.ReplyDTO;
import net.developia.spring03.dto.ReplyPageDTO;

import java.util.List;

public interface ReplyService {

	int register(ReplyDTO replyDTO);

	ReplyDTO get(Long rno);

	int modify(ReplyDTO replyDTO);

	int remove(Long rno);

	List<ReplyDTO> getList(Criteria cri, Long bno);
	
	ReplyPageDTO getListPage(Criteria cri, Long bno);

}
