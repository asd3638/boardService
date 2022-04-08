package net.developia.spring03.service;

import net.developia.spring03.dto.Criteria;
import net.developia.spring03.dto.ReplyDTO;
import net.developia.spring03.dto.ReplyPageDTO;

import java.util.List;

public interface ReplyService {

	public int register(ReplyDTO replyDTO);

	public ReplyDTO get(Long rno);

	public int modify(ReplyDTO replyDTO);

	public int remove(Long rno);

	public List<ReplyDTO> getList(Criteria cri, Long bno);
	
	public ReplyPageDTO getListPage(Criteria cri, Long bno);

}
