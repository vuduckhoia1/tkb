/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.SinhVien_DAO;
import DAO.ThoiKhoaBieu_DAO;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServlet;
import model.TrongException;

/**
 *
 * @author JohnLark
 */
public class DangNhap_servlet extends HttpServlet{
    
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            SinhVien_DAO sinhVien_DAO = new SinhVien_DAO();
            String ma=request.getParameter("ma_sv");
            String mk=request.getParameter("mk");
            if("".equals(ma)||"".equals(mk)){
                response.sendRedirect("DangNhap.jsp?err=trong");
            }
            else {
                boolean ktdn = sinhVien_DAO.KiemTraDangNhap(ma,mk);
                if(ktdn){
                    request.getSession().setAttribute("ma_sv", ma);
                    if(ma.equals("admin")){
                        response.sendRedirect("LuaChon_admin.jsp");                       
                    }
                    else{
                        ThoiKhoaBieu_DAO thoiKhoaBieu_DAO = new ThoiKhoaBieu_DAO();
                        request.getSession().setAttribute("TKB", thoiKhoaBieu_DAO.getDsid_lhp(ma));
                        response.sendRedirect("LuaChon.jsp");
                    }
                }
                else{
                    response.sendRedirect("DangNhap.jsp?err=sai");
                }
            }
        } catch (SQLException ex) {
            
        } catch (TrongException ex) {
            response.sendRedirect("DangNhap.jsp?err=trong");
        }
    }
    
}
