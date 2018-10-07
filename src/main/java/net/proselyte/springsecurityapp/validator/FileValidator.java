package net.proselyte.springsecurityapp.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.springframework.web.multipart.MultipartFile;

/**
 * Created by Ilia on 27.02.2018.
 */

@Component
public class FileValidator implements Validator {

    @Override
    public void validate(Object uploadedFile, Errors errors) {

        MultipartFile file = (MultipartFile) uploadedFile;

        if (file.getSize() == 0) {
            errors.rejectValue("file", "uploadForm.selectFile", "Please select a file!");
        }

    }

    @Override
    public boolean supports(Class<?> clazz) {
        // TODO Auto-generated method stub
        return false;
    }

}
