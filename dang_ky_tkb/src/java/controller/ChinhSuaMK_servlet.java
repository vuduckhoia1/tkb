/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.SinhVien_DAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.SinhVien_model;
import model.TrongException;

/**
 *
 * @author duytuan
 */
public class ChinhSuaMK_servlet extends HttpServlet{
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ma_sv=request.getParameter("ma_sv");
        if(request.getParameter("doi_mk")!=null){
            String mk_hien_tai = request.getParameter("MK_hien_tai");
            String mk_moi = request.getParameter("MK_moi");
            if("".equals(mk_hien_tai)||"".equals(mk_moi)){
                response.sendRedirect("ChinhSuaMK.jsp?err=trong");
            }
            else{
                try {
                    SinhVien_DAO sinhVien_DAO = new SinhVien_DAO();
                    String ma = (String)request.getSession().getAttribute("ma_sv");
                    if(sinhVien_DAO.KiemTraDangNhap(ma, mk_hien_tai)){
                        if(mk_moi.equals(mk_hien_tai)){
                            response.sendRedirect("ChinhSuaMK.jsp?err=trungMK");
                        }
                        else{
                            sinhVien_DAO.DoiMK(ma, mk_moi);
                            response.sendRedirect("ChinhSuaMK.jsp?err=xong");
                        }
                    }
                    else{
                        response.sendRedirect("ChinhSuaMK.jsp?err=saiMK");
                    }
                } catch (SQLException ex) {
                } catch (TrongException ex) {
                    response.sendRedirect("ChinhSuaMK.jsp?err=saiMK");
                }
            }
        }
        else if(request.getParameter("quay_lai1")!=null){
            response.sendRedirect("LuaChon_admin.jsp");
        }
        else if(request.getParameter("quay_lai2")!=null){
            response.sendRedirect("LuaChon.jsp");
        }
        else if(request.getParameter("dang_xuat")!=null){
            request.getSession().setAttribute("ma_sv",null);
            response.sendRedirect("DangNhap.jsp");
        }
    }
    
}
