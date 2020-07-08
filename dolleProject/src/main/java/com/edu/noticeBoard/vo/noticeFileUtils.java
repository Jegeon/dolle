package com.edu.noticeBoard.vo;

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

@Component("noticeFileUtils")
public class noticeFileUtils {
	
	private static final String FILE_PATH = "D:\\upload";
	
	public List<Map<String, Object>> parseInsertFileInfo(int noticeIdx,
			MultipartHttpServletRequest multipartHttpServletRequest)
				throws IllegalStateException, IOException{
		
		Iterator<String> iterator =
			multipartHttpServletRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		
		String noticeOriginalFileName = null;
		String originalFileExtension = null;
		String noticeStoredFileName = null;
		
		List<Map<String, Object>> fileList = 
			new ArrayList<Map<String, Object>>();
		Map<String, Object> fileInfoMap = null;
		
		File file = new File(FILE_PATH);
		
		if(file.exists() == false) {
			file.mkdirs();
		}
		
		while(iterator.hasNext()) {
			multipartFile =
					multipartHttpServletRequest.getFile(iterator.next());
			
			if(multipartFile.isEmpty() == false) {
				noticeOriginalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = 
						noticeOriginalFileName.substring(
								noticeOriginalFileName.lastIndexOf("."));
				noticeStoredFileName = CommonUtils.getRandomString()
						+ originalFileExtension;
				
				file = new File(FILE_PATH, noticeStoredFileName);
				multipartFile.transferTo(file);
				
				fileInfoMap = new HashMap<String, Object>();
				fileInfoMap.put("notice_idx", noticeIdx);
				fileInfoMap.put("notice_original_file_name", noticeOriginalFileName);
				fileInfoMap.put("notice_stored_file_name", noticeStoredFileName);
				fileInfoMap.put("notice_file_size", multipartFile.getSize());
				
				fileList.add(fileInfoMap);
			}
		}
		
		return fileList;
		
	}
	
}
