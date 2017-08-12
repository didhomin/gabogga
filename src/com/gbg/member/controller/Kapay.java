package com.gbg.member.controller;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

public class Kapay {
	  public static void main(String[] args) {
		  HttpHeaders headers = new HttpHeaders();
		  headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
		  headers.add("Authorization", "KakaoAK 74e1b61a455e1b4e8e2f35a8b5f9f0ca");
		  
		  MultiValueMap<String, String> map= new LinkedMultiValueMap<String, String>();
		  map.add("cid", "TC0ONETIME");
		  map.add("partner_order_id", "partner_order_id");
		  map.add("partner_user_id", "partner_user_id");
		  map.add("item_name", "양호민");
		  map.add("quantity", "1");
		  map.add("total_amount", "100");
		  map.add("vat_amount", "1");
		  map.add("tax_free_amount", "1");
		  map.add("approval_url", "http://localhost/gabogga/house/userresinfo.gbg");
		  map.add("fail_url", "https://localhost/gabogga/fail");
		  map.add("cancel_url", "https://localhost/gabogga/cancel");

		  HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(map, headers);
		  RestTemplate restTemplate = new RestTemplate();
		  ResponseEntity<String> response = restTemplate.postForEntity( "https://kapi.kakao.com/v1/payment/ready", request , String.class );
	    }
}
