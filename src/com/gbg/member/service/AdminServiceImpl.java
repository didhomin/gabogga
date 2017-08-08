package com.gbg.member.service;

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

import com.gbg.board.dao.CommonDao;
import com.gbg.list.dao.ListDao;
import com.gbg.list.model.ListDto;
import com.gbg.member.dao.AdminDao;
import com.gbg.member.mail.SMTPAuthenticatior;
import com.gbg.member.model.QnaDto;
import com.gbg.member.model.StatisticsDto;
import com.gbg.member.model.UsersDto;
import com.gbg.util.BoardConstance;
import com.gbg.util.PageNavigationIn;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void sendQnaMail(QnaDto qnaDto) {

		String to = "didhomin@gmail.com";
		String from = "didhomin@gmail.com";
		String subject = qnaDto.getName()+"("+qnaDto.getFrom() +"님이 보낸 문의 메일입니다.";
		String content = "제목 : "+qnaDto.getSubject()+"<br><br>"+"내용 : "+qnaDto.getContent();
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
	public List<ListDto> address(String address) {
		return sqlSession.getMapper(AdminDao.class).address(address);
	}

	@Override
	public List<ListDto> main() {
		return sqlSession.getMapper(AdminDao.class).main();
	}

	@Override
	public List<ListDto> mainprice() {
		return sqlSession.getMapper(AdminDao.class).mainprice();
	}

	@Override
	public List<StatisticsDto> man() {
		return sqlSession.getMapper(AdminDao.class).man();
	}

	@Override
	public List<StatisticsDto> woman() {
		return sqlSession.getMapper(AdminDao.class).woman();
	}

	@Override
	public List<Map<String, String>> regionSelect() {
		return sqlSession.getMapper(AdminDao.class).regionSelect();
	}

	@Override
	public List<Map<String, String>> reservationSelect() {
		return sqlSession.getMapper(AdminDao.class).reservationSelect();
	}

	@Override
	public int memberAdminDelete(String userId) {
		return sqlSession.getMapper(AdminDao.class).memberAdmindelete(userId);
		
	}

	@Override
	public List<UsersDto> listMemberAdmin(Map<String, String> queryString) {
		// TODO Auto-generated method stub
		int pg = Integer.parseInt(queryString.get("pg"));
		int end = pg * BoardConstance.LISTP_SIZE;
		int start = end - BoardConstance.LISTP_SIZE;
		queryString.put("start", start + "");
		queryString.put("end", end + "");
		return sqlSession.getMapper(AdminDao.class).listMemberAdmin(queryString);
	}

	@Override
	public UsersDto searchMemberAdmin(String userId) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(AdminDao.class).searchMemberAdmin(userId);
	}

	@Override
	public int memberAdminBlack(String userId) {
		
		return sqlSession.getMapper(AdminDao.class).memberAdminBlack(userId);
	}

	@Override
	public List<UsersDto> blacklist(Map<String, String> queryString) {
		int pg = Integer.parseInt(queryString.get("pg"));
		int end = pg * BoardConstance.LISTP_SIZE;
		int start = end - BoardConstance.LISTP_SIZE;
		queryString.put("start", start + "");
		queryString.put("end", end + "");
		return sqlSession.getMapper(AdminDao.class).blacklist( queryString);
	}

	@Override
	public int memberAdminSoso(String userId) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(AdminDao.class).memberAdminSoso(userId);
	}

	@Override
	public int memberAdmindelete(String id) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(AdminDao.class).memberAdmindelete(id);
	}

	@Override
	public int getNextSeq() {
		return sqlSession.getMapper(CommonDao.class).getNextSeq();
	}

	@Override
	public PageNavigationIn makePageNavigation(Map<String, String> queryString) {
		PageNavigationIn pageNavigationIn = new PageNavigationIn();
		

		int newArticleAdCount = sqlSession.getMapper(AdminDao.class).newArticleAdCount(Integer.parseInt(queryString.get("pg")));
		pageNavigationIn.setnewArticleAdCount(newArticleAdCount);

		int totalArticleAdCount = sqlSession.getMapper(AdminDao.class).totalArticleAdCount(queryString);

		pageNavigationIn.settotalArticleAdCount(totalArticleAdCount);
		int totalPageCount = (totalArticleAdCount - 1) / BoardConstance.LISTP_SIZE + 1;

		int pg = Integer.parseInt(queryString.get("pg"));
		
		pageNavigationIn.setTotalPageCount(totalPageCount);
		pageNavigationIn.setNowFirst(pg <= BoardConstance.PAGE_SIZE);
		pageNavigationIn.setNowEnd((totalPageCount - 1) / BoardConstance.PAGE_SIZE * BoardConstance.PAGE_SIZE < pg);
		pageNavigationIn.setPageNo(pg);
		return pageNavigationIn;
	}


}
