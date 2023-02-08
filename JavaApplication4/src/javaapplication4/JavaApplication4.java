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
        patFile.setPatId("001000063139");
        patFile.setOrderId("10");
        patFile.setCrtdBy("001");
        patFile.setFileType("jpg");
        patFile.setFileName("panda4.jpg");
        patFile.setFileBase64(base64);
        
       // String query_url = "http://221.120.219.214:7000/patientInformation";
         // String json = "{\"patientId\" : \"1792147\", \"contactNumber\" : \"03003512602\"}";
          String query_url = "http://192.168.18.47:7000/patientSampleFile";
        String json = "{ \"patientId\" : \"" + patFile.getPatId()
                 + "\", \"orderId\" : \"" + patFile.getOrderId()
                + "\", \"crtdBy\" : \"" + patFile.getCrtdBy()
                + "\", \"locationId\" : \"" + patFile.getLocId()
                + "\", \"fileType\" : \"" + patFile.getFileType()
                + "\", \"fileName\" : \"" + patFile.getFileName()
                + "\", \"fileBytes\" : \"" + patFile.getFileBase64() + "\" }";
                
        
        /*
        {
        "patientId": "001000063139",
        "orderId": "10",
        "crtdBy": "001",
        "locationId": "001",
        "fileType": "PDF",
        "fileName": "test.pdf",
        "fileBytes": ""

}
        */
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
//           // read the response
//           InputStream in = new BufferedInputStream(conn.getInputStream());
//           String result = IOUtils.toString(in, "UTF-8");
           //System.out.println(result);
           int status = conn.getResponseCode();
           System.out.println(status);
           //System.out.println("result after Reading JSON Response");
//           JSONObject resp = new JSONObject(result);
//           JSONArray res = resp.getJSONArray("res");
//           JSONObject resLine = res.getJSONObject(1);
//           System.out.println(resLine.getString("cptDescription"));
//           String patName = myResponse.getString("patientName");
//           System.out.println(patName);
//           in.close();
           conn.disconnect();
           } catch (Exception e) {
   			System.out.println(e);
   		}
    }
}