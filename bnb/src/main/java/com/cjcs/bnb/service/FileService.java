package com.cjcs.bnb.service;

import java.io.File;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cjcs.bnb.dto.SellerFileDto;
import com.cjcs.bnb.mappers.FileMapper;

@Service
public class FileService {
    @Autowired
    private FileMapper fileMapper; // MyBatis mapper

    private final String uploadDir = "src/main/resources/uploads/"; // 변경 가능한 경로

    public List<String> FileNamesBySellerId(String sellerId) {
        List<String> filenames = fileMapper.FileNamesBySellerId(sellerId);
        System.out.println("Filenames fetched: " + filenames);
        return filenames;
    }

    public boolean uploadFile(MultipartFile file, String sellerId) {
        try {
            // 파일 확장자 검사
            String originalFilename = file.getOriginalFilename();
            String extension = originalFilename.substring(originalFilename.lastIndexOf(".") + 1).toLowerCase();
            List<String> allowedExtensions = Arrays.asList("png", "jpg", "jpeg");

            if (!allowedExtensions.contains(extension)) {
                throw new Exception("Invalid file extension");
            }

            // 파일 크기 검사 (1MB 이하)
            long fileSize = file.getSize();
            if (fileSize > 1024 * 1024) { // 1MB = 1024 * 1024 bytes
                throw new Exception("File size exceeds limit");

            }

            // 실제 파일 저장 로직 (디스크 또는 다른 스토리지 서비스)
            String systemFileName = saveFileToDisk(file);

            // 데이터베이스에 파일 정보 저장
            fileMapper.insertFileInfo(sellerId, file.getOriginalFilename(), systemFileName);

            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public String saveFileToDisk(MultipartFile file) {
        try {
            File directory = new File(uploadDir);
            if (!directory.exists()) {
                directory.mkdirs(); // 중간 디렉토리까지 모두 생성
            }

            String originalFilename = file.getOriginalFilename();
            String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
            String randomFileName = UUID.randomUUID().toString() + extension;

            Path path = Paths.get(uploadDir + randomFileName);
            Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);

            return randomFileName;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

}
