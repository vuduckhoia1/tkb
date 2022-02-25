package controller;

import java.io.IOException;
import java.util.ArrayList;
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
public class DangKyTKB_servlet extends HttpServlet{
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
        try {
            LopHocPhan_DAO lopHocPhan_DAO = new LopHocPhan_DAO();
            ThoiKhoaBieu_DAO thoiKhoaBieu_DAO = new ThoiKhoaBieu_DAO();
            if(request.getParameter("dang_ky")!=null){
                int id = Integer.valueOf((String)request.getParameter("dang_ky"));
                ArrayList<Integer> ds = (ArrayList<Integer>)request.getSession().getAttribute("TKB");
                ArrayList<LopHocPhan_model> ds_lhp = new ArrayList<>();
                for (Integer i : ds) {
                    LopHocPhan_model lhp = lopHocPhan_DAO.getLhp(i);
                    ds_lhp.add(lhp);
                }
                Boolean trung_mon=false;
                LopHocPhan_model lhp_moi = lopHocPhan_DAO.getLhp(id);
                for (LopHocPhan_model lopHocPhan_model : ds_lhp) {
                    if(lopHocPhan_model.getTen_mon_hoc().equals(lhp_moi.getTen_mon_hoc())){
                        trung_mon=true;
                        break;
                    }
                }
                if(trung_mon){
                    response.sendRedirect("DangKyTKB.jsp?err=trung_mon");
                }
                else{
                    String[][][][] tkb = thoiKhoaBieu_DAO.getTKB(ds);
                    Boolean trung_tiet = false;
                    for (int i = 0; i < lhp_moi.getTuan_hoc().length(); i++) {
                        if(lhp_moi.getTuan_hoc().charAt(i)!='*'&&tkb[i][lhp_moi.getThu()-2][lhp_moi.getTiet_hoc()-1][0]!=null){
                            trung_tiet = true;
                            break;
                        }
                    }
                    if(trung_tiet){
                        response.sendRedirect("DangKyTKB.jsp?err=trung_tiet");
                    }
                    else{
                        if(lhp_moi.getSi_so()<=thoiKhoaBieu_DAO.getDsma_sv(lhp_moi.getId()).size()){
                            response.sendRedirect("DangKyTKB.jsp?err=het_cho");
                        }
                        else{
                            ds.add(id);
                            request.getSession().setAttribute("TKB",ds);
                            response.sendRedirect("DangKyTKB.jsp?err=dang_ky");
                        }
                    }
                }
            }
            else if(request.getParameter("bo_dang_ky")!=null){
                int id = Integer.valueOf((String)request.getParameter("bo_dang_ky"));
                ArrayList<Integer> ds = (ArrayList<Integer>)request.getSession().getAttribute("TKB");
                ds.remove((Integer)id);
                request.getSession().setAttribute("TKB",ds);
                response.sendRedirect("DangKyTKB.jsp?err=bo_dang_ky");
            }
            else if(request.getParameter("luu_tkb")!=null){
                ArrayList<Integer> ds = (ArrayList<Integer>)request.getSession().getAttribute("TKB");
                String ma = (String)request.getSession().getAttribute("ma_sv");
                thoiKhoaBieu_DAO.setTKB_theoMaSV(ma, ds);
                response.sendRedirect("DangKyTKB.jsp?err=luu");                
            }
            else if(request.getParameter("quay_lai")!=null){
                response.sendRedirect("LuaChon.jsp");                
            }
            else if(request.getParameter("dang_xuat")!=null){
                request.getSession().setAttribute("ma_sv",null);
                response.sendRedirect("DangNhap.jsp");
            }
            else if(request.getParameter("mon_hoc")!=null){
                request.getSession().setAttribute("mon_hien_tai",request.getParameter("mon_hoc"));
                response.sendRedirect("DangKyTKB.jsp");
            }
        } catch (SQLException ex) {
        } catch (TrongException ex) {
            Logger.getLogger(DangKyTKB_servlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
