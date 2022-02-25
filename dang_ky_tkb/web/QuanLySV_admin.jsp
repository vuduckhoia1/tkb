<%-- 
    Document   : test
    Created on : Dec 3, 2021, 9:02:41 AM
    Author     : Laptop88
--%>

<%@page import="model.SinhVien_model"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.ThoiKhoaBieu_DAO"%>
<%@page import="model.LopHocPhan_model"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.LopHocPhan_DAO"%>
<%@page import="DAO.SinhVien_DAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý sinh viên</title>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        
        <style>
            body{margin-top:20px;}


            /* USER LIST TABLE */
            input {
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            select{
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            .user-list tbody td > img {
                position: relative;
                max-width: 50px;
                float: left;
                margin-right: 15px;
            }
            .user-list tbody td .user-link {
                display: block;
                font-size: 1.25em;
                padding-top: 3px;
                margin-left: 60px;
            }
            .user-list tbody td .user-subhead {
                font-size: 0.875em;
                font-style: italic;
            }

            /* TABLES */
            .table {
                border-collapse: separate;
            }
            .table-hover > tbody > tr:hover > td,
            .table-hover > tbody > tr:hover > th {
                background-color: #eee;
            }
            .table thead > tr > th {
                border-bottom: 1px solid #C2C2C2;
                padding-bottom: 0;
            }
            .table tbody > tr > td {
                font-size: 0.875em;
                background: #f5f5f5;
                border-top: 10px solid #fff;
                vertical-align: middle;
                padding: 12px 8px;
            }
            .table tbody > tr > td:first-child,
            .table thead > tr > th:first-child {
                padding-left: 20px;
            }
            .table.table-hover tbody > tr > td {
                -webkit-transition: background-color 0.15s ease-in-out 0s;
                transition: background-color 0.15s ease-in-out 0s;
            }
            .table tbody tr td .call-type {
                display: block;
                font-size: 0.75em;
                text-align: center;
            }
            .table tbody tr td .first-line {
                line-height: 1.5;
                font-weight: 400;
                font-size: 1.125em;
            }
            .table tbody tr td .first-line span {
                font-size: 0.875em;
                color: #969696;
                font-weight: 300;
            }
            .table tbody tr td .second-line {
                font-size: 0.875em;
                line-height: 1.2;
            }
            .alert {
                border: 0;
                border-radius: 0;
                padding: 20px 15px !important;
                line-height: 20px;
                font-weight: 300;
                color: #fff;
            }
            .alert b {
                font-weight: 500;
                font-size: 12px;
                text-transform: uppercase;
            }
            .alert.alert-success {
                background-color: #55b559;
                color: #fff;
            }
            .alert.alert-warning {
                background-color: #ff9e0f;
                color: #fff;
            }

            .alert.alert-danger {
                background-color: #f55145;
                color: #fff;
            }
        </style>
    </head>
    <body>
        <%
        if(request.getSession().getAttribute("ma_sv")==null){
            response.sendRedirect("DangNhap.jsp");
        }else{%>
        <%
            LopHocPhan_DAO lopHocPhan_DAO = new LopHocPhan_DAO();
            SinhVien_DAO sinhVien_DAO = new SinhVien_DAO();
            String ma = (String) request.getSession().getAttribute("ma_sv");
            String ten = sinhVien_DAO.getTentheoMa(ma);
            String ma_tmp = ma.toUpperCase();
        %>

        
        <div class="container-fluid">
            <form action="QuanLySV_admin_servlet" method="post">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex flex-column align-items-center text-center">
                                    <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Admin" class="rounded-circle p-1 bg-primary" width="110">
                                    <div class="mt-3">
                                        <h4><%=ten%></h4>
                                        <p class="text-secondary mb-1"><%=ma_tmp%></p>
                                        <p class="text-muted font-size-sm">Học viện Công nghệ Bưu Chính Viễn Thông</p>
                                    </div>
                                </div>
                                <hr>
                                <button type="submit" name="quay_lai" class="btn btn-primary mt-3">Quay lại</button> 
                                <br>
                                <button type="submit" name="dang_xuat" class="btn btn-primary mt-3">Đăng xuất</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9">

                        <div class="main-box clearfix">
                            
                            <c:if test="${param.err eq 'that_bai'}">
                                <div class="alert alert-danger">
                                    <div class="container">
                                        <b>Error Alert:</b> Dữ liệu bạn đưa vào không hợp lệ 
                                    </div>
                                </div>
                            </c:if>

                            <c:if test="${param.err eq 'sua_thanh_cong'}">
                                <div class="alert alert-success">
                                    <div class="container">
                                        <b>Success Alert:</b> Sửa thành công 
                                    </div>
                                </div>
                            </c:if>

                            <c:if test="${param.err eq 'them_thanh_cong'}">
                                <div class="alert alert-success">
                                    <div class="container">
                                        <b>Success Alert:</b> Thêm thành công 
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${param.err eq 'xoa_thanh_cong'}">
                                <div class="alert alert-success">
                                    <div class="container">
                                        <b>Success Alert:</b> Xóa thành công 
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${param.err eq 'ma_ton_tai'}">
                                <div class="alert alert-danger">
                                    <div class="container">
                                        <b>Error Alert:</b> Mã sinh viên đã tồn tại 
                                    </div>
                                </div>
                            </c:if>

                            <c:if test="${param.err eq 'ma_khong_hop_le'}">
                                <div class="alert alert-danger">
                                    <div class="container">
                                        <b>Error Alert:</b> Mã sinh viên không hợp lệ 
                                    </div>
                                </div>
                            </c:if>

                            Tìm kiếm theo mã sinh viên:
                            <input type="text" style="width: 25%" name="ma_tim_kiem" size="10" value="<%=request.getSession().getAttribute("ma_tim_kiem")==null?"":request.getSession().getAttribute("ma_tim_kiem")%>"/><br>
                            Tìm kiếm theo tên sinh viên:
                            <input type="text" style="width: 25%" name="ten_tim_kiem" size="40" value="<%=request.getSession().getAttribute("ten_tim_kiem")==null?"":request.getSession().getAttribute("ten_tim_kiem")%>"/><br>
                            <button type="submit" class="btn btn-primary" name="tim_kiem">Tìm kiếm</button>
                            <h4>Danh sách sinh viên </h4>
                            <div class="table-responsive">
                                <table class="table user-list">
                                    <thead>
                                        <tr>
                                            <th>STT</th>
                                            <th>Mã sinh viên</th>
                                            <th>Tên sinh viên</th>
                                            <th>&nbsp;</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            LopHocPhan_DAO lhpdao = new LopHocPhan_DAO();
                                            SinhVien_DAO svdao = new SinhVien_DAO();
                                            ThoiKhoaBieu_DAO tkbdao = new ThoiKhoaBieu_DAO();
                                            String ma_tim_kiem = (String) request.getSession().getAttribute("ma_tim_kiem");
                                            String ten_tim_kiem = (String) request.getSession().getAttribute("ten_tim_kiem");
                                            ArrayList<SinhVien_model> dssv = sinhVien_DAO.getDssvTheoMaVaTen(ma_tim_kiem, ten_tim_kiem);
                                            for (int i = 0; i < dssv.size(); i++) {
                                        %>
                                        <tr>
                                            <td><%=i+1%></td>
                                            <td><%=dssv.get(i).getMa_sv()%></td>
                                            <td><%=dssv.get(i).getTen_sv()%></td>
                                            <td>
                                                <button type="submit" class="btn btn-primary btn-xs" name="mo_rong" value=<%=dssv.get(i).getMa_sv()%>>Mở rộng</button>
                                                <button type="submit" class="btn btn-danger btn-xs" name="xoa" value=<%=dssv.get(i).getMa_sv()%>>Xóa</button>
                                            </td>
                                        </tr>
                                        <%}%>
                                    </tbody>
                                </table>
                                
                                <%if(request.getSession().getAttribute("mo_rong")!=null){%>
                                <%String ma_mo_rong = (String)request.getSession().getAttribute("mo_rong");%>
                                <%String ten_mo_rong = sinhVien_DAO.getTentheoMa(ma_mo_rong);%>
                                <%String mk_mo_rong = sinhVien_DAO.getMk(ma_mo_rong);%>
                                <h4>Chỉnh sửa, thêm mới lớp sinh viên</h4> 
                                Tên sinh viên:
                                <input type="text" name="ten_sv" size="40" style="width:25%" value="<%=ten_mo_rong%>"><br>
                                Mã sinh viên:&nbsp; 
                                <input type="text" name="ma_sv" size="10" style="width:25%" value="<%=ma_mo_rong%>"><br>
                                Mật khẩu: &emsp;&ensp;
                                <input type="password" name="mk" size="10" style="width:25%" value="<%=mk_mo_rong%>">
                                <br>
                                <button type="submit" class="btn btn-primary" name="chinh_sua" value="<%=ma_mo_rong%>">Chỉnh sửa</button>
                                <button type="submit" class="btn btn-primary" name="them_moi" value="<%=ma_mo_rong%>">Thêm mới</button>
                                <%}%>
                            </div>
                        </div>    
                    </div>
                </div>
            </form>                    
        </div>
        <%}%>
    </body>
</html>
