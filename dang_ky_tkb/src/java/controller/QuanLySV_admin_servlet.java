package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.LopHocPhan_model;
import DAO.LopHocPhan_DAO;
import DAO.SinhVien_DAO;
import DAO.ThoiKhoaBieu_DAO;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.TrongException;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author JohnLark
 */
public class QuanLySV_admin_servlet extends HttpServlet{
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
        try{
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("utf-8");
            LopHocPhan_DAO lopHocPhan_DAO = new LopHocPhan_DAO();
            ThoiKhoaBieu_DAO thoiKhoaBieu_DAO = new ThoiKhoaBieu_DAO();
            SinhVien_DAO sinhVien_DAO = new SinhVien_DAO();
            if(request.getParameter("tim_kiem")!=null){
                request.getSession().setAttribute("ma_tim_kiem",request.getParameter("ma_tim_kiem"));
                request.getSession().setAttribute("ten_tim_kiem",request.getParameter("ten_tim_kiem"));
                response.sendRedirect("QuanLySV_admin.jsp");
            }
            else if(request.getParameter("xoa")!=null){
                String ma_sv = (String)request.getParameter("xoa");
                sinhVien_DAO.xoaSV(ma_sv);
                response.sendRedirect("QuanLySV_admin.jsp?err=xoa_thanh_cong");
            }
            else if(request.getParameter("mo_rong")!=null){
                String ma = (String)request.getParameter("mo_rong");
                request.getSession().setAttribute("mo_rong",ma);
                response.sendRedirect("QuanLySV_admin.jsp");
            }
            else if(request.getParameter("chinh_sua")!=null){
                String ma = request.getParameter("chinh_sua");
                String ten_moi = request.getParameter("ten_sv");
                String ma_moi = request.getParameter("ma_sv");
                String mk_moi = request.getParameter("mk");
                if(ma_moi.matches("^[Bb]{1}\\d{2}[A-Za-z]{4}\\d{3}$")){
                    if(sinhVien_DAO.suaSV(ma, ma_moi, ten_moi, mk_moi)){
                        request.getSession().setAttribute("mo_rong",null);
                        response.sendRedirect("QuanLySV_admin.jsp?err=sua_thanh_cong");
                    }
                    else{
                        response.sendRedirect("QuanLySV_admin.jsp?err=that_bai");
                    }
                }
                else{
                    response.sendRedirect("QuanLySV_admin.jsp?err=ma_khong_hop_le");
                }
            }
            else if(request.getParameter("them_moi")!=null){
                String ma = request.getParameter("them_moi");
                String ten_moi = request.getParameter("ten_sv");
                String ma_moi = request.getParameter("ma_sv");
                String mk=request.getParameter("mk");
                if(ma_moi.matches("^[Bb]{1}\\d{2}[A-Za-z]{4}\\d{3}$")){
                    if(sinhVien_DAO.themSV(ma_moi, ten_moi, mk)){
                        response.sendRedirect("QuanLySV_admin.jsp?err=them_thanh_cong");
                    }
                    else{
                        response.sendRedirect("QuanLySV_admin.jsp?err=that_bai");
                    }
                }
                else{
                    response.sendRedirect("QuanLySV_admin.jsp?err=ma_khong_hop_le");
                }
            }
            else if(request.getParameter("quay_lai")!=null){
                response.sendRedirect("LuaChon_admin.jsp");
            }
            else if(request.getParameter("dang_xuat")!=null){
                request.getSession().setAttribute("ma_sv",null);
                response.sendRedirect("DangNhap.jsp");
            }
        }catch(SQLException e){
            
        } catch (TrongException ex) {
            response.sendRedirect("QuanLySV_admin.jsp?err=that_bai");
        }
    }
}
