package com.edu.reservation.vo;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.edu.util.CommonUtils;

@Component("tourFileUtils")
public class TourFileUtils {

	private static final String FILE_PATH = "D:\\upload";	
	
//	public List<Map<String, Object>> parseInsertDefaultFileInfo(){
//		
//		String fileOriginalName = null;
//		String fileOriginalExtension = null;
//		String fileStoredName = null;
//		
//		File file = new File(FILE_PATH);
//		
//		if(file.exists() == false) {
//			file.mkdirs();
//		}
//		
//		fileOriginalName = "";//확장자 포함
//		fileOriginalExtension = 
//				fileOriginalName.substring(
//						fileOriginalName.lastIndexOf("."));
//		fileStoredName = CommonUtils.getRandomString() 
//				+ fileOriginalExtension;
//		 
//		file = new File(FILE_PATH, fileStoredName);
//		
//		fileInfoMap = new HashMap<String, Object>();
//		fileInfoMap.put("review_idx", reviewIdx);
//		fileInfoMap.put("review_original_file_name", fileOriginalName);
//		fileInfoMap.put("review_stored_file_name", fileStoredName);
//		fileInfoMap.put("review_file_size", multipartFile.getSize());
//		
//		fileList.add(fileInfoMap);
//			
//		return null;
//		
//	}
	
	public List<Map<String, Object>> parseInsertFileInfo(int tourIdx,
			MultipartHttpServletRequest multipartHttpServletRequest) 
				throws IllegalStateException, IOException{
		
		Iterator<String> iterator = 
			multipartHttpServletRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		
		String fileOriginalName = null;
		String fileOriginalExtension = null;
		String fileStoredName = null;
		
		List<Map<String, Object>> fileList = 
			new ArrayList<Map<String,Object>>();
		Map<String, Object> fileInfoMap = null;
		
		File file = new File(FILE_PATH);
		
		if(file.exists() == false) {
			file.mkdirs();
		}
		
		while(iterator.hasNext()) {
			multipartFile = 
				multipartHttpServletRequest.getFile(iterator.next());
			
			if(multipartFile.isEmpty() == false) {
				fileOriginalName = multipartFile.getOriginalFilename();
				fileOriginalExtension = 
						fileOriginalName.substring(
								fileOriginalName.lastIndexOf("."));
				fileStoredName = CommonUtils.getRandomString() 
						+ fileOriginalExtension;
				 
				file = new File(FILE_PATH, fileStoredName);
				multipartFile.transferTo(file);
				
				fileInfoMap = new HashMap<String, Object>();
				fileInfoMap.put("tour_idx", tourIdx);
				fileInfoMap.put("tour_original_file_name", fileOriginalName);
				fileInfoMap.put("tour_stored_file_name", fileStoredName);
				fileInfoMap.put("tour_file_size", multipartFile.getSize());
				
				fileList.add(fileInfoMap);
			}
			
		} // while end 
		
		
		return fileList;
	}

	public void parseUpdateFileInfo(Map<String, Object> tempFileMap) 
		throws Exception{
		// TODO Auto-generated method stub
		
		String fileStoredName 
			= (String)tempFileMap.get("TOUR_STORED_FILE_NAME");
		
		File file = new File(FILE_PATH + "/" + fileStoredName);
		
		if(file.exists()) {
			file.delete();
		}else {
			System.out.println("파일이 존재하지 않습니다.");
			throw new Exception();
		}
		
		
	}
	
}
