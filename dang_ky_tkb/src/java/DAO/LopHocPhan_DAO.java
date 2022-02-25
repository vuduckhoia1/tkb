/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

//import com.mysql.cj.xdevapi.PreparableStatement;
import java.sql.PreparedStatement;
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
public class LopHocPhan_DAO {
    private final DAO dao = new DAO();

    public LopHocPhan_DAO() {
    }
    
    public ArrayList<LopHocPhan_model> getDslhp() throws SQLException, TrongException{
        ArrayList<LopHocPhan_model> dslhp = new ArrayList<>();
        try{
            Statement st=dao.getCon().createStatement();
            String sql = "SELECT * FROM b_lop_hoc_phan";
            ResultSet res = st.executeQuery(sql); 
            if(res == null) {
                return null;
            } else {
                while(res.next()) {
                    int id = res.getInt("id_lhp");
                    String ten_mon_hoc = res.getString("ten_mon_hoc");
                    String giang_vien = res.getString("giang_vien");
                    int si_so = res.getInt("si_so");
                    String phong_hoc = res.getString("phong_hoc");
                    int tin_chi = res.getInt("tin_chi");
                    String tuan_hoc = res.getString("tuan_hoc");
                    String ma_mon_hoc = res.getString("ma_mon_hoc");
                    int nhom_lop = res.getInt("nhom_lop");
                    int thu = res.getInt("thu");
                    int tiet_hoc = res.getInt("tiet_hoc");
                    LopHocPhan_model lhp = new LopHocPhan_model(id, ten_mon_hoc, giang_vien, si_so, phong_hoc, tin_chi, tuan_hoc, ma_mon_hoc, nhom_lop, thu, tiet_hoc);
                    dslhp.add(lhp);    
                }
                return dslhp;
            }         
        }catch (SQLException ex) {
            Logger.getLogger(SinhVien_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;        
    }    

    public ArrayList<String> getDsMonHoc() throws SQLException{
        ArrayList<String> dsMonHoc = new ArrayList<>();
        try{
            Statement st=dao.getCon().createStatement();
            String sql = "SELECT DISTINCT ten_mon_hoc FROM b_lop_hoc_phan";
            ResultSet res = st.executeQuery(sql); 
            if(res == null) {
                return null;
            } else {
                while(res.next()) {
                    String ten_mon_hoc = res.getString("ten_mon_hoc");
                    dsMonHoc.add(ten_mon_hoc);    
                }
                return dsMonHoc;
            }         
        }catch (SQLException ex) {
            Logger.getLogger(SinhVien_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;        
    }

    public ArrayList<LopHocPhan_model> getDslhp_theoMonHoc(String mon_hoc) throws SQLException, TrongException{
        ArrayList<LopHocPhan_model> dslhp = new ArrayList<>();
        try{
            Statement st=dao.getCon().createStatement();
            String sql = "SELECT * FROM b_lop_hoc_phan WHERE ten_mon_hoc = '"+mon_hoc+"'";
            ResultSet res = st.executeQuery(sql); 
            if(res == null) {
                return null;
            } else {
                while(res.next()) {
                    int id = res.getInt("id_lhp");
                    String ten_mon_hoc = res.getString("ten_mon_hoc");
                    String giang_vien = res.getString("giang_vien");
                    int si_so = res.getInt("si_so");
                    String phong_hoc = res.getString("phong_hoc");
                    int tin_chi = res.getInt("tin_chi");
                    String tuan_hoc = res.getString("tuan_hoc");
                    String ma_mon_hoc = res.getString("ma_mon_hoc");
                    int nhom_lop = res.getInt("nhom_lop");
                    int thu = res.getInt("thu");
                    int tiet_hoc = res.getInt("tiet_hoc");
                    LopHocPhan_model lhp = new LopHocPhan_model(id, ten_mon_hoc, giang_vien, si_so, phong_hoc, tin_chi, tuan_hoc, ma_mon_hoc, nhom_lop, thu, tiet_hoc);
                    dslhp.add(lhp);    
                }
                return dslhp;
            }         
        }catch (SQLException ex) {
            Logger.getLogger(SinhVien_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;        
    }    
    
    public LopHocPhan_model getLhp(int id) throws SQLException, TrongException{
        LopHocPhan_model lhp = null;
        try{
            Statement st=dao.getCon().createStatement();
            String sql = "SELECT * FROM b_lop_hoc_phan WHERE id_lhp = '"+id+"'";
            ResultSet res = st.executeQuery(sql); 
            if(res == null) {
                return null;
            } else {
                while(res.next()) {
                    String ten_mon_hoc = res.getString("ten_mon_hoc");
                    String giang_vien = res.getString("giang_vien");
                    int si_so = res.getInt("si_so");
                    String phong_hoc = res.getString("phong_hoc");
                    int tin_chi = res.getInt("tin_chi");
                    String tuan_hoc = res.getString("tuan_hoc");
                    String ma_mon_hoc = res.getString("ma_mon_hoc");
                    int nhom_lop = res.getInt("nhom_lop");
                    int thu = res.getInt("thu");
                    int tiet_hoc = res.getInt("tiet_hoc");
                    lhp = new LopHocPhan_model(id, ten_mon_hoc, giang_vien, si_so, phong_hoc, tin_chi, tuan_hoc, ma_mon_hoc, nhom_lop, thu, tiet_hoc);     
                }
            }          
            return lhp;
        }catch (SQLException ex) {
            System.out.println("Loi o day");
            Logger.getLogger(SinhVien_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;        
    }    

    public int getId_max() throws SQLException{
        int id_max = -1;
        try{
            Statement st=dao.getCon().createStatement();
            String sql = "select max(id_lhp) from b_lop_hoc_phan";
            ResultSet res = st.executeQuery(sql); 
            if(res == null) {
                return -1;
            } else {
                while(res.next()) {
                    id_max = res.getInt("max(id_lhp)");
                    return id_max;
                }
            }          
        }catch (SQLException ex) {
            System.out.println("Loi o day");
            Logger.getLogger(SinhVien_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;        
    }    

    //kiểm tra có tồn tại một lhp với các thông số đưa vào
    public boolean TonTaiLhp(String ten_mon_hoc, String giang_vien, int si_so, String phong_hoc, int tin_chi, String tuan_hoc, String ma_mon_hoc, int nhom_lop, int thu, int tiet_hoc) throws SQLException{
        try{
            Statement st=dao.getCon().createStatement();
            String sql = "select count(id_lhp) from b_lop_hoc_phan "
                    +"where ten_mon_hoc ='"+ten_mon_hoc
                    +"' and giang_vien = '"+giang_vien
                    +"' and si_so = '"+si_so
                    +"' and phong_hoc = '"+phong_hoc
                    +"' and tin_chi = '"+tin_chi
                    +"' and tuan_hoc = '"+tuan_hoc
                    +"' and ma_mon_hoc = '"+ma_mon_hoc
                    +"' and nhom_lop = '"+nhom_lop
                    +"' and thu = '"+thu
                    +"' and tiet_hoc = '"+tiet_hoc+"';";
            ResultSet res = st.executeQuery(sql); 
            if(res == null) {
                return false;
            } else {
                while(res.next()) {
                    int ton_tai = res.getInt("count(id_lhp)");
                    if(ton_tai==0){
                        return false;
                    }
                    else{
                        return true;
                    }
                }
            }          
        }catch (SQLException ex) {
            System.out.println("Loi o day");
            Logger.getLogger(SinhVien_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;        
    }
    
    public void xoaLhp(int id) throws SQLException{
        LopHocPhan_model lhp = null;
        Statement st=dao.getCon().createStatement();
        String sql = "DELETE FROM b_tkb WHERE id_lhp = '"+id+"';";
        st.executeUpdate(sql);
        sql = "DELETE FROM b_lop_hoc_phan WHERE id_lhp = '"+id+"';";
        st.executeUpdate(sql);
    }

    public boolean suaLhp(LopHocPhan_model lhp) throws SQLException{
        String sql = "UPDATE b_lop_hoc_phan SET ten_mon_hoc = '"+lhp.getTen_mon_hoc()+
                "', giang_vien = '"+lhp.getGiang_vien()+
                "', si_so = '"+lhp.getSi_so()+
                "', phong_hoc = '"+lhp.getPhong_hoc()+
                "', tin_chi = '"+lhp.getTin_chi()+
                "', tuan_hoc = '"+lhp.getTuan_hoc()+
                "', ma_mon_hoc ='"+lhp.getMa_mon_hoc()+
                "', nhom_lop = '"+lhp.getNhom_lop()+
                "', thu = '"+lhp.getThu()+
                "', tiet_hoc = '"+lhp.getTiet_hoc()+
                "' WHERE id_lhp = '"+lhp.getId()+"';";
        PreparedStatement ps;
        try {
            ps = dao.getCon().prepareStatement(sql);
            ps.executeUpdate();
            dao.getCon().close();
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }
        
    public boolean themLhp(LopHocPhan_model lhp) throws SQLException{
        String sql = "insert into b_lop_hoc_phan values ('"+lhp.getId()+
                "','"+lhp.getTen_mon_hoc()+
                "','"+lhp.getGiang_vien()+
                "','"+lhp.getSi_so()+
                "','"+lhp.getPhong_hoc()+
                "','"+lhp.getTin_chi()+
                "','"+lhp.getTuan_hoc()+
                "','"+lhp.getMa_mon_hoc()+
                "','"+lhp.getNhom_lop()+
                "','"+lhp.getThu()+
                "','"+lhp.getTiet_hoc()+"');";
        PreparedStatement ps;
        try {
            ps = dao.getCon().prepareStatement(sql);
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public static void main(String[] args) throws SQLException, TrongException {
        LopHocPhan_DAO lopHocPhan_DAO = new LopHocPhan_DAO();
        lopHocPhan_DAO.themLhp(new LopHocPhan_model(lopHocPhan_DAO.getId_max()+1, "ten_mon_hoc", "giang_vien", 0, "phon", 0, "tuan_hoc", "ma", 0, 0, 0));
        System.out.println(lopHocPhan_DAO.TonTaiLhp("ten_mon_hoc", "giang_vien", 0, "phon", 0, "tuan_hoc", "ma", 0, 0, 0));
    }
}
