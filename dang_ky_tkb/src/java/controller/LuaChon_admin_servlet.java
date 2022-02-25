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
public class LuaChon_admin_servlet extends HttpServlet{
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
        if(request.getParameter("chinh_sua_mk")!=null){
            response.sendRedirect("ChinhSuaMK.jsp");
        }
        else if(request.getParameter("quan_ly_sv")!=null){
            response.sendRedirect("QuanLySV_admin.jsp");
        }
        else if(request.getParameter("quan_ly_lhp")!=null){
            response.sendRedirect("QuanLyLHP_admin.jsp");
        }
        else if(request.getParameter("dang_xuat")!=null){
            request.getSession().setAttribute("ma_sv",null);
            response.sendRedirect("DangNhap.jsp");
        }
    }  
}
