
package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pack.Dbconnection;
import pack.MailUtil;


public class rights extends HttpServlet {

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
           String token=request.getParameter("token");
           String uname=request.getParameter("uname");
          // out.println(token+" "+uname);
           String upload=request.getParameter("upload");
           String update=request.getParameter("update");
           String down=request.getParameter("download");
           
           Connection con=Dbconnection.getConn();
           Statement st=con.createStatement();
            int i=st.executeUpdate("update rights  set upload_='"+upload+"',update_='"+update+"',download_='"+down+"' where token_='"+token+"'");
             ResultSet rt=st.executeQuery("select mail from user_reg where username='"+uname+"'");
             
             if(rt.next()){
                    String[] mail=new String[]{rt.getString("mail")};
             String msg= "Token:"+token+"\n "+"Your Rights \n Update: "+update+"\n Upload:"+upload+"\nDownload:"+down;
             new MailUtil().sendMail(mail, mail, "Token",msg );
             }
             else{
                 out.println("mail error...");
             }
          
            
            if(i!=0){
            response.sendRedirect("users.jsp?rights='updated'");
        }
        else{
            out.println("updation error...");
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
