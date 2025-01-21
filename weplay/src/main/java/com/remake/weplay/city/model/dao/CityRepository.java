package com.remake.weplay.city.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.remake.weplay.city.model.vo.City;

@Repository
public class CityRepository {

	public List<City> selectCities(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("cityMapper.selectCities");
	}

	public List<City> selectDistricts(SqlSessionTemplate sqlSession, String city) {
		return sqlSession.selectList("cityMapper.selectDistricts", city);
	}

}
