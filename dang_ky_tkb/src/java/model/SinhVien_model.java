/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author JohnLark
 */
public class SinhVien_model {
    private String ma_sv,ten_sv,mk;

    public SinhVien_model(String ma_sv, String ten_sv, String mk) throws TrongException {
        if(ma_sv.isEmpty()||ten_sv.isEmpty()||mk.isEmpty())throw new TrongException();
        this.ma_sv = ma_sv;
        this.ten_sv = ten_sv;
        this.mk = mk;
    }

    public String getMa_sv() {
        return ma_sv;
    }

    public void setMa_sv(String ma_sv) {
        this.ma_sv = ma_sv;
    }

    public String getTen_sv() {
        return ten_sv;
    }

    public void setTen_sv(String ten_sv) {
        this.ten_sv = ten_sv;
    }

    public String getMk() {
        return mk;
    }

    public void setMk(String mk) {
        this.mk = mk;
    }

    @Override
    public String toString() {
        return "SinhVien_model{" + "ma_sv=" + ma_sv + ", ten_sv=" + ten_sv + ", mk=" + mk + '}';
    }    
    
}
