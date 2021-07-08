package com.flowerPot.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AttachFileVo {
	private Integer atno;
	private Integer cno;
	private Integer mgno;
	private Integer eno;
	private String uuidName;
	private String originalFileName;
	private String uploadFolderPath;
	private String mappingURL;
	private String realName;
	
}
