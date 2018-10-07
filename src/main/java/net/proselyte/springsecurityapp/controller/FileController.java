package net.proselyte.springsecurityapp.controller;

import net.proselyte.springsecurityapp.model.Good_char;
import net.proselyte.springsecurityapp.model.Good_img;
import net.proselyte.springsecurityapp.model.Goods;
import net.proselyte.springsecurityapp.service.FileService;
import net.proselyte.springsecurityapp.service.ORMService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.io.*;
import java.util.List;

/**
 * Created by Ilia on 27.02.2018.
 */
@Controller
@SessionAttributes("filename")
public class FileController {

    @Autowired
    private ORMService ormService;

    @Autowired
    private FileService fileService;

    @RequestMapping(value = "/add_good", method = RequestMethod.POST)
    public ModelAndView uploadFile(@ModelAttribute("good") Goods uploadedFile, BindingResult result) {// имена параметров (тут - "uploadedFile") - из формы JSP.

        ModelAndView modelAndView = new ModelAndView();
        List<String> fileNames=fileService.uploadFile(uploadedFile.getFile(),result);
        if(fileNames!=null){
            for(String fileName: fileNames) {
                Good_img good_img= new Good_img();
                good_img.setImage_src("/resources/img/loadFiles/" + fileName);
                uploadedFile.addGood_img(good_img);
            }
            for(Good_char good_char:uploadedFile.getGood_chars()) {
                good_char.setGood_char_id(uploadedFile);
            }
            ormService.insertNewGood(uploadedFile);
            modelAndView.setViewName("redirect:/home");
        }else {
            modelAndView.setViewName("errorpage");
        }
        return modelAndView;
    }

    @RequestMapping("/image/img_id={img_id}")
    public ResponseEntity<byte[]> testphoto(
            @PathVariable(value = "img_id") int img_id) throws IOException {
        String rootPath = ("D:\\SpringSecurityApp/src/main/webapp\\");
        Good_img good_img = ormService.getImgById(img_id);
        String image_src=good_img.getImage_src();
        String format = image_src.split("\\.")[1];

        ByteArrayOutputStream out = null;
        InputStream input = null;
        try{
            out = new ByteArrayOutputStream();
            input = new BufferedInputStream(new FileInputStream(rootPath + File.separator + image_src));
            int data = 0;
            while ((data = input.read()) != -1){
                out.write(data);
            }
        }
        finally{
            if (null != input){
                input.close();
            }
            if (null != out){
                out.close();
            }
        }
        byte[] bytes = out.toByteArray();

        final HttpHeaders headers = new HttpHeaders();
        if (format.equals("png"))
            headers.setContentType(MediaType.IMAGE_PNG);
        if (format.equals("jpg")||format.equals("jpeg"))
            headers.setContentType(MediaType.IMAGE_JPEG);
        if (format.equals("gif"))
            headers.setContentType(MediaType.IMAGE_GIF);
        return new ResponseEntity<byte[]>(bytes, headers, HttpStatus.CREATED);
    }


    @RequestMapping(value="/upload", method = RequestMethod.GET)
    public String upload(){
        return "upload";
    }
}
