package common;


import java.io.File;
import java.io.FileInputStream;

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

@Service
public class CommonService {
	
	
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
	
	
	
	
	
	
}
