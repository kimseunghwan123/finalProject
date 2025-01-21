package com.remake.weplay.city.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.remake.weplay.city.model.dao.CityRepository;
import com.remake.weplay.city.model.vo.City;

@Service
public class CityServiceImpl implements CityService {
	
	@Autowired
	private CityRepository cityRepository;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 시/도 목록 조회
	@Override
	public List<City> selectCities() { 
		return cityRepository.selectCities(sqlSession);
	}
	
	// 시/군/구 목록 조회
	@Override
	public List<City> selectDistricts(String city) {
		return cityRepository.selectDistricts(sqlSession, city);
	}
	
}
