package com.remake.weplay.city.model.service;

import java.util.List;

import com.remake.weplay.city.model.vo.City;

public interface CityService {
	
	List<City> selectCities();

	List<City> selectDistricts(String city);

}
