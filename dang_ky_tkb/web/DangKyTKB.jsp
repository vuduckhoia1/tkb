<%-- 
    Document   : test
    Created on : Dec 3, 2021, 9:02:41 AM
    Author     : Laptop88
--%>

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
        <title>Đăng ký thời khóa biểu</title>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <style>
            body{margin-top:20px;}


            /* USER LIST TABLE */
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
            <form action="DangKyTKB_servlet" method="post">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex flex-column align-items-center text-center">
                                    <img src="https://bootdey.com/img/Content/avatar/avatar6.png" alt="Admin" class="rounded-circle p-1 bg-primary" width="110">
                                    <div class="mt-3">
                                        <h4><%=ten%></h4>
                                        <p class="text-secondary mb-1"><%=ma_tmp%></p>
                                        <p class="text-muted font-size-sm">Học viện Công nghệ Bưu Chính Viễn Thông</p>
                                    </div>
                                </div>
                                <hr>
                                <button type="submit" name="luu_tkb" class="btn btn-primary">Lưu thời khóa biểu</button> 
                                <br>
                                <button type="submit" name="quay_lai" class="btn btn-primary mt-3">Quay lại</button> 
                                <br>
                                <button type="submit" name="dang_xuat" class="btn btn-primary mt-3">Đăng xuất</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9">

                        <div class="main-box clearfix">
                            <c:if test="${param.err eq 'trung_mon'}">
                                <div class="alert alert-danger">
                                    <div class="container">
                                        <b>Error Alert:</b> Bạn đã đăng ký lớp học phần cho môn này rồi 
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${param.err eq 'trung_tiet'}">
                                 
                                <div class="alert alert-danger">
                                    <div class="container">
                                        <b>Error Alert:</b> Lớp học phần vừa chọn có tiết học trùng với tiết học của môn khác
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${param.err eq 'dang_ky'}">
                                <div class="alert alert-success">
                                    <div class="container">
                                        <b>Success</b> Đăng ký lớp học phần thành công 
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${param.err eq 'bo_dang_ky'}">
                                
                                <div class="alert alert-warning">
                                    <div class="container">
                                        <b>Warning Alert:</b> Bỏ đăng ký lớp học phần 
                                    </div>
                                </div>
                                <br>
                            </c:if>
                            <c:if test="${param.err eq 'luu'}">
                                
                                <div class="alert alert-success">
                                    <div class="container">
                                        <b>Success</b> Lưu thời khóa biểu thành công 
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${param.err eq 'het_cho'}">
                                <div class="alert alert-danger">
                                    <div class="container">
                                        <b>Error Alert:</b> Lớp học phần đã hết chỗ
                                    </div>
                                </div>
                            </c:if>
                            <h4>Danh sách các lớp học phần của môn </h4>
                            <select name="mon_hoc" onchange="this.form.submit()">
                                <option selected disabled>Chọn môn học</option>
                                <%
                                    ArrayList<String> ds_mon_hoc = lopHocPhan_DAO.getDsMonHoc();
                                    for (int i = 0; i < ds_mon_hoc.size(); i++) {
                                %>
                                <!--Hiển thị các môn học trên thanh dropdown với giá trị mặc định là môn vừa chọn trước đó-->
                                <option value=<%="" + i%> <%=(("" + i).equals((String) request.getSession().getAttribute("mon_hien_tai")) ? "selected" : "")%>>
                                    <%=ds_mon_hoc.get(i)%>
                                </option>
                                <%}%>
                            </select>
                            <div class="table-responsive">
                                <table class="table user-list">
                                    <thead>
                                        <tr>
                                            <th style="vertical-align:middle"><center>STT</center></th>
                                            <th style="vertical-align:middle">Tên môn học</th>
                                            <th style="vertical-align:middle">Giảng viên</th>
                                            <th style="vertical-align:middle">Sĩ số</th>
                                            <th style="width:7%; vertical-align:middle">Sĩ số hiện tại</th>
                                            <th style="vertical-align:middle">Phòng học</th>
                                            <th style="vertical-align:middle">Tín chỉ</th>
                                            <th style="vertical-align:middle">Tuần học</th>
                                            <th style="width:7%; vertical-align:middle">Nhóm lớp</th>
                                            <th style="vertical-align:middle">Thứ</th>
                                            <th style="vertical-align:middle">Tiết học</th>
                                            <th>&nbsp;</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            ThoiKhoaBieu_DAO tkbdao = new ThoiKhoaBieu_DAO();
                                            if (request.getSession().getAttribute("mon_hien_tai") != null) {
                                                int mon_hoc = Integer.valueOf((String) request.getSession().getAttribute("mon_hien_tai"));
                                                ArrayList<LopHocPhan_model> ds_lhp = lopHocPhan_DAO.getDslhp_theoMonHoc(ds_mon_hoc.get(mon_hoc));
                                                for (int i = 0; i < ds_lhp.size(); i++) {
                                        %>

                                        <tr>
                                            <td><center><%=i + 1%></center></td>
                                            <td><center><%=ds_lhp.get(i).getTen_mon_hoc()%></center></td>
                                            <td><center><%=ds_lhp.get(i).getGiang_vien()%></center></td>
                                            <td><center><%=ds_lhp.get(i).getSi_so()%></center></td>
                                            <td><center><%=tkbdao.getDsma_sv(ds_lhp.get(i).getId()).size()%></center></td>
                                            <td><center><%=ds_lhp.get(i).getPhong_hoc()%></center></td>
                                            <td><center><%=ds_lhp.get(i).getTin_chi()%></center></td>
                                            <td><center><%=ds_lhp.get(i).getTuan_hoc()%></center></td>
                                            <td><center><%=ds_lhp.get(i).getNhom_lop()%></center></td>
                                            <td><center><%=ds_lhp.get(i).getThuDangChu()%></center></td>
                                            <td><center><%=ds_lhp.get(i).getTiet_hoc()%></center></td>
                                            <td>
                                                <!--<input type="submit" value="Đăng ký" name=<%="" + ds_lhp.get(i).getId()%>/>-->
                                                <button type="submit" class="btn btn-primary" name="dang_ky" value=<%="" + ds_lhp.get(i).getId()%>>Đăng ký</button>
                                            </td>
                                        </tr>
                                        <%}
                                            }%>
                                    </tbody>
                                </table>

                                <h4>Danh sách lớp học phần đã đăng ký</h4>
                                <table class="table user-list">
                                    <tr>
                                        <th style="vertical-align:middle">STT</th>
                                        <th style="vertical-align:middle">Môn học</th>
                                        <th style="vertical-align:middle">Mã môn học</th>
                                        <th style="vertical-align:middle">Giảng viên</th>
                                        <th style="width:7%; vertical-align:middle">Sĩ số hiện tại</th>
                                        <th style="vertical-align:middle">Phòng học</th>
                                        <th style="vertical-align:middle">Tín chỉ</th>
                                        <th style="vertical-align:middle">Tuần học</th>
                                        <th style="width:7%; vertical-align:middle">Nhóm lớp</th>
                                        <th style="vertical-align:middle">Thứ</th>
                                        <th style="vertical-align:middle">Tiết học</th>
                                    </tr>
                                    <%
                                        if (request.getSession().getAttribute("TKB") != null) {
                                            ArrayList<Integer> ds = (ArrayList<Integer>) request.getSession().getAttribute("TKB");
                                            ArrayList<LopHocPhan_model> ds_lhp = new ArrayList<>();
                                            for (Integer id : ds) {
                                                LopHocPhan_model lhp = lopHocPhan_DAO.getLhp(id);
                                                ds_lhp.add(lhp);
                                            }
                                            for (int i = 0; i < ds_lhp.size(); i++) {
                                    %>
                                    <tr>
                                        <td><center><%=i + 1%></center></td>
                                        <td><center> <%=ds_lhp.get(i).getTen_mon_hoc()%></center></td>                    
                                        <td><center><%=ds_lhp.get(i).getMa_mon_hoc()%></center></td>
                                        <td><center><%=ds_lhp.get(i).getGiang_vien()%></center></td>
                                        <td><center><%=tkbdao.getDsma_sv(ds_lhp.get(i).getId()).size()%></center></td>
                                        <td><center><%=ds_lhp.get(i).getPhong_hoc()%></center></td>
                                        <td><center><%=ds_lhp.get(i).getTin_chi()%></center></td>
                                        <td><center><%=ds_lhp.get(i).getTuan_hoc()%></center></td>
                                        <td><center><%=ds_lhp.get(i).getNhom_lop()%></center></td>
                                        <td><center><%=ds_lhp.get(i).getThuDangChu()%></center></td>
                                        <td><center><%=ds_lhp.get(i).getTiet_hoc()%></center></td>
                                        <td>
                                            <!--<input type="submit" value="Đăng ký" name=<%="" + ds_lhp.get(i).getId()%>/>-->
                                            <button type="submit" class="btn btn-danger" name="bo_dang_ky" value=<%="" + ds_lhp.get(i).getId()%>>Bỏ</button>
                                        </td>
                                    </tr>
                                    <%}
                                        }%> 
                                </table>
                            </div>
                        </div>    
                    </div>
                </div>
            </form>                    
        </div>
        <%}%>
    </body>
</html>
