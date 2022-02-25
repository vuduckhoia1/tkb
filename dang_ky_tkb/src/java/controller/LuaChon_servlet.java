/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author JohnLark
 */
public class LuaChon_servlet extends HttpServlet{
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
        if(request.getParameter("ChinhSuaMK")!=null){
            response.sendRedirect("ChinhSuaMK.jsp");
        }
        else if(request.getParameter("DangKyTKB")!=null){
            response.sendRedirect("DangKyTKB.jsp");
        }
        else if(request.getParameter("XemTKB")!=null){
            response.sendRedirect("XemTKB.jsp");
        }
        else if(request.getParameter("DangXuat")!=null){
            request.getSession().setAttribute("ma_sv",null);
            response.sendRedirect("DangNhap.jsp");
        }
    }  
}
