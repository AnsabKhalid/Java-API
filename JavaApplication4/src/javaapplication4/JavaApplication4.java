/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javaapplication4;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author USER
 */
public class JavaApplication4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        JavaApplication4.call_api();
    }
    
    public static void call_api() {
        
        File file = new File("panda.jpg");
        String filePath = file.getAbsolutePath();
        byte[] bytes = null;
        try {
            bytes = Files.readAllBytes(Paths.get(filePath));
        } catch (IOException ex) {
            Logger.getLogger(JavaApplication4.class.getName()).log(Level.SEVERE, null, ex);
        }
        String base64 = Base64.getEncoder().encodeToString(bytes);
        //System.out.println(base64);
        patientFile patFile = new patientFile();
        patFile.setPatId("");
        patFile.setOrderId("");
        patFile.setCrtdBy("");
        patFile.setFileType("jpg");
        patFile.setFileName("panda4.jpg");
        patFile.setFileBase64(base64);
        

          String query_url = "http://IP:PORT/NAME";
        String json = "{ \"patientId\" : \"" + patFile.getPatId()
                 + "\", \"orderId\" : \"" + patFile.getOrderId()
                + "\", \"crtdBy\" : \"" + patFile.getCrtdBy()
                + "\", \"locationId\" : \"" + patFile.getLocId()
                + "\", \"fileType\" : \"" + patFile.getFileType()
                + "\", \"fileName\" : \"" + patFile.getFileName()
                + "\", \"fileBytes\" : \"" + patFile.getFileBase64() + "\" }";
                
        
       
          try {
           URL url = new URL(query_url);
           HttpURLConnection conn = (HttpURLConnection) url.openConnection();
           conn.setConnectTimeout(5000);
           conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
           conn.setDoOutput(true);
           conn.setDoInput(true);
           conn.setRequestMethod("POST");
           OutputStream os = conn.getOutputStream();
           os.write(json.getBytes("UTF-8"));
           os.close(); 

           int status = conn.getResponseCode();
           System.out.println(status);

           conn.disconnect();
           } catch (Exception e) {
   			System.out.println(e);
   		}
    }
}
