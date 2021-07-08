package com.flowerPot.attachFile.service;

import java.util.List;

import com.flowerPot.vo.AttachFileVo;

public interface AttachFileService {

	void insertAttachFile(AttachFileVo attachFile);

	void deleteAll();

	int selectCount();

	void insertAttachListToEvent(List<AttachFileVo> alist);

}
