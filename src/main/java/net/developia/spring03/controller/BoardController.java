package net.developia.spring03.controller;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.developia.spring03.dto.BoardAttachDTO;
import net.developia.spring03.dto.BoardDTO;
import net.developia.spring03.dto.Criteria;
import net.developia.spring03.dto.PageDTO;
import net.developia.spring03.service.BoardService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.util.List;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {

	private BoardService service;

	@GetMapping("/register")
	public void register() {

	}

	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		log.info("list: " + cri);
		model.addAttribute("list", service.getList(cri));

		int total = service.getTotal(cri);
		log.info("total: " + total);

		model.addAttribute("pageMaker", new PageDTO(cri, total));

	}

	@PostMapping("/register")
	public String register(BoardDTO board, RedirectAttributes rttr) {

		log.info("==========================");

		log.info("register: " + board);

		if (board.getAttachList() != null) {

			board.getAttachList().forEach(log::info);

		}

		log.info("==========================");

		service.register(board);

		rttr.addFlashAttribute("result", board.getBno());

		return "redirect:/board/list";
	}

	@GetMapping("/get")
	public String get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, HttpServletRequest request, HttpServletResponse response, Model model) {

		log.info("/get");
		log.info(LocalDate.now());
		System.out.println("=====================");
		System.out.println(LocalDate.now());

		Cookie[] cookies = request.getCookies();
		Cookie viewCookie = null;

		if (cookies != null && cookies.length > 0)
		{
			for (int i = 0; i < cookies.length; i++)
			{
				// Cookie??? name??? cookie + ????????? ???????????? ????????? viewCookie??? ?????????
				if (cookies[i].getName().equals("cookie"+bno))
				{
					System.out.println("?????? ????????? ????????? ??? ?????????.");
					viewCookie = cookies[i];
				}
			}
		}
		if (viewCookie == null) {
			System.out.println("cookie ??????");

			// ?????? ??????(??????, ???)
			Cookie newCookie = new Cookie("cookie"+bno, "|" + bno + "|");

			// ?????? ??????
			response.addCookie(newCookie);

			// ????????? ?????? ????????? ????????? ????????????
			service.updateReadCount(bno);
		}
		// viewCookie??? null??? ???????????? ????????? ???????????? ????????? ?????? ????????? ???????????? ??????.
		else {
			System.out.println("cookie ??????");
			// ?????? ??? ?????????.
			String value = viewCookie.getValue();
			System.out.println("cookie ??? : " + value);

		}

		BoardDTO boardDTO = service.get(bno);
		model.addAttribute("board", boardDTO);

		return "board/get";
	}

	@GetMapping("/modify")
	public void getModify(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		BoardDTO boardDTO = service.get(bno);
		model.addAttribute("board", boardDTO);
	}

	@PostMapping("/modify")
	public String modify(BoardDTO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {

		board.setUpdateDate(java.sql.Date.valueOf(LocalDate.now()));

		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}

		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());

		return "redirect:/board/list";
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, Criteria cri, RedirectAttributes rttr) {

		log.info("remove..." + bno);

		List<BoardAttachDTO> attachList = service.getAttachList(bno);

		if (service.remove(bno)) {

			// delete Attach Files
			deleteFiles(attachList);

			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list" + cri.getListLink();
	}

	private void deleteFiles(List<BoardAttachDTO> attachList) {

		if(attachList == null || attachList.size() == 0) {
			return;
		}

		log.info("delete attach files...................");
		log.info(attachList);

		attachList.forEach(attach -> {
			try {
				Path file  = Paths.get("/Users/mac/upload/"+attach.getUploadPath()+"/" + attach.getUuid()+"_"+ attach.getFileName());

				Files.deleteIfExists(file);

				if(Files.probeContentType(file).startsWith("image")) {

					Path thumbNail = Paths.get("/Users/mac/upload/"+attach.getUploadPath()+"/s_" + attach.getUuid()+"_"+ attach.getFileName());

					Files.delete(thumbNail);
				}

			}catch(Exception e) {
				log.error("delete file error" + e.getMessage());
			}//end catch
		});//end foreachd
	}

	@GetMapping(value = "/getAttachList",
			produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachDTO>> getAttachList(Long bno) {

		log.info("getAttachList " + bno);

		return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);

	}

}
