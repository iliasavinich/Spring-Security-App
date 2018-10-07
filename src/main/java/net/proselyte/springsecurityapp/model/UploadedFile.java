package net.proselyte.springsecurityapp.model;

import org.springframework.web.multipart.MultipartFile;

/**
 * Created by Ilia on 27.02.2018.
 */
public class UploadedFile {

    private MultipartFile file;

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }
}

