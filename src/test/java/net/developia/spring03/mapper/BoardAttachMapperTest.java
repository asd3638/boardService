package net.developia.spring03.mapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import net.developia.spring03.dto.BoardAttachDTO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardAttachMapperTest {

    @Setter(onMethod_ = @Autowired)
    private BoardAttachMapper boardAttachMapper;

    @Setter(onMethod_ = @Autowired)
    private BoardMapper boardMapper;


    @Test
    public void insert() {
        BoardAttachDTO boardAttachDTO = new BoardAttachDTO();
        boardAttachDTO.setFileName("filename");
        boardAttachDTO.setUuid("uuid");
        boardAttachDTO.setUploadPath("uploadpath");

        boardAttachDTO.setBno(Long.valueOf(13));
        boardAttachMapper.insert(boardAttachDTO);
    }

    @Test
    public void delete() {
    }

    @Test
    public void findByBno() {
        boardAttachMapper.findByBno(Long.valueOf(13)).forEach(boardAttachDTO -> log.info(boardAttachDTO));
    }

    @Test
    public void deleteAll() {
    }

    @Test
    public void getOldFiles() {
    }
}