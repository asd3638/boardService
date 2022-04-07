package net.developia.spring03.dto;

import lombok.Data;

@Data
public class BoardAttachDTO {

  private String uuid;
  private String uploadPath;
  private String fileName;
  private String fileType;
  
  private Long bno;
  
}
