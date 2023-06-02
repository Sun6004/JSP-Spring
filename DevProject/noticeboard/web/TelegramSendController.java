package kr.or.ddit.controller.noticeboard.web;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Controller;

@Controller
public class TelegramSendController {
	
	public void sendGet(String name, String title) throws Exception {
		String chatId = "-987525737";
		String urlName = "https://api.telegram.org/bot5808216277:토큰/sendMessage";
		String text = "";
		
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String timeStr = format1.format(time);
		
		text = name + "님께서 글 작성을 완료!\n"+
				"[제목]" + title + "\n" +
				"[작성일]" + timeStr + "\n";
		
		URL url = new URL(urlName +"?chat_id=" + chatId +"&text="+URLEncoder.encode(text, "UTF-8"));
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		conn.setRequestProperty("User-Agent", "Mozilla/5.0");
		int respCode = conn.getResponseCode();
		System.out.println("[상태코드]: " + respCode);
	}
}
