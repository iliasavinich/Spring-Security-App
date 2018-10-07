package net.proselyte.springsecurityapp.service;

import net.proselyte.springsecurityapp.model.UploadedFile;
import net.proselyte.springsecurityapp.validator.FileValidator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.validation.BindingResult;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Ilia on 28.02.2018.
 */
@Repository
public class FileService {
    @Autowired
    private FileValidator fileValidator;

    private static final Logger logger = LoggerFactory.getLogger(FileService.class);

    public List<String> uploadFile(List<UploadedFile> files, BindingResult result) {// имена параметров (тут - "uploadedFile") - из формы JSP.

        List<String> fileNames = new ArrayList<>();
        for(UploadedFile file: files ) {
            fileValidator.validate(file.getFile(), result);
        }
        if (!result.hasErrors()) {

            try {
                for(UploadedFile file: files ) {
                    byte[] bytes = file.getFile().getBytes();

                    fileNames.add(file.getFile().getOriginalFilename()) ;

                    String rootPath = "D:\\SpringSecurityApp/src/main/webapp/resources/img\\";
                    File dir = new File(rootPath + File.separator + "loadFiles");

                    if (!dir.exists()) {
                        dir.mkdirs();
                    }

                    File loadFile = new File(dir.getAbsolutePath() + File.separator + file.getFile().getOriginalFilename());

                    BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(loadFile));
                    stream.write(bytes);
                    stream.flush();
                    stream.close();

                    logger.info("uploaded: " + loadFile.getAbsolutePath());
                }

                return fileNames;


            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

        }
        return null;
    }
}
