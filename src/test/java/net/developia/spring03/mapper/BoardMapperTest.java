package net.developia.spring03.mapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import net.developia.spring03.dto.BoardAttachDTO;
import net.developia.spring03.dto.BoardDTO;
import net.developia.spring03.dto.Criteria;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.assertThat;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTest {

    @Setter(onMethod_ = @Autowired)
    private BoardMapper mapper;

    @Test
    public void getList() {
        mapper.getList().forEach(boardDTO -> log.info(boardDTO));
    }

    @Test
    public void getListWithPaging() {
        //페이징 + 검색조건
        Criteria criteria = new Criteria();
        criteria.setType("T");
        criteria.setKeyword("title1");
        mapper.getListWithPaging(criteria).forEach(boardDTO -> log.info(boardDTO));
    }

    @Test
    public void insert() {
        BoardDTO boardDTO = new BoardDTO();
        List<BoardAttachDTO> boardAttachDTOList = new ArrayList<>();
        BoardAttachDTO boardAttachDTO = new BoardAttachDTO();

        boardAttachDTO.setFileName("file");
        boardAttachDTOList.add(boardAttachDTO);

        boardDTO.setAttachList(boardAttachDTOList);
        boardDTO.setContent("test-content");
        boardDTO.setTitle("test-title");

        mapper.insert(boardDTO);
    }

    @Test
    public void insertSelectKey() {
    }

    @Test
    public void read() {
    }

    @Test
    public void delete() {
    }

    @Test
    public void update() {
    }

    @Test
    public void getTotalCount() {
    }
}