package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.LopHocPhan_model;
import DAO.LopHocPhan_DAO;
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
public class QuanLyLHP_admin_servlet extends HttpServlet{
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
        try{
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("utf-8");
            LopHocPhan_DAO lopHocPhan_DAO = new LopHocPhan_DAO();
            ThoiKhoaBieu_DAO thoiKhoaBieu_DAO = new ThoiKhoaBieu_DAO();
            if(request.getParameter("xoa")!=null){
                int id = Integer.valueOf((String)request.getParameter("xoa"));
                lopHocPhan_DAO.xoaLhp(id);
                response.sendRedirect("QuanLyLHP_admin.jsp");
            }
            else if(request.getParameter("mo_rong")!=null){
                int id = Integer.valueOf((String)request.getParameter("mo_rong"));
                request.getSession().setAttribute("lhp_mo_rong",id);
                response.sendRedirect("QuanLyLHP_admin.jsp");
            }
            else if(request.getParameter("chinh_sua")!=null){
                int id = Integer.valueOf((String)request.getParameter("chinh_sua"));
                String ten = request.getParameter("ten_mon_hoc");
                String ma = request.getParameter("ma_mon_hoc");
                String gv = request.getParameter("giang_vien");
                int ss = Integer.valueOf(request.getParameter("si_so"));
                String phong = request.getParameter("phong_hoc");
                int tc = Integer.valueOf(request.getParameter("tin_chi"));
                String tuan = request.getParameter("tuan_hoc");
                int nhom = Integer.valueOf(request.getParameter("nhom_lop"));
                int thu = Integer.valueOf(request.getParameter("thu"));
                int tiet = Integer.valueOf(request.getParameter("tiet"));
                LopHocPhan_model lhp = new LopHocPhan_model(id, ten, gv, ss, phong, tc, tuan, ma, nhom, thu, tiet); 
                if(lopHocPhan_DAO.suaLhp(lhp)){
                    response.sendRedirect("QuanLyLHP_admin.jsp?err=sua_thanh_cong");
                }
                else{
                    response.sendRedirect("QuanLyLHP_admin.jsp?err=that_bai");
                }
            }
            else if(request.getParameter("them_moi")!=null){
                String ten = request.getParameter("ten_mon_hoc");
                String ma = request.getParameter("ma_mon_hoc");
                String gv = request.getParameter("giang_vien");
                int ss = Integer.valueOf(request.getParameter("si_so"));
                String phong = request.getParameter("phong_hoc");
                int tc = Integer.valueOf(request.getParameter("tin_chi"));
                String tuan = request.getParameter("tuan_hoc");
                int nhom = Integer.valueOf(request.getParameter("nhom_lop"));
                int thu = Integer.valueOf(request.getParameter("thu"));
                int tiet = Integer.valueOf(request.getParameter("tiet"));
                if(!lopHocPhan_DAO.TonTaiLhp(ten, gv, ss, phong, tc, tuan, ma, nhom, thu, tiet)){
                    LopHocPhan_model lhp = new LopHocPhan_model(lopHocPhan_DAO.getId_max()+1, ten, gv, ss, phong, tc, tuan, ma, nhom, thu, tiet); 
                    if(lopHocPhan_DAO.themLhp(lhp)){
                        response.sendRedirect("QuanLyLHP_admin.jsp?err=them_thanh_cong");
                    }
                    else{
                        response.sendRedirect("QuanLyLHP_admin.jsp?err=that_bai");
                    }
                }
                else{
                    response.sendRedirect("QuanLyLHP_admin.jsp?err=trung");
                }
            }
            else if(request.getParameter("quay_lai")!=null){
                response.sendRedirect("LuaChon_admin.jsp");
            }
            else if(request.getParameter("dang_xuat")!=null){
                request.getSession().setAttribute("ma_sv",null);
                response.sendRedirect("DangNhap.jsp");
            }
            else if(request.getParameter("mon_hoc")!=null){
                request.getSession().setAttribute("mon_hien_tai",request.getParameter("mon_hoc"));
                response.sendRedirect("QuanLyLHP_admin.jsp");
            }
        }catch(SQLException e){
            
        } catch (TrongException ex) {
            response.sendRedirect("QuanLyLHP_admin.jsp?err=that_bai");
        }catch(NumberFormatException e){
            response.sendRedirect("QuanLyLHP_admin.jsp?err=that_bai");
        }
    }
}
