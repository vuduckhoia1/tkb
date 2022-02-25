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
import model.LopHocPhan_model;
import model.TrongException;

/**
 *
 * @author JohnLark
 */
public class ThoiKhoaBieu_DAO {
    private final DAO dao = new DAO();

    public ThoiKhoaBieu_DAO() {
    }
    
    //lay danh sach id lop hoc phan cua mot sinh vien nhat dinh
    public ArrayList<Integer> getDsid_lhp(String ma_sv) throws SQLException{
        ArrayList<Integer> dsid_lhp = new ArrayList<>();
        try{
            Statement st=dao.getCon().createStatement();
            String sql = "SELECT id_lhp FROM b_tkb WHERE ma_sv = '"+ma_sv+"'";
            ResultSet res = st.executeQuery(sql); 
            if(res == null) {
                return null;
            } else {
                while(res.next()) {
                    int id = res.getInt("id_lhp");
                    dsid_lhp.add(id);    
                }
            }          
            return dsid_lhp;
        }catch (SQLException ex) {
            Logger.getLogger(SinhVien_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;        
    }        
    
    public ArrayList<String> getDsma_sv(int id) throws SQLException{
        ArrayList<String> dsma_sv = new ArrayList<>();
        try{
            Statement st=dao.getCon().createStatement();
            String sql = "SELECT ma_sv FROM b_tkb WHERE id_lhp = '"+id+"'";
            ResultSet res = st.executeQuery(sql); 
            if(res == null) {
                return null;
            } else {
                while(res.next()) {
                    String ma = res.getString("ma_sv");
                    dsma_sv.add(ma);  
                }
            }          
            return dsma_sv;
        }catch (SQLException ex) {
            Logger.getLogger(SinhVien_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;        
    }    

    public void setTKB_theoMaSV(String ma_sv, ArrayList<Integer> ds){
        try{
            Statement st=dao.getCon().createStatement();
            String sql = "DELETE FROM b_tkb WHERE ma_sv = '"+ma_sv.toLowerCase()+"';";
            st.executeUpdate(sql);
            for (Integer id : ds) {
                sql="insert into b_tkb values ('"+ma_sv+"',"+id+");";
                st.executeUpdate(sql);
            }
        }catch (SQLException ex) {
            Logger.getLogger(SinhVien_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }        
    }
    
    public String[][][][] getTKB(ArrayList<Integer> ds) throws SQLException, TrongException{
        String[][][][] tkb = new String[15][7][6][2];
        LopHocPhan_DAO lopHocPhan_DAO = new LopHocPhan_DAO();
        ThoiKhoaBieu_DAO thoiKhoaBieu_DAO = new ThoiKhoaBieu_DAO();
        ArrayList<LopHocPhan_model> ds_lhp = new ArrayList<>();   
        for (Integer id : ds) {
            LopHocPhan_model lhp = lopHocPhan_DAO.getLhp(id);
            ds_lhp.add(lhp);
        }
        for (LopHocPhan_model lhp : ds_lhp) {
            String tuan = lhp.getTuan_hoc();
            for (int i = 0; i < tuan.length(); i++) {
                if(tuan.charAt(i) != '*'){
                    tkb[i][lhp.getThu()-2][lhp.getTiet_hoc()-1][0]=lhp.getTen_mon_hoc();
                    tkb[i][lhp.getThu()-2][lhp.getTiet_hoc()-1][1]=lhp.getPhong_hoc();
                }
            }
        }
        return tkb;
    }

    public int[][][] getTKB_ChiTiet(ArrayList<Integer> ds) throws SQLException, TrongException{
        int[][][] tkb = new int[15][7][6];
        LopHocPhan_DAO lopHocPhan_DAO = new LopHocPhan_DAO();
        ThoiKhoaBieu_DAO thoiKhoaBieu_DAO = new ThoiKhoaBieu_DAO();
        ArrayList<LopHocPhan_model> ds_lhp = new ArrayList<>();   
        for (Integer id : ds) {
            LopHocPhan_model lhp = lopHocPhan_DAO.getLhp(id);
            ds_lhp.add(lhp);
        }
        for (LopHocPhan_model lhp : ds_lhp) {
            String tuan = lhp.getTuan_hoc();
            for (int i = 0; i < tuan.length(); i++) {
                if(tuan.charAt(i) != '*'){
                    tkb[i][lhp.getThu()-2][lhp.getTiet_hoc()-1]=lhp.getId();
                }
            }
        }
        return tkb;
    }
        
    public static void main(String[] args) throws SQLException {
        ThoiKhoaBieu_DAO thoiKhoaBieu_DAO = new ThoiKhoaBieu_DAO();
        ArrayList<Integer> ds = new ArrayList<>();
        ds.add(0);
        ds.add(1);
        thoiKhoaBieu_DAO.setTKB_theoMaSV("b19dccn618", ds);
    }

}
