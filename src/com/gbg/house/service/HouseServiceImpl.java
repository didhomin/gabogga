package com.gbg.house.service;

import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gbg.host.model.ConvenienceDto;
import com.gbg.host.model.GuestHouseDto;
import com.gbg.host.model.RoomDto;
import com.gbg.house.dao.HouseDao;
import com.gbg.house.model.HouseDto;
import com.gbg.member.mail.SMTPAuthenticatior;
import com.gbg.util.BoardConstance;
import com.gbg.util.HostPageNavigation;
import com.gbg.util.MyPageNavigation;

@Service
public class HouseServiceImpl implements HouseService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int reservation(HouseDto houseDto) {
		return sqlSession.getMapper(HouseDao.class).reservation(houseDto);
	}

	@Override
	public int hostInfo(GuestHouseDto guesthouseDto) {
		return sqlSession.getMapper(HouseDao.class).hostInfo(guesthouseDto);
	}

	@Override
	public List<RoomDto> room(int guesthouseId) {
		return sqlSession.getMapper(HouseDao.class).room(guesthouseId);
	}

	@Override
	public ConvenienceDto houseInfo(int guesthouseId) {
		return sqlSession.getMapper(HouseDao.class).houseInfo(guesthouseId);
	}
	
	@Override
	public List<HouseDto> userreservationinfo(Map<String, String> map) {
		int pg = Integer.parseInt(map.get("pg"));
		int end = pg * 10;
		int start = end - 10;
		map.put("start", start+"");
		map.put("end", end+"");
		return sqlSession.getMapper(HouseDao.class).userreservationinfo(map);
	}

	@Override
	public List<HouseDto> hostreservationinfo(Map<String, String> map) {
		int pg = Integer.parseInt(map.get("pg"));
		int end = pg * 10;
		int start = end - 10;
		map.put("start", start+"");
		map.put("end", end+"");
		return sqlSession.getMapper(HouseDao.class).hostreservationinfo(map);
	}

	@Override
	public HouseDto ghid(String userId) {
		return sqlSession.getMapper(HouseDao.class).ghid(userId);
	}

	@Override
	public int oksign(String reservationId) {
		return sqlSession.getMapper(HouseDao.class).oksign(reservationId);
	}

	@Override
	public List<RoomDto> roomInfo(int guesthouseId) {
		return sqlSession.getMapper(HouseDao.class).roomInfo(guesthouseId);
	}

	@Override
	public int nosign(String reservationId) {
		return sqlSession.getMapper(HouseDao.class).nosign(reservationId);
	}
	@Override
	public void hostqna(Map<String, String> map) {
		String to = map.get("useremail");
		String from = "didhomin@gmail.com";
		String subject = map.get("subject");
		String content = map.get("content");
		Properties p = new Properties();
		
		p.put("mail.smtp.host", "smtp.gmail.com"); 
		p.put("mail.smtp.port", "25");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		p.setProperty("mail.stmp.port", "465");
		p.setProperty("mail.smtp.socketFactory.port", "465");
		
		
		try {
			Authenticator auth = new SMTPAuthenticatior();
			Session ses = Session.getInstance(p, auth);
			
			
			MimeMessage msg = new MimeMessage(ses);
			msg.setSubject(subject); 
			
			Address fromAddr = new InternetAddress(from);
			msg.setFrom(fromAddr);
			
			Address toAddr = new InternetAddress(to);
			msg.addRecipient(Message.RecipientType.TO, toAddr); 
			
			msg.setContent(content, "text/html;charset=UTF-8"); // 내용과 인코딩
			
			Transport.send(msg); 
		} catch (Exception e) {
			return;
		}
		
	}

	@Override
	public void reservationroom(Map<String, String> map) {
		sqlSession.getMapper(HouseDao.class).reservationroom(map);
	}

	@Override
	public int reid() {
		return 	sqlSession.getMapper(HouseDao.class).reid();
	}

	@Override
	public List<Map<String, String>> calSelect(Map<String, String> map) {
		return sqlSession.getMapper(HouseDao.class).calSelect(map);
	}

	@Override
	public MyPageNavigation myPageNavigation(Map<String, String> map) {
		MyPageNavigation pageNavigation = new MyPageNavigation();
		
		int totalArticleCount = sqlSession.getMapper(HouseDao.class).myreservationCount(map);
		pageNavigation.setTotalArticleCount(totalArticleCount);
		int totalPageCount = (totalArticleCount - 1) / 10 + 1;
		
		int pg = Integer.parseInt(map.get("pg"));
		pageNavigation.setTotalPageCount(totalPageCount);
		pageNavigation.setNowFirst(pg <= 10);
		pageNavigation.setNowEnd((totalPageCount - 1) / 10 * 10 < pg);
		pageNavigation.setPageNo(pg);
		return pageNavigation;
	}

	@Override
	public HostPageNavigation hostPageNavigation(Map<String, String> map) {
		HostPageNavigation pageNavigation = new HostPageNavigation();
		
		int totalArticleCount = sqlSession.getMapper(HouseDao.class).hostreservationCount(map);
		pageNavigation.setTotalArticleCount(totalArticleCount);
		int totalPageCount = (totalArticleCount - 1) / 10 + 1;
		
		int pg = Integer.parseInt(map.get("pg"));
		pageNavigation.setTotalPageCount(totalPageCount);
		pageNavigation.setNowFirst(pg <= 10);
		pageNavigation.setNowEnd((totalPageCount - 1) / 10 * 10 < pg);
		pageNavigation.setPageNo(pg);
		return pageNavigation;
	}

}
