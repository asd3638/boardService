package net.developia.spring03.service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import net.developia.spring03.dto.BoardAttachDTO;
import net.developia.spring03.dto.BoardDTO;
import net.developia.spring03.mapper.BoardMapper;
import net.developia.spring03.mapper.ReplyMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceImplTest {

    @Setter(onMethod_ = @Autowired)
    private BoardMapper mapper;

    @Test
    public void register() {
        List<BoardAttachDTO> boardAttachDTOList = new ArrayList<>();
        BoardAttachDTO boardAttachDTO1 = new BoardAttachDTO();
        boardAttachDTO1.setFileName("file1");
        boardAttachDTO1.setUploadPath("path1");
        boardAttachDTO1.setUuid("aaa");
        boardAttachDTO1.setFileType(true);
        boardAttachDTO1.setBno(10L);
        boardAttachDTOList.add(boardAttachDTO1);


        BoardDTO boardDTO = new BoardDTO();
        boardDTO.setTitle("title");
        boardDTO.setContent("content");
        boardDTO.setWriter("writer");
        boardDTO.setAttachList(boardAttachDTOList);

        mapper.insert(boardDTO);
    }

    @Test
    public void get() {
    }

    @Test
    public void modify() {
    }

    @Test
    public void remove() {
    }

    @Test
    public void getList() {
    }

    @Test
    public void getTotal() {
    }

    @Test
    public void getAttachList() {
    }

    @Test
    public void removeAttach() {
    }

    @Test
    public void updateReadCount() {
    }

    @Test
    public void setMapper() {
    }

    @Test
    public void setAttachMapper() {
    }
}