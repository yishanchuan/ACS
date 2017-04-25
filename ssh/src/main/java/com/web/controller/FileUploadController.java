package com.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileUploadController {
	
	@RequestMapping(value="/upload",method={RequestMethod.POST})
	public String FileUpload(@RequestParam("desc") String desc,@RequestParam("file") MultipartFile file,
			HttpServletRequest request) throws IOException{
		String dir="upload\\"+file.getOriginalFilename();
		System.out.println("UploadDir: "+dir);
		File upload=new File(dir);
		inputstreamtofile(file.getInputStream(),upload);
		return "success";
	}
	
	public void inputstreamtofile(InputStream ins,File file) throws IOException{
		OutputStream os = new FileOutputStream(file);
		int bytesRead = 0;
		byte[] buffer = new byte[8192];
		while ((bytesRead = ins.read(buffer, 0, 8192)) != -1) {
			os.write(buffer, 0, bytesRead);
		}
		os.close();
		ins.close();
	}
}
