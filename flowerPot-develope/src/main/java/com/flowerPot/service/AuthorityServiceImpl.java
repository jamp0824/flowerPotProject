package com.flowerPot.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flowerPot.dao.AuthorityDao;
import com.flowerPot.member.repository.MemberDao;

@Service
public class AuthorityServiceImpl implements AuthorityService {

	@Autowired
	private AuthorityDao authorityDao;
	@Autowired
	private MemberDao memberDao;

	@Override
	public void insertAuthorityById(String authority, String brand, List<String> id_list) {
		
		if(authority.equals("ROLE_BRAND")) {
			// 브랜드이면
			for(String id : id_list) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("authority", authority);
				map.put("id", id);
				map.put("brand", brand);
				memberDao.updateBrandById(map);
				// 권한목록을 가져와서... 있으면 insert를 하면 안되는것인가..
				authorityDao.insertAuthorityById(map);
			}
		}else {

			//  브랜드가 없으면
			for(String id : id_list) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("authority", authority);
				map.put("id", id);
				authorityDao.insertAuthorityById(map);
			}
		}

		
	}
}
