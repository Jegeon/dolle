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
public class NoticeFileUtils {
	
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
				fileInfoMap.put("noticeIdx", noticeIdx);
				fileInfoMap.put("noticeOriginalFileName", noticeOriginalFileName);
				fileInfoMap.put("noticeStoredFileName", noticeStoredFileName);
				fileInfoMap.put("noticeFileSize", multipartFile.getSize());
				
				fileList.add(fileInfoMap);
			}
		}
		
		return fileList;
		
	}
	
	public void parseUpdateFileInfo(Map<String, Object> tempFileMap)
		throws Exception{
		
		String noticeStoredFileName
			= (String)tempFileMap.get("NOTICE_STORED_FILE_NAME");
		
		File file = new File(FILE_PATH + "/" + noticeStoredFileName);
		
		if (file.exists()) {
			file.delete();
		}else {
			System.out.println("파일이 존재하지 않습니다.");
			throw new Exception();
		}
	}
	
}
