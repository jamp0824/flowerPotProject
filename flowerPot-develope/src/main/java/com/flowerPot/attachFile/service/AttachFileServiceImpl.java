package com.flowerPot.attachFile.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flowerPot.attachFile.repository.AttachFileDao;
import com.flowerPot.vo.AttachFileVo;

@Service
public class AttachFileServiceImpl implements AttachFileService {

	@Autowired
	private AttachFileDao attachFileDao;

	@Override
	public void insertAttachFile(AttachFileVo attachFile) {
		attachFileDao.insertAttachFile(attachFile);
	}

	@Override
	public void deleteAll() {
		attachFileDao.deleteAll();
	}

	@Override
	public int selectCount() {
		return attachFileDao.selectCount();
	}

	@Override
	public void insertAttachListToEvent(List<AttachFileVo> alist) {
		for(AttachFileVo attach : alist) {
			attachFileDao.insertAttachListToEvent(attach);
		}
	}
}
