/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.ThoiKhoaBieu_DAO;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author JohnLark
 */
public class XemTKB_servlet extends HttpServlet{
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("chi_tiet")!=null){
            if(request.getSession().getAttribute("lhp_chi_tiet")!=null&&((String)request.getSession().getAttribute("lhp_chi_tiet")).equals((String)request.getParameter("chi_tiet"))){
                request.getSession().setAttribute("lhp_chi_tiet",null);
                response.sendRedirect("XemTKB.jsp");                
            }
            else{
                request.getSession().setAttribute("lhp_chi_tiet",request.getParameter("chi_tiet"));
                response.sendRedirect("XemTKB.jsp");
            }
        }
        else if(request.getParameter("quay_lai")!=null){
            response.sendRedirect("LuaChon.jsp");
        }
        else if(request.getParameter("dang_xuat")!=null){
            request.getSession().setAttribute("ma_sv",null);
            response.sendRedirect("DangNhap.jsp");
        }
        else if(request.getParameter("tuan")!=null){
            request.getSession().setAttribute("tuan_hien_tai",request.getParameter("tuan"));
            request.getSession().setAttribute("lhp_chi_tiet",null);
            response.sendRedirect("XemTKB.jsp");
        }
    } 
}
