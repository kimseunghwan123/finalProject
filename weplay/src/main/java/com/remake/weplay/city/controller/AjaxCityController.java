package com.remake.weplay.city.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.remake.weplay.city.model.service.CityService;

@RestController
@RequestMapping(value="city", produces="application/json; charset=UTF-8")
public class AjaxCityController {
	
	@Autowired
	private CityService cityService;
	@Autowired
	private Gson gson;
	
	@GetMapping
	public String selectCities() {
		return gson.toJson(cityService.selectCities());
	}
	
	@GetMapping("/{city}")
	public String selectDistricts(@PathVariable("city") String city) {
		return gson.toJson(cityService.selectDistricts(city));
	}
}
