package com.cjcs.bnb.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.tomcat.util.http.fileupload.impl.FileSizeLimitExceededException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartFile;

import com.cjcs.bnb.dao.MemberDao;     // DAO클래스 작성하기!!!!!!!!!!!!!!!!
import com.cjcs.bnb.dto.SellerFileDto;     // DTO클래스 작성하기!!!!!!!!!!!!!!!!

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
public class FileManager {     // 서버-파일 간 업로드(DB에추가O)/다운로드/삭제(DB에서삭제X) 관리..  이때 파일이 업로드될 서버내폴더의 경로는 세션으로부터 가져올거임

	@Autowired
	private MemberDao mDao;

	
	// 서버에 파일 업로드
	public boolean fileUpload(List<MultipartFile> attachments, HttpSession session, String s_id) {
		
		log.info("FileManager class");
		
		
		// 1. 프로젝트 내 파일업로드할 경로 찾기
		String realPath = session.getServletContext().getRealPath("/");
		log.info("realPath={}", realPath);
		realPath += "upload/";
		log.info("realPath={}", realPath);
		
		
		// 2. 폴더생성을 꼭 할 것
		File dir = new File(realPath);
		if (dir.isDirectory() == false) {    // upload폴더가 없다면
			dir.mkdir();                     // upload폴더 생성
		}                                    // 서버 클린하면 삭제되기 때문에.. 
		

		// 파일의 정보를 BoardFile(DTO) 또는 HashMap에 저장
		Map<String, String> fMap = new HashMap<String, String>();
		fMap.put("s_id", s_id);       // 해시맵에 판매자id 저장
		System.out.println("size: "+attachments.size());
		boolean result = true;
		
		for( MultipartFile mf : attachments) {
			
			// 3. 파일 메모리에 저장
			String oriFileName = mf.getOriginalFilename(); // a.txt
			if(oriFileName.equals("")){
				return false;
			}
			System.out.println("원조 파일: "+ oriFileName);
			fMap.put("oriFileName", oriFileName);       // 해시맵에 원래파일명 저장


			// 4. 시스템파일이름 생성 a.txt ==> 112323242424.txt
			String sysFileName = System.currentTimeMillis() + "."
					+ oriFileName.substring(oriFileName.lastIndexOf(".") + 1);
			System.out.println("서버 파일: "+ sysFileName);
			fMap.put("sysFileName", sysFileName);       // 해시맵에 서버파일명 저장


			// 5. 메모리->실제 파일 업로드
			try {
				mf.transferTo(new File(realPath + sysFileName)); // 멀티파트파일의 트랜스퍼메서드: 서버upload폴더에 파일 저장
				//Map버전
				result= mDao.fileInsertMap(fMap);                // DB에다 insert도 함.
				if (result == false) break;
			} catch (IOException e) {
				System.out.println(e.getMessage());
				System.out.println("파일업로드 예외 발생");
				e.printStackTrace();
				result=false;
				break;  //반복 중단
			}
			
		} // 하나의 파일 업로드 end
		
		return result;
		
	} // 전체 파일 업로드 end
	
	
	// 서버로부터 파일 다운로드
	public ResponseEntity<Resource> fileDownload(SellerFileDto sfile, HttpSession session) throws FileNotFoundException, UnsupportedEncodingException {
		
		log.info("fileDownload()");
		
		//파일 저장 경로
		String realpath = session.getServletContext().getRealPath("/");
		realpath += "upload/" + sfile.getBf_sysname();
		
		//실페 파일이 저장된 하드디스크까지 경로를 수립
		InputStreamResource fResource = new InputStreamResource(new FileInputStream(realpath));
		
		//파일명이 한글인 경우의 처리(UTF-8로 인코딩)
		String fileName = URLEncoder.encode(sfile.getBf_oriname(), "UTF-8");
		
		//이미지 보여주기
		//resp.setContentType("image/jpeg");  이부분은 그냥 삭제하래.. 스프링 레거시에서 하던 방식이라는데 지금은 안 먹히나 봄.
		
		return ResponseEntity.ok()
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + fileName)
//				.contentType(MediaType.IMAGE_JPEG)
				.cacheControl(CacheControl.noCache()).body(fResource);
		
	} // 파일 다운로드 end


	// 서버에 업로드한 파일 삭제
	public void fileDelete(String[] sysNameFiles, HttpSession session) {
		
		String realPath = session.getServletContext().getRealPath("/");
		realPath += "upload/";
		log.info("delete realPath: {}", realPath);
		
		for (String sysname : sysNameFiles) {  
			
			File file = new File(realPath + sysname);
			log.info("File: {}", file.getAbsoluteFile());
			
			if (file.exists()) {
				file.delete();
				log.info("서버 파일 삭제 완료");
			} else {
				log.info("이미 삭제된 파일");
			}
			
		}
		
	} // 파일 삭제 end
	
}
