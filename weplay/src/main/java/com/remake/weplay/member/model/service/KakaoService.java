package com.remake.weplay.member.model.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.ParseException;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

import com.remake.weplay.member.model.vo.SocialMember;

@Service
public class KakaoService {

	public String getToken(String code) throws Exception {
		
		String tokenUrl="https://kauth.kakao.com/oauth/token";
		
		URL url =new URL(tokenUrl);
		
		HttpURLConnection urlConnection =(HttpURLConnection)url.openConnection();
		
		urlConnection.setRequestMethod("POST");
		urlConnection.setDoOutput(true);
		
		BufferedWriter bw =
				new BufferedWriter(new OutputStreamWriter(urlConnection.getOutputStream())); 
		
		
		
		StringBuilder sb = new StringBuilder();
		
		sb.append("client_id=64c3383cfe650be0d6284293b8d84835");
		sb.append("&grant_type=authorization_code");
		sb.append("&redirect_uri=http://localhost:8099/weplay/code");
		sb.append("&code="+code);
		
		bw.write(sb.toString());
		bw.flush();
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String line ="";
		String responseData = "";
		
		while((line=br.readLine()) !=null) {
			responseData +=line;
		}
		
		System.out.println(responseData);
		
		JSONParser parser = new JSONParser();
		
		JSONObject element = (JSONObject)parser.parse(responseData);
		
		String accessToken = element.get("access_token").toString();
		

		br.close();
		bw.close();
		
		return accessToken;
	}
	
	
	public SocialMember getUserInfo(String accessToken) throws IOException, ParseException, org.json.simple.parser.ParseException {
		String userInfoUrl = "https://kapi.kakao.com/v2/user/me";
		
		URL url = new URL(userInfoUrl);
		
		HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
		
		urlConnection.setRequestMethod("GET");
		
		urlConnection.setRequestProperty("Authorization", "Bearer "+ accessToken);
		BufferedReader br
		= new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String responseData = br.readLine();
		
		JSONObject responseObj = (JSONObject)new JSONParser().parse(responseData);
		JSONObject propObj = (JSONObject)responseObj.get("properties");
		
		SocialMember sm = new SocialMember();
		
		
		
//		System.out.println(propObj);
		
		sm.setId(responseObj.get("id").toString());
		sm.setNickName(propObj.get("nickname").toString());
		sm.setThumbnailImage(propObj.get("thumbnail_image").toString());
		
		return sm;
		
		
	}
	
}
