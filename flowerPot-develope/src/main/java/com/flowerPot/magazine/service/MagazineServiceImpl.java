
package com.flowerPot.magazine.service;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.flowerPot.domain.Criteria;
import com.flowerPot.magazine.repository.MagazineDao;
import com.flowerPot.vo.MagazineVo;

@Service
public class MagazineServiceImpl implements MagazineService {

	@Autowired
	private MagazineDao magazineDao;

	// 매거진 등록
	@Override
	public MagazineVo insertMagazine(MagazineVo magazine, MultipartHttpServletRequest mrequset) {
		MultipartFile multipart = mrequset.getFile("imgFile");
		
		String rootfolder = "C:\\upload"+File.separator;  // 
		LocalDateTime currentDateTime = LocalDateTime.now(); // 컴퓨터 현재 날짜 정보
		String today = currentDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));   // 오늘날짜 문자열 생성
		rootfolder = rootfolder + today + File.separator;
		File rootUrl = new File(rootfolder);    // 업로드될 폴더 Url,, 
		
		if(rootUrl.exists()==false) {  // 폴더가 없다면 폴더 생성
			rootUrl.mkdirs();
		}
		
		/* 원본 파일 이름 */
		String originalFileName = multipart.getOriginalFilename();
		
	
		/* UUID 생성, 새로운 파일 이름 */
		UUID uuid = UUID.randomUUID();
		String uuidName = uuid.toString();
		uuidName = uuidName + originalFileName.substring(originalFileName.lastIndexOf('.'));
		System.out.println(uuidName);
		
		File newImageFile = new File(rootUrl,uuidName);
		
		
		try {
			multipart.transferTo(newImageFile);   // 파일 생성
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		magazine.setOriginalName(originalFileName);  // 매거진 객체에 원본파일이름 저장
		magazine.setUUIDName(uuidName);  // 매거진 객체에 새로운파일 이름 저장
		magazine.setRootfolder(rootfolder);  // 매거진 객체에 폴더 경로 저장
		
		magazineDao.insertMagazine(magazine);
		
		return magazine;
	}

	// 매거진 리스트 출력
	@Override
	public List<MagazineVo> selectMagazineList(Criteria c) {
		
		
		return magazineDao.selectMagazineList(c);
	}

	@Override
	public MagazineVo selectMagzineCont(MagazineVo mgno) {
		return magazineDao.selectMagzineCont(mgno);
	}

	@Override
	public void deleteMagazine(int mgno) {
		magazineDao.deleteMagazine(mgno);
	}

	@Override
	public void updateMagazine(MagazineVo magazineVo) {
		magazineDao.updateMagazine(magazineVo);
	}

	@Override
	public int getTotalCount(Criteria c) {
		return magazineDao.getTotalCount(c);
	}
	
}
