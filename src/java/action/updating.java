
package action;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pack.Dbconnection;
import pack.encryption;

public class updating extends HttpServlet {

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
          String[] s=request.getQueryString().split(",");
          String id=s[0];
          String fname=s[1];
                    
            //String id=request.getQueryString();
            String content=request.getParameter("content");
          
            KeyGenerator keyGen = KeyGenerator.getInstance("AES");
	keyGen.init(128);
	SecretKey secretKey = keyGen.generateKey();
        System.out.println("secret key:"+secretKey);
        
            encryption e=new encryption();
           String encryptedtext=e.encrypt(content,secretKey);
           //storing encrypted file
//            FileWriter fw=new FileWriter(file);
//            fw.write(encryptedtext);
//            fw.close();
            
        //converting secretkey to String
            byte[] b=secretKey.getEncoded();//encoding secretkey
            String skey=Base64.encode(b);
            System.out.println("converted secretkey to string:"+skey);
            
            Connection con=Dbconnection.getConn();
            Statement st=con.createStatement();
            
            HttpSession user=request.getSession();
            String uname=user.getAttribute("username").toString();
            
             DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	   //get current date time with Date()
	     Date date = new Date();
	     System.out.println(dateFormat.format(date));
             String time=dateFormat.format(date);
             
          // InputStream is = new ByteArrayInputStream(encryptedtext.getBytes());
            
           st.executeUpdate("insert into updates (filename, username, time)values('"+fname+"','"+uname+"','"+time+"')");
//             
            int i= st.executeUpdate("update files set content='"+encryptedtext+"',file_key='"+skey+"' where idfiles='"+id+"'");
            if(i!=0){
                response.sendRedirect("update.jsp?updated='yes'");
            }
            else{
                out.println("error while updating");
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
