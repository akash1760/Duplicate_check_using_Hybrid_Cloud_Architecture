
package action;

import com.oreilly.servlet.MultipartRequest;
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
//import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pack.Dbconnection;
import pack.Ftpcon;
import pack.MailUtil;
import pack.encryption;


public class upload extends HttpServlet {
File file;
final String filepath="D:/";
    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
             MultipartRequest m=new MultipartRequest(request,filepath);
           File file=m.getFile("file");           
           String filename=file.getName().toLowerCase();
           
            Connection con= Dbconnection.getConn();
            Statement st3=con.createStatement();
            ResultSet rt3=st3.executeQuery("select * from files where filename='"+filename+"'");
            if(rt3.next()){
                response.sendRedirect("upload.jsp?failed='yes'");
            }
            else{
           System.out.println("file location:"+filepath+"\n file name:"+filename+"\n");  
            
            BufferedReader br=new BufferedReader(new FileReader(filepath+filename));
            StringBuffer sb=new StringBuffer();
            String temp=null;
            
            while(( temp=br.readLine())!=null){
               sb.append(temp);              
           }           
           System.out.println("file content:"+sb.toString());
           
           
           
           // secretkey generating
	KeyGenerator keyGen = KeyGenerator.getInstance("AES");
	keyGen.init(128);
	SecretKey secretKey = keyGen.generateKey();
        System.out.println("secret key:"+secretKey);
        
            encryption e=new encryption();
           String encryptedtext=e.encrypt(sb.toString(),secretKey);
           //storing encrypted file
            FileWriter fw=new FileWriter(file);
            fw.write(encryptedtext);
            fw.close();
            
        //converting secretkey to String
            byte[] b=secretKey.getEncoded();//encoding secretkey
            String skey=Base64.encode(b);
            System.out.println("converted secretkey to string:"+skey);
            
            
            
            
            //getting properties
            HttpSession user=request.getSession(true);
            String owner=user.getAttribute("username").toString();
            
             DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	   //get current date time with Date()
	     Date date = new Date();
	     System.out.println(dateFormat.format(date));
             String time=dateFormat.format(date); 
	   //get current date time with Calendar()
	    Calendar cal = Calendar.getInstance();
	    System.out.println(dateFormat.format(cal.getTime()));
            
            String len=file.length()+"bytes";
            
            //uploading file
            boolean status=new Ftpcon().upload(file);
            
            if(status){
                //Connection con= Dbconnection.getConn();
                Statement st=con.createStatement();
                
                 Statement st1=con.createStatement();
                 ResultSet rt1=st1.executeQuery("select * from user_reg where username='"+owner+"'");
                //sending filekey to users mail
                 if(rt1.next()){
                String ma=rt1.getString("mail");
                String[] mail=new String[]{ ma };
                String msg="Filename:"+file.getName()+"\n Filekey:"+skey;
                new MailUtil().sendMail(mail, mail,"File Key", msg);    
                 }
                 else{
                     out.println("error while sending mail");
                 }
                
                int i=st.executeUpdate("insert into files(filename,content,owner_name,upload_time,size,file_key)values('"+file.getName()+"','"+encryptedtext+"','"+owner+"','"+time+"','"+len+"','"+skey+"')");
                
                if(i!=0){
                   System.out.println("success");
                    response.sendRedirect("upload.jsp?status='uploded'");
                    
                }
                else{
                    out.println("error while uploading additional informations");
                }
                 System.out.println("file stored");
//                 out.println(file.length());
            }
            else{
                out.println("error");
            }
            }
        }
        catch(Exception e){
            out.println(e);
        }
        finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
