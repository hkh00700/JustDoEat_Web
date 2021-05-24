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

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import admin.RestrantVO;

@Service
public class CommonService {
	
	//가게에서 주소 좌표 주소로 변환
	public RestrantVO getJsonData(String address) throws Exception{

	     //주소안에 띄어쓰기때문에 400에러가 나는것을 해결
		System.out.println("address : " +address);
	    address = URLEncoder.encode(address,"UTF-8");

	  String url = "https://dapi.kakao.com/v2/local/search/address.json?query="+ address;

	   String jsonString = new String();

	  String buf;

	  URL Url = new URL(url);

	  HttpsURLConnection conn = (HttpsURLConnection) Url.openConnection();
	  String auth ="KakaoAK " +"23131123459d1706b5e9208981fae0b6";
	  conn.setRequestMethod("GET");
	  conn.setRequestProperty("X-Requested-With", "curl");
	  conn.setRequestProperty("Authorization", auth);

	  BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
	  while((buf = br.readLine()) != null) {
	  jsonString += buf;
	 
	  }
	  
		JSONObject obj = new JSONObject(jsonString);
		JSONArray array = obj.getJSONArray("documents");
		JSONObject obj2 = array.getJSONObject(0);
		RestrantVO vo = new RestrantVO();
		vo.setR_latitude(obj2.getString("x"));
		vo.setR_hardness(obj2.getString("y"));
	
		
		return vo;
	}
	
	
	
	public String r_fileUpload(MultipartFile file, HttpSession session) {
		//업로드할 서버의 물리적 위치
		String resources = "http://192.168.0.67:8989/justdo_eat/resources/";
		
		//Study_Spring/.metadata/..../smart/resources/upload/notice/2021/04/22
		//String folder =  resources + "/upload/" + category + "/" + new SimpleDateFormat("yyyy/MM/dd").format(new Date());
		
		//폴더를 만드는 작업
		//File dir = new File(folder);
		//if( ! dir.exists() ) dir.mkdirs();	//mkdirs()를 하게 되면 하위 폴더까지 생성이 됨.
		
		String uuid = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
		
		/*
		 * try { file.transferTo( new File(folder, uuid)); }catch (Exception e) {
		 * System.out.println(e.getMessage()); }
		 */
		return resources + uuid;
	}
	
	
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
	
	public String fileUpload(String category
			, MultipartFile file, HttpServletRequest request) {
		
//		String resources  =  session.getServletContext().getRealPath("resources");
		String resources  =  request.getSession().getServletContext().getRealPath("resources");
		String app = request.getRequestURL().toString().replace(request.getRequestURI(), "")+request.getContextPath() + "/" ;
		
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
		return app + folder.substring(resources.length()+1) 
						+ "/" + uuid;
		}
		
			
	public String fileUpload(String category
					, MultipartFile file, HttpSession session) {
		
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
