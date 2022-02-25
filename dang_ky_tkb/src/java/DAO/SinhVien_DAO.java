/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.SinhVien_model;
import model.TrongException;
/**
 *
 * @author JohnLark
 */
public class SinhVien_DAO {
    private final DAO dao = new DAO();

    public SinhVien_DAO() throws SQLException {
    }
    
    public ArrayList<SinhVien_model> getDssv() throws SQLException, TrongException{
        ArrayList<SinhVien_model> dssv = new ArrayList<>();
        try{
            Statement st=dao.getCon().createStatement();
            String sql = "SELECT * FROM b_sinh_vien";
            ResultSet res = st.executeQuery(sql); 
            if(res == null) {
                return null;
            } else {
                while(res.next()) {
                    String ma = res.getString("ma_sv");
                    String ten = res.getString("ten_sv");
                    String mk = res.getString("mk");
                    SinhVien_model sv = new SinhVien_model(ma, ten, mk);
                    dssv.add(sv);    
                }
            }          
            return dssv;
        }catch (SQLException ex) {
            Logger.getLogger(SinhVien_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;        
    }

        public ArrayList<SinhVien_model> getDssvTheoMaVaTen(String ma,String ten) throws SQLException, TrongException{
        ArrayList<SinhVien_model> dssv = new ArrayList<>();
        try{
            Statement st=dao.getCon().createStatement();
            String sql = "SELECT * FROM b_sinh_vien WHERE ma_sv LIKE '%"+ma+"%' AND ten_sv LIKE '%"+ten+"%' AND NOT ma_sv = 'admin';";
            ResultSet res = st.executeQuery(sql); 
            if(res == null) {
                return null;
            } else {
                while(res.next()) {
                    String ma_sv = res.getString("ma_sv");
                    String ten_sv = res.getString("ten_sv");
                    String mk = res.getString("mk");
                    SinhVien_model sv = new SinhVien_model(ma_sv, ten_sv, mk);
                    dssv.add(sv);
                }
            }          
            return dssv;
        }catch (SQLException ex) {
            Logger.getLogger(SinhVien_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;        
    }
        
    public String getTentheoMa(String ma_sv){
        String ten_sv = null;
        try{
            Statement st=dao.getCon().createStatement();
            String sql = "SELECT ten_sv FROM b_sinh_vien WHERE ma_sv = '"+ma_sv.toLowerCase()+"'";
            ResultSet res = st.executeQuery(sql); 
            if(res == null){
                return null;
            }     
            else{
                while(res.next()){
                    ten_sv = res.getString("ten_sv");
                }
            }
            return ten_sv;
        }catch (SQLException ex) {
            Logger.getLogger(SinhVien_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;                
    }
    
    public String getMk(String ma_sv){
        String mk = null;
        try{
            Statement st=dao.getCon().createStatement();
            String sql = "SELECT mk FROM b_sinh_vien WHERE ma_sv = '"+ma_sv.toLowerCase()+"'";
            ResultSet res = st.executeQuery(sql); 
            if(res == null){
                return null;
            }     
            else{
                while(res.next()){
                    mk = res.getString("mk");
                }
            }
            return mk;
        }catch (SQLException ex) {
            Logger.getLogger(SinhVien_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;                
    }
    //kiem tra xem co sinh vien nao trong danh sach sinh vien co ma_sv va mk nhu duoi
    public Boolean KiemTraDangNhap(String ma_sv,String mk) throws TrongException{
        SinhVien_model sv = null;
        try{
            Statement st=dao.getCon().createStatement();
            String sql = "SELECT * FROM b_sinh_vien WHERE ma_sv = '"+ma_sv.toLowerCase()+"' AND mk = '"+mk+"'";
            ResultSet res = st.executeQuery(sql); 
            if(res == null){
                return false;
            }     
            else{
                while(res.next()){
                    String ten_sv = res.getString("ten_sv");
                    sv = new SinhVien_model(ma_sv,ten_sv, mk);
                    return true;
                }
            }
        }catch (SQLException ex) {
            Logger.getLogger(SinhVien_DAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (TrongException ex) {
            throw new TrongException();
        }
        return false;          
    }

    public Boolean TonTaiMaSV(String ma_sv){
        SinhVien_model sv = null;
        try{
            Statement st=dao.getCon().createStatement();
            String sql = "SELECT count(ma_sv) FROM b_sinh_vien WHERE ma_sv = '"+ma_sv.toLowerCase()+"'";
            ResultSet res = st.executeQuery(sql); 
            if(res == null){
                return false;
            }     
            else{
                while(res.next()){
                    int ton_tai = res.getInt("count(ma_sv)");
                    if(ton_tai==0)return false;
                    else return true;
                }
            }
        }catch (SQLException ex) {
            Logger.getLogger(SinhVien_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;          
    }
    
    public void DoiMK(String ma_sv, String mk_moi){
        try{
            Statement st=dao.getCon().createStatement();
            String sql = "UPDATE b_sinh_vien SET mk = '"+mk_moi+"' WHERE ma_sv = '"+ma_sv.toLowerCase()+"'";
            st.executeUpdate(sql); 
        }catch (SQLException ex) {
            Logger.getLogger(SinhVien_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }        
    }

    public boolean suaSV(String ma_sv, String ma_moi, String ten_moi, String mk_moi) throws TrongException{
        try{
            if(ma_sv.isEmpty()||ma_moi.isEmpty()||ten_moi.isEmpty()||mk_moi.isEmpty())throw new TrongException();
            Statement st=dao.getCon().createStatement();
            String sql = "UPDATE b_sinh_vien SET ma_sv = '"+ma_moi.toLowerCase()+"', ten_sv = '"+ten_moi+"', mk = '"+mk_moi+"' WHERE ma_sv = '"+ma_sv.toLowerCase()+"';";
            st.executeUpdate(sql);
            return true;
        }catch (SQLException ex) {
            Logger.getLogger(SinhVien_DAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }        
    }

    public boolean themSV(String ma_sv, String ten_sv, String mk){
        try{
            Statement st=dao.getCon().createStatement();
            String sql = "insert into b_sinh_vien values ('"+ma_sv.toLowerCase()+"','"+ten_sv+"','"+mk+"');";
            st.executeUpdate(sql);
            return true;
        }catch (SQLException ex) {
            Logger.getLogger(SinhVien_DAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }        
    }
    
    public void xoaSV(String ma_sv){
        try{
            Statement st=dao.getCon().createStatement();
            String sql = "DELETE FROM b_tkb WHERE ma_sv = '"+ma_sv+"';";
            st.executeUpdate(sql); 
            sql = "DELETE FROM b_sinh_vien WHERE ma_sv = '"+ma_sv+"';";
            st.executeUpdate(sql); 
        }catch (SQLException ex) {
            Logger.getLogger(SinhVien_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }        
    }
    
//    public static void main(String[] args) throws SQLException {
//        SinhVien_DAO sinhVien_DAO = new SinhVien_DAO();
//        sinhVien_DAO.themSV("b19dccn677", "Trần Văn Phong");
//    }
}
