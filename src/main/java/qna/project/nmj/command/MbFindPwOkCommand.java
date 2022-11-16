package qna.project.nmj.command;

import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.ui.Model;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.MemberDTO;
import qna.project.nmj.beans.dao.MemberDAO;
import qna.project.nmj.security.PasswordEncoding;

public class MbFindPwOkCommand implements Command {

	@Override
	public void execute(Model model) {
		MemberDTO dto = null;
		MemberDAO dao = C.sqlSession.getMapper(MemberDAO.class);
		
		Map<String, Object> map = model.asMap();
		
		String mb_id = (String)map.get("mb_id");
		System.out.println("Command mb_id : " + mb_id);
		String mb_name = (String)map.get("mb_name");
		System.out.println("Command mb_name : " + mb_name);
		String mb_email = (String)map.get("mb_email");
		System.out.println("Command mb_email : " + mb_email);
//		String mb_id = (String)model.getAttribute("mb_name");
//		String mb_name = (String)model.getAttribute("mb_name");
//		String mb_email = (String)model.getAttribute("mb_email");    

		final String SMTP_USERNAME = "b2nyb2st77@naver.com";
		final String SMTP_PASSWORD = "merry1125!";
		String HOST = "smtp.naver.com";
		//int PORT = 587;

		Properties props = new Properties();   
		props.put("mail.smtp.host", HOST); 
		props.put("mail.smtp.auth", "true");
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
			    return new PasswordAuthentication(SMTP_USERNAME, SMTP_PASSWORD);
			}   
		});
		
		try {
			dto = dao.selectPw(mb_id, mb_name, mb_email);
			int result = 0;
	        if(dto != null) {
	        	int cnt = 0;
	        	
	        	if(mb_id.equals(dto.getMb_id()) && mb_name.equals(dto.getMb_name()) && mb_email.equals(dto.getMb_email())) {
		        	// 임시비밀번호 생성
		            char pwCollection[] = new char[] {
	                        '1','2','3','4','5','6','7','8','9','0',
	                        'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
	                        'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
	                        '!','@','#','$','%','^','&','*','(',')'};//배열에 선언
	
				      String ranPw = "";
				
				      for (int i = 0; i < 7; i++) {
				        int selectRandomPw = (int)(Math.random()*(pwCollection.length));//Math.rondom()은 0.0이상 1.0미만의 난수를 생성해 준다.
				        ranPw += pwCollection[selectRandomPw];
				      }
		        	PasswordEncoding pe = new PasswordEncoding();
		        	
		        	cnt = dao.updatePw(pe.encode(ranPw), dto.getMb_id());
		        	
		        	// 메일 보내기
					String TO = dto.getMb_email();
					//String FROM = "itmoa@itmoa.com";
					
				   MimeMessage message = new MimeMessage(session);
				   message.setFrom(new InternetAddress(SMTP_USERNAME));
				   message.addRecipient(Message.RecipientType.TO, new InternetAddress(TO));
		
				   
				   // 메일 제목
				   message.setSubject("[놀먹자] 비밀번호 안내입니다.");
				   
				   // 메일 내용
				   message.setText("놀먹자를 이용해주셔서 감사합니다.\n" + dto.getMb_name() + " 고객님의 임시 비밀번호는 " + ranPw + "입니다.\n임시비밀번호로 로그인 한 뒤 반드시 비밀번호 변경을 해주시기 바랍니다.");
		
				   System.out.println("Sending...");
				   
				   // send the message
				   Transport.send(message);
				   System.out.println("message sent successfully...");
					
		           System.out.println("Email sent!");
		         
		           result++;
	        	}
           } else {
        	   result = 0;
           }
           
           model.addAttribute("findPwOk", result);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
