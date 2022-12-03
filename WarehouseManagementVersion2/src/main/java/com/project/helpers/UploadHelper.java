package com.project.helpers;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.web.multipart.MultipartFile;

public class UploadHelper {
	public static String upload(ServletContext servletContext, MultipartFile file) {
		try {
			String fileName = generateFileName(file.getOriginalFilename());
			byte[] bytes = file.getBytes();
			Path path = Paths.get(servletContext.getRealPath("/assets/uploads/" + fileName));
			Files.write(path, bytes);
			return fileName;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public static String uploadLogo(ServletContext servletContext, MultipartFile file) {
		try {
			String fileName = generateFileName(file.getOriginalFilename());
			byte[] bytes = file.getBytes();
			Path path = Paths.get(servletContext.getRealPath("/assets/logo/" + fileName));
			Files.write(path, bytes);
			return fileName;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static String uploadProduct(ServletContext servletContext, MultipartFile file) {
		try {
			String fileName = generateFileName(file.getOriginalFilename());
			byte[] bytes = file.getBytes();
			Path path = Paths.get(servletContext.getRealPath("/assets/product/" + fileName));
			Files.write(path, bytes);
			return fileName;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public static String generateFileName(String fileName) {
		String uuid = UUID.randomUUID().toString().replace("-", "");
		int index = fileName.lastIndexOf(".");
		String ext = fileName.substring(index);
		return uuid + ext;
	}
	
	public static void deleteFile(ServletContext servletContext, String fileName) {
		try {
			Path path = Paths.get(servletContext.getRealPath("/assets/uploads/" + fileName));
			Files.delete(path);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void deleteFileLogo(ServletContext servletContext, String fileName) {
		try {
			Path path = Paths.get(servletContext.getRealPath("/assets/logo/" + fileName));
			Files.delete(path);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}