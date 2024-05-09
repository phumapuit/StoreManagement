package com.storeManagement.utils;

import javax.servlet.http.Part;
import java.io.File;

public class FileUtil {

    public static final String UPLOAD_DIR = "uploads";

    public static void getUploadDirectoryPath(String uploadFilePath) {
        // Creates the save directory if it does not exist
        File fileSaveDir = new File(uploadFilePath);
        if (!fileSaveDir.exists()) fileSaveDir.mkdirs();
    }

    /**
     * Utility method to get file name from HTTP header content-disposition
     */
    public static String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        System.out.println("content-disposition header= "+contentDisp);
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length()-1);
            }
        }
        return "";
    }

    public static final String[] imageBackground = {"bg1.webp","bg2.webp","bg3.webp","bg4.webp",
                                                     "bg5.webp","bg6.webp","bg7.webp","bg8.webp",
                                                     "bg9.webp","bg10.webp","bg11.webp","bg12.webp"};
}
