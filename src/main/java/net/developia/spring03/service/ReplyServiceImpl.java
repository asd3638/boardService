package net.developia.spring03.service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.developia.spring03.dto.Criteria;
import net.developia.spring03.dto.ReplyDTO;
import net.developia.spring03.dto.ReplyPageDTO;
import net.developia.spring03.mapper.ReplyMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService {

  
  private ReplyMapper mapper;

  
  
  @Override
  public int register(ReplyDTO replyDTO) {

    log.info("register......" + replyDTO);

    return mapper.insert(replyDTO);

  }

  @Override
  public ReplyDTO get(Long rno) {

    log.info("get......" + rno);

    return mapper.read(rno);

  }

  @Override
  public int modify(ReplyDTO replyDTO) {

    log.info("modify......" + replyDTO);

    return mapper.update(replyDTO);

  }

  @Override
  public int remove(Long rno) {

    log.info("remove...." + rno);

    return mapper.delete(rno);

  }

  @Override
  public List<ReplyDTO> getList(Criteria cri, Long bno) {

    log.info("get Reply List of a Board " + bno);

    return mapper.getListWithPaging(cri, bno);

  }
  
  @Override
  public ReplyPageDTO getListPage(Criteria cri, Long bno) {
       
    return new ReplyPageDTO(
        mapper.getCountByBno(bno), 
        mapper.getListWithPaging(cri, bno));
  }


}

