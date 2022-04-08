package net.developia.spring03.service;

import junit.framework.TestCase;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import net.developia.spring03.mapper.BoardMapper;
import net.developia.spring03.mapper.ReplyMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyServiceImplTest extends TestCase {

    @Setter(onMethod_ = @Autowired)
    private ReplyMapper mapper;

    public void testRegister() {
    }

    public void testGet() {
    }

    public void testModify() {
    }

    public void testRemove() {
    }

    public void testGetList() {
    }

    @Test
    public void testGetListPage() {
        mapper.getCountByBno(59L);
    }
}