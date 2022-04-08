package net.developia.spring03.controller;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.developia.spring03.dto.Criteria;
import net.developia.spring03.dto.ReplyDTO;
import net.developia.spring03.dto.ReplyPageDTO;
import net.developia.spring03.service.ReplyService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/replies/")
@RestController
@Log4j
@AllArgsConstructor
public class ReplyController {
    private ReplyService service;

    @PostMapping(value = "/new", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
    public ResponseEntity<String> create(@RequestBody ReplyDTO replyDTO) {

        log.info("ReplyreplyDTO: " + replyDTO);

        int insertCount = service.register(replyDTO);

        log.info("Reply INSERT COUNT: " + insertCount);

        return insertCount == 1
                ?  new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @GetMapping(value = "/{rno}",
            produces = { MediaType.APPLICATION_XML_VALUE,
                    MediaType.APPLICATION_JSON_UTF8_VALUE })
    public ResponseEntity<ReplyDTO> get(@PathVariable("rno") Long rno) {

        log.info("get: " + rno);

        return new ResponseEntity<>(service.get(rno), HttpStatus.OK);
    }

    @RequestMapping(method = { RequestMethod.PUT,
            RequestMethod.PATCH }, value = "/{rno}", consumes = "application/json", produces = {
            MediaType.TEXT_PLAIN_VALUE })
    public ResponseEntity<String> modify(
            @RequestBody ReplyDTO replyDTO,
            @PathVariable("rno") Long rno) {

        replyDTO.setRno(rno);

        log.info("rno: " + rno);
        log.info("modify: " + replyDTO);

        return service.modify(replyDTO) == 1
                ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

    }

    @DeleteMapping(value = "/{rno}", produces = { MediaType.TEXT_PLAIN_VALUE })
    public ResponseEntity<String> remove(@PathVariable("rno") Long rno) {

        log.info("remove: " + rno);

        return service.remove(rno) == 1
                ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

    }

    @GetMapping(value = "/pages/{bno}/{page}",
            produces = { MediaType.APPLICATION_XML_VALUE,
                    MediaType.APPLICATION_JSON_UTF8_VALUE })
    public ResponseEntity<ReplyPageDTO> getList(@PathVariable("page") int page, @PathVariable("bno") Long bno) {

        Criteria cri = new Criteria(page, 10);

        log.info("get Reply List bno: " + bno);

        log.info("cri:" + cri);

        return new ResponseEntity<>(service.getListPage(cri, bno), HttpStatus.OK);
    }

}

