package com.cjcs.bnb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cjcs.bnb.service.FileService;

@Controller
public class FileUploadController {

    @Autowired
    private FileService fileService; // 서비스 레이어

    @PostMapping("/seller/settings/account")
    @ResponseBody
    public ResponseEntity<String> upload(@RequestParam("file") MultipartFile file,
            @RequestParam("sellerId") String sellerId,
            Model model) {

        System.out.println("Received upload request with sellerId: " + sellerId);

        try {
            // 파일 저장 및 데이터베이스 업데이트 로직
            boolean isUploaded = fileService.uploadFile(file, sellerId);

            if (isUploaded) {
                System.out.println("File uploaded successfully for sellerId: " + sellerId);
                return new ResponseEntity<>("success", HttpStatus.OK);
            } else {
                System.out.println("File upload failed for sellerId: " + sellerId);
                return new ResponseEntity<>("failed", HttpStatus.BAD_REQUEST);
            }
        } catch (Exception e) {
            System.out.println("Exception occurred while uploading file for sellerId: " + sellerId);
            e.printStackTrace();
            return new ResponseEntity<>("failed", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @RequestMapping("/seller/settings/account")
    public String showServerFileNames(Model model, @RequestParam(required = false) String sellerId) {

        return "/seller/sellerInfoDetail";
    }

}
