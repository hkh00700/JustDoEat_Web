package common;


import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

@Service
public class CommonService {
	
	//파일다운로드
	public File fileDownload(HttpSession session
					, HttpServletResponse response
					, String s_photo, String s_photo_path) {
		File file = new File( session.getServletContext()
					.getRealPath("resources") + "/" + s_photo_path );
		String mime 
		= session.getServletContext().getMimeType(s_photo);
		
		response.setContentType( mime );
		
		try {
		
			s_photo = URLEncoder.encode(s_photo, "utf-8")
							.replaceAll("\\+", "%20"); 
		
		response.setHeader("content-disposition"
						, "attachment; filename=" + s_photo);	
		ServletOutputStream out = response.getOutputStream();
		FileCopyUtils.copy( new FileInputStream(file), out);
		out.flush();
		
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return file;
	}
	
	//파일업로드
	public String fileUpload(String category
					, MultipartFile file, HttpSession session) {
		//업로드할 서버의 물리적 위치
		String resources 
		= session.getServletContext().getRealPath("resources");
		
		//Study_Spring/.metadata/.../smart/resources
		//    /upload/notice/2021/04/22
		String folder 
		=  resources + "/upload/" + category + "/" 
		+ new SimpleDateFormat("yyyy/MM/dd").format(new Date()); 
		
		File dir = new File(folder);
		if( ! dir.exists() ) dir.mkdirs();
		
		String uuid = UUID.randomUUID().toString() + "_"
					+ file.getOriginalFilename();
		
		try {
			file.transferTo( new File(folder, uuid) );
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return folder.substring(resources.length()+1) 
						+ "/" + uuid;
	}
	
	
	public String requestAPI(StringBuffer url, String property) {
		String result = url.toString();
		
	    try {
	        HttpURLConnection con 
	        	= (HttpURLConnection)new URL(result).openConnection();
	        con.setRequestMethod("GET");
	        con.setRequestProperty("Content-type", "application/json");
	        con.setRequestProperty("Authorization", property);
	        
	        int responseCode = con.getResponseCode();
	        BufferedReader br;
	        if(responseCode>=200 && responseCode<=300) { // 정상 호출
	          br = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));
	        } else {  // 에러 발생
	          br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "utf-8"));
	        }
	        
	        String inputLine;
	        StringBuffer res = new StringBuffer();
	        while ((inputLine = br.readLine()) != null) {
	          res.append(inputLine);
	        }
	        br.close();
	        con.disconnect();
	        result = res.toString();
	        
	    } catch (Exception e) {
	        System.out.println(e.getMessage());
	    }
	    
		return result;
	}
	
	public String requestAPI(StringBuffer url) {
		String result = url.toString();
		
	    try {
	        HttpURLConnection con 
	        	= (HttpURLConnection)new URL(result).openConnection();
	        con.setRequestMethod("GET");
	        con.setRequestProperty("Content-type", "application/json");
	        
	        int responseCode = con.getResponseCode();
	        BufferedReader br;
	        if(responseCode>=200 && responseCode<=300) { // 정상 호출
	          br = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));
	        } else {  // 에러 발생
	          br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "utf-8"));
	        }
	        
	        String inputLine;
	        StringBuffer res = new StringBuffer();
	        while ((inputLine = br.readLine()) != null) {
	          res.append(inputLine);
	        }
	        br.close();
	        con.disconnect();
	        result = res.toString();
	        
	    } catch (Exception e) {
	        System.out.println(e.getMessage());
	    }
	    System.out.println(result);
		return result;
	}
	
	public Map<String, Object> json_list(StringBuffer url) {
		JSONObject json = null;
		json = new JSONObject(requestAPI(url)); //response
		json = json.getJSONObject("response");
		json = json.getJSONObject("body");
		int count = 0;
		if( json.has("totalCount") ) {
			count = json.getInt("totalCount");
		}
		if( json.get("items") instanceof JSONObject )
			json = json.getJSONObject("items");
		else
			json.put("item", "");
		
		json.put("count", count);
		return json.toMap();
	}
	
	
	
}
