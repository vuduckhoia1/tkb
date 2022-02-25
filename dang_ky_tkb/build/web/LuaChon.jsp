<%-- 
    Document   : LuaChon
    Created on : Nov 29, 2021, 7:55:30 AM
    Author     : JohnLark
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="DAO.SinhVien_DAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lựa chọn</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    </head>
    <body>
        <%
        if(request.getSession().getAttribute("ma_sv")==null){
            response.sendRedirect("DangNhap.jsp");
        }else{%>
        <%
            SinhVien_DAO sinhVien_DAO = new SinhVien_DAO();
            String ma = (String) request.getSession().getAttribute("ma_sv");
            String ten = sinhVien_DAO.getTentheoMa(ma);
            String ma_tmp = ma.toUpperCase();
        %>
        <br>
        <!--        Lựa chọn
                <form action="LuaChon_servlet" method="post">
                    <input type="submit" name="ChinhSuaMK" value="">
                    <br>
                    <input type="submit" name="DangKyTKB" value="">
                    <br>
                    <input type="submit" name="XemTKB" value="">
                    <br>
                    <input type="submit" name="DangXuat" value="Dăng xuất">
                </form>-->
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                    <div class="card border-0 shadow rounded-3 my-5">
                        <div class="card-body p-4 p-sm-5">
                            <div class="logo-img-div"><h1> Trang chủ sinh viên</h1></div>
                            <form action="LuaChon_servlet" method="post">
                                <div class="d-grid mt-5">
                                    <button class="btn btn-primary btn-login text-uppercase fw-bold" type="submit" name="ChinhSuaMK">
                                        Chỉnh sửa MK
                                    </button>
                                </div>
                                <div class="d-grid mt-3">
                                    <button class="btn btn-primary btn-login text-uppercase fw-bold" type="submit" name="DangKyTKB">
                                        Đăng ký TKB
                                    </button>
                                </div>
                                <div class="d-grid mt-3">
                                    <button class="btn btn-primary btn-login text-uppercase fw-bold" type="submit" name="XemTKB">
                                        Xem TKB
                                    </button>
                                </div>
                                <div class="d-grid mt-3">
                                    <button class="btn btn-primary btn-login text-uppercase fw-bold" type="submit" name="DangXuat">
                                        Đăng xuất
                                    </button>
                                </div>
                            </form>

                            <hr class="my-4">

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%}%>
    </body>
</html>
