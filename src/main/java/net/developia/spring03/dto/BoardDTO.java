package net.developia.spring03.dto;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardDTO {
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private Date regDate;
	private Date updateDate;
	private int readCount;
	private int replyCnt;

	private List<BoardAttachDTO> attachList;
}
