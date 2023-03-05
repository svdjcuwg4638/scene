package com.itbank.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class UserProfile {

	@Autowired
	private ServletContext servletContext;	
	
	private final String userProfile;

	public UserProfile() {
		userProfile = "/resources/img/";
	}
	
    public void saveProfile(MultipartFile user_img_file) {
        String realPath = servletContext.getRealPath("/resources/img");
        File imgDir = new File(realPath);
        if (!imgDir.exists()) {
            imgDir.mkdirs();
        }
        File dest = new File(imgDir, user_img_file.getOriginalFilename());
        try {
        	if (dest.exists()) {dest.delete();}
            user_img_file.transferTo(dest);
        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}