/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 *
 * @author JohnLark
 */
public class LopHocPhan_model {
    private int id;
    private String ten_mon_hoc;
    private String giang_vien;
    private int si_so;
    private String phong_hoc;
    private int tin_chi;
    private String tuan_hoc;
    private String ma_mon_hoc;
    private int nhom_lop;
    private int thu;
    private int tiet_hoc;

    public LopHocPhan_model(int id, String ten_mon_hoc, String giang_vien, int si_so, String phong_hoc, int tin_chi, String tuan_hoc, String ma_mon_hoc, int nhom_lop, int thu, int tiet_hoc) throws TrongException {
        if(ten_mon_hoc.isEmpty()||giang_vien.isEmpty()||phong_hoc.isEmpty()||tuan_hoc.isEmpty()||ma_mon_hoc.isEmpty())throw new TrongException();
        this.id = id;
        this.ten_mon_hoc = ten_mon_hoc;
        this.giang_vien = giang_vien;
        this.si_so = si_so;
        this.phong_hoc = phong_hoc;
        this.tin_chi = tin_chi;
        this.tuan_hoc = tuan_hoc;
        this.ma_mon_hoc = ma_mon_hoc;
        this.nhom_lop = nhom_lop;
        this.thu = thu;
        this.tiet_hoc = tiet_hoc;
    }

    @Override
    public String toString() {
        return "LopHocPhan_model{" + "id=" + id + ", ten_mon_hoc=" + ten_mon_hoc + ", giang_vien=" + giang_vien + ", si_so=" + si_so + ", phong_hoc=" + phong_hoc + ", tin_chi=" + tin_chi + ", tuan_hoc=" + tuan_hoc + ", ma_mon_hoc=" + ma_mon_hoc + ", nhom_lop=" + nhom_lop + ", thu=" + thu + ", tiet_hoc=" + tiet_hoc + '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTen_mon_hoc() {
        return ten_mon_hoc;
    }

    public void setTen_mon_hoc(String ten_mon_hoc) {
        this.ten_mon_hoc = ten_mon_hoc;
    }

    public String getGiang_vien() {
        return giang_vien;
    }

    public void setGiang_vien(String giang_vien) {
        this.giang_vien = giang_vien;
    }

    public int getSi_so() {
        return si_so;
    }

    public void setSi_so(int si_so) {
        this.si_so = si_so;
    }

    public String getPhong_hoc() {
        return phong_hoc;
    }

    public void setPhong_hoc(String phong_hoc) {
        this.phong_hoc = phong_hoc;
    }

    public int getTin_chi() {
        return tin_chi;
    }

    public void setTin_chi(int tin_chi) {
        this.tin_chi = tin_chi;
    }

    public String getTuan_hoc() {
        return tuan_hoc;
    }

    public void setTuan_hoc(String tuan_hoc) {
        this.tuan_hoc = tuan_hoc;
    }

    public String getMa_mon_hoc() {
        return ma_mon_hoc;
    }

    public void setMa_mon_hoc(String ma_mon_hoc) {
        this.ma_mon_hoc = ma_mon_hoc;
    }

    public int getNhom_lop() {
        return nhom_lop;
    }

    public void setNhom_lop(int nhom_lop) {
        this.nhom_lop = nhom_lop;
    }

    public int getThu() {
        return thu;
    }
    
    public String getThuDangChu() {
        if(thu==2){
            return "Thứ hai";
        }
        else if(thu==3){
            return "Thứ ba";
        }
        else if(thu==4){
            return "Thứ tư";
        }
        else if(thu==5){
            return "Thứ năm";
        }
        else if(thu==6){
            return "Thứ sáu";
        }
        else if(thu==7){
            return "Thứ bảy";
        }
        return "Chủ nhật";
    }
    
    public String getNgay(int tuan){
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        Calendar c = Calendar.getInstance();
        Date date = Date.valueOf("2011-08-16");
        c.setTime(date);
        c.add(Calendar.DATE, tuan*7+thu-2);
        return dateFormat.format(c.getTime());
    }
    
    public String getGioHoc(){
        switch (tiet_hoc) {
            case 1:
                return "7h30p-9h20p";
            case 2:
                return "9h30p-11h20p";
            case 3:
                return "12h30p-14h20p";
            case 4:
                return "14h30p-16h20p";
            case 5:
                return "16h30p-18h20p";
            case 6:
                return "19h30p-21h20p";
            default:
                return null;
        }
    }

    public void setThu(int thu) {
        this.thu = thu;
    }

    public int getTiet_hoc() {
        return tiet_hoc;
    }

    public void setTiet_hoc(int tiet_hoc) {
        this.tiet_hoc = tiet_hoc;
    }
    
}
