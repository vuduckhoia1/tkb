<%-- 
    Document   : test
    Created on : Dec 3, 2021, 9:02:41 AM
    Author     : JohnLark
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
        <title>Quản lý lớp học phần</title>
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
            <form action="QuanLyLHP_admin_servlet" method="post">
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
                                        <b>Success Alert:</b> Sửa lớp học phần thành công 
                                    </div>
                                </div>
                            </c:if>

                            <c:if test="${param.err eq 'them_thanh_cong'}">
                                <div class="alert alert-success">
                                    <div class="container">
                                        <b>Success Alert:</b> Thêm lớp học phần thành công 
                                    </div>
                                </div>
                            </c:if>

                            <c:if test="${param.err eq 'trung'}">
                                <div class="alert alert-danger">
                                    <div class="container">
                                        <b>Error Alert:</b> Lớp học phần định thêm có các thông tin trùng với một lớp học phần khác đã tồn tại 
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
                                            <th>STT</th>
                                            <th>Tên môn học</th>
                                            <th>Giảng viên</th>
                                            <th>Sĩ số</th>
                                            <th style="width:7%">Sĩ số hiện tại</th>
                                            <th>Phòng học</th>
                                            <th>Tín chỉ</th>
                                            <th>Tuần học</th>
                                            <th>Nhóm lớp</th>
                                            <th>Thứ</th>
                                            <th>Tiết học</th>
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
                                            <td><%=i + 1%></td>
                                            <td><%=ds_lhp.get(i).getTen_mon_hoc()%></td>
                                            <td><%=ds_lhp.get(i).getGiang_vien()%></td>
                                            <td><%=ds_lhp.get(i).getSi_so()%></td>
                                            <td><%=tkbdao.getDsma_sv(ds_lhp.get(i).getId()).size()%></td>
                                            <td><%=ds_lhp.get(i).getPhong_hoc()%></td>
                                            <td><%=ds_lhp.get(i).getTin_chi()%></td>
                                            <td><%=ds_lhp.get(i).getTuan_hoc()%></td>
                                            <td><%=ds_lhp.get(i).getNhom_lop()%></td>
                                            <td><%=ds_lhp.get(i).getThuDangChu()%></td>
                                            <td><%=ds_lhp.get(i).getTiet_hoc()%></td>
                                            <td>
                                                <button type="submit" class="btn btn-primary btn-xs" name="mo_rong" value=<%="" + ds_lhp.get(i).getId()%>>Mở rộng</button>
                                                <button type="submit" class="btn btn-danger btn-xs" name="xoa" value=<%="" + ds_lhp.get(i).getId()%>>Xóa</button>
                                            </td>
                                        </tr>
                                        <%}
                                        }%>
                                    </tbody>
                                </table>
                                
                                <%if(request.getSession().getAttribute("lhp_mo_rong")!=null){%>
                                    <%int id =(Integer) request.getSession().getAttribute("lhp_mo_rong");%>
                                    <%LopHocPhan_model lhp = lopHocPhan_DAO.getLhp(id);%>
                                <h4>Chỉnh sửa, thêm mới lớp học phần</h4> 
                                Tên môn học: 
                                <br>
                                <input type="text" name="ten_mon_hoc" value="<%=lhp.getTen_mon_hoc()%>" size="100"/>
                                <br>
                                Mã môn học: 
                                <br>
                                <input type="text" name="ma_mon_hoc" value="<%=lhp.getMa_mon_hoc()%>" size="10"/>
                                <br>
                                Giảng viên: 
                                <br>
                                <input type="text" name="giang_vien" value="<%=lhp.getGiang_vien()%>" size="40"/>
                                <br>
                                Sĩ số tối đa: 
                                <br>
                                <input type="number" name="si_so" value="<%=lhp.getSi_so()%>" size="2"/>
                                <br>
                                Phòng học: 
                                <br>
                                <input type="text" name="phong_hoc" value="<%=lhp.getPhong_hoc()%>" size="5"/>
                                <br>
                                Tín chỉ: 
                                <br>
                                <input type="number" name="tin_chi" value="<%=lhp.getTin_chi()%>" size="1"/>
                                <br>
                                Tuần học: 
                                <br>
                                <input type="text" name="tuan_hoc" value="<%=lhp.getTuan_hoc()%>" size="15"/>
                                <br>
                                Nhóm lớp: 
                                <br>
                                <input type="number" name="nhom_lop" value="<%=lhp.getNhom_lop()%>" size="2"/>
                                <br>
                                Thứ: 
                                <select name="thu" >
                                    <%
                                    String[] thu = {"Thứ hai","Thứ ba","Thứ tư","Thứ năm","Thứ sáu","Thứ bảy","Chủ nhật"};
                                    for (int i =0;i<7;i++) {
                                    %>
                                    <option value=<%="" + (i+2)%> <%=(lhp.getThuDangChu().equals(thu[i]) ? "selected" : "")%>>
                                        <%=thu[i]%>
                                    </option>
                                    <%}%>
                                </select>                    
                                <br>
                                Tiết học: 
                                <select name="tiet" >
                                    <%
                                    String[] tiet = {"Tiết 1","Tiết 2","Tiết 3","Tiết 4","Tiết 5","Tiết 6"};
                                    for (int i = 0;i < 6;i++) {
                                    %>
                                    <option value=<%="" + (i+1)%> <%=(lhp.getTiet_hoc()-1==i? "selected" : "")%>>
                                        <%=tiet[i]%>
                                    </option>
                                    <%}%>
                                </select> 
                                <br>
                                <button type="submit" class="btn btn-primary" name="chinh_sua" value=<%="" + lhp.getId()%>>Chỉnh sửa</button>
                                <button type="submit" class="btn btn-primary" name="them_moi" value=<%="" + lhp.getId()%>>Thêm mới</button>
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
