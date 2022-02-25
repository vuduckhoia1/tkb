<%-- 
    Document   : test
    Created on : Dec 3, 2021, 9:02:41 AM
    Author     : Laptop88
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.ThoiKhoaBieu_DAO"%>
<%@page import="DAO.SinhVien_DAO"%>
<%@page import="DAO.LopHocPhan_DAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.LopHocPhan_model"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Xem thời khóa biểu</title>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        
        <style>
            body{
                margin-top:20px;
            }
            .bg-light-gray {
                background-color: #f7f7f7;
            }
            .table-bordered thead td, .table-bordered thead th {
                border-bottom-width: 2px;
            }
            .table thead th {
                vertical-align: bottom;
                border-bottom: 2px solid #dee2e6;
            }
            .table-bordered td, .table-bordered th {
                border: 1px solid #dee2e6;
            }


            .bg-sky.box-shadow {
                box-shadow: 0px 5px 0px 0px #00a2a7
            }

            .bg-orange.box-shadow {
                box-shadow: 0px 5px 0px 0px #af4305
            }

            .bg-green.box-shadow {
                box-shadow: 0px 5px 0px 0px #4ca520
            }

            .bg-yellow.box-shadow {
                box-shadow: 0px 5px 0px 0px #dcbf02
            }

            .bg-pink.box-shadow {
                box-shadow: 0px 5px 0px 0px #e82d8b
            }

            .bg-purple.box-shadow {
                box-shadow: 0px 5px 0px 0px #8343e8
            }

            .bg-lightred.box-shadow {
                box-shadow: 0px 5px 0px 0px #d84213
            }


            .bg-sky {
                background-color: #02c2c7
            }

            .bg-orange {
                background-color: #e95601
            }

            .bg-green {
                background-color: #5bbd2a
            }

            .bg-yellow {
                background-color: #f0d001
            }

            .bg-pink {
                background-color: #ff48a4
            }

            .bg-purple {
                background-color: #9d60ff
            }

            .bg-lightred {
                background-color: #ff5722
            }

            .padding-15px-lr {
                padding-left: 15px;
                padding-right: 15px;
            }
            .padding-5px-tb {
                padding-top: 5px;
                padding-bottom: 5px;
            }
            .margin-10px-bottom {
                margin-bottom: 10px;
            }
            .border-radius-5 {
                border-radius: 5px;
            }

            .margin-10px-top {
                margin-top: 10px;
            }
            .font-size14 {
                font-size: 14px;
            }

            .text-light-gray {
                color: #d6d5d5;
            }
            .font-size13 {
                font-size: 13px;
            }

            .table-bordered td, .table-bordered th {
                border: 2px solid #dee2e5;
            }
            .table td, .table th {
                padding: .75rem;
                vertical-align: top;
                border-top: 1px solid #dee2e6;
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
            ThoiKhoaBieu_DAO thoiKhoaBieu_DAO = new ThoiKhoaBieu_DAO();
            String ma = (String) request.getSession().getAttribute("ma_sv");
            String ten = sinhVien_DAO.getTentheoMa(ma);
            String ma_tmp = ma.toUpperCase();
        %>

        <div class="container-fluid">
            <form action="XemTKB_servlet" method="post">
                <div class="row" >
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
                                <button type="submit" name="quay_lai" class="btn btn-primary mt-3">Quay lại</button>
                                <br>
                                <button type="submit" name="dang_xuat" class="btn btn-primary mt-3">Đăng xuất</button>
                            </div>
                        </div>
                    </div>
                    <%
                        ArrayList<Integer> ds = thoiKhoaBieu_DAO.getDsid_lhp(ma);
                        if(ds.isEmpty()){
                    %>
                    <h1>Bạn chưa đăng ký thời khóa biểu</h1>
                    <%}else{%>
                    <div class="col-lg-9">
                        <span style="font-size: 20px">Thời khóa biểu của tuần thứ: </span>
                        <select name="tuan" onchange="this.form.submit()">
                            <option selected disabled>Chọn tuần</option>
                            <%
                                for (int i = 0; i < 15; i++) {
                            %>
                            <!--Hiển thị các môn học trên thanh dropdown với giá trị mặc định là môn vừa chọn trước đó-->
                            <option value=<%="" + i%> <%=(("" + i).equals((String) request.getSession().getAttribute("tuan_hien_tai")) ? "selected" : "")%>>
                                <%="Tuần " + (i + 1)%>
                            </option>
                            <%}%>
                        </select>

                        <div class="table-responsive">
                            <table class="table table-bordered text-center">
                                <thead>
                                    <tr class="bg-light-gray">
                                        <th class="text-uppercase" style="width:5%"><center>Time</center>
                                        </th>
                                        <th class="text-uppercase" style="width:12%"><center>Thứ 2</th></center>
                                        <th class="text-uppercase" style="width:12%"><center>Thứ 3</th></center>
                                        <th class="text-uppercase" style="width:12%"><center>Thứ 4</th></center>
                                        <th class="text-uppercase" style="width:12%"><center>Thứ 5</th></center>
                                        <th class="text-uppercase" style="width:12%"><center>Thứ 6</th></center>
                                        <th class="text-uppercase" style="width:12%"><center>Thứ 7</th></center>
                                        <th class="text-uppercase" style="width:12%"><center>Chủ Nhật</th></center>
                                    </tr>
                                </thead>

                                <tbody>
                                    <%
                                        if (request.getSession().getAttribute("tuan_hien_tai") != null) {
                                            int tuan = Integer.valueOf((String) request.getSession().getAttribute("tuan_hien_tai"));
                                            ds = thoiKhoaBieu_DAO.getDsid_lhp(ma);
                                            String[][][][] tkb = thoiKhoaBieu_DAO.getTKB(ds);
                                            int[][][] tkb_chi_tiet = thoiKhoaBieu_DAO.getTKB_ChiTiet(ds);
                                            for (int i = 0; i < 6; i++) {
                                    %>
                                    <tr>
                                        <td class="bg-light-gray" style="height:100px; vertical-align:middle">
                                            <strong><font ><%="Kíp " + (i + 1)%></font></strong>
                                        </td>
                                        <%
                                            for (int j = 0; j < 7; j++) {
                                        %>
                                        <td>
                                            <%if (tkb[tuan][j][i][0] != null) {%>
                                            <div class="margin-5px-top font-size16"><font color="blue"><%=tkb[tuan][j][i][0]%></font></div>
                                            <div class="margin-5px-top font-size20"><font size="2"><i>Phòng:</i> <strong><%=tkb[tuan][j][i][1]%></strong></font></div>
                                            <button class="btn btn-primary btn-xs" type="submit" name="chi_tiet" value=<%="" + tkb_chi_tiet[tuan][j][i]%>>Chi tiết</button> 
                                            <%}%>
                                        </td>
                                        <%}%>
                                    </tr>
                                    <%}
                                        }%>
                                </tbody>
                            </table>
                            <%if (request.getSession().getAttribute("lhp_chi_tiet") != null) {%>
                            <%int id_lhp = Integer.valueOf((String) request.getSession().getAttribute("lhp_chi_tiet"));%>
                            <%ArrayList<String> dssv = thoiKhoaBieu_DAO.getDsma_sv(id_lhp);%>
                            <%LopHocPhan_model Lop = lopHocPhan_DAO.getLhp(id_lhp);%>
                            <%int tuan = Integer.valueOf((String) request.getSession().getAttribute("tuan_hien_tai"));%>
                            <div class="col-md-8">
                                <h4>Chi tiết lớp học phần môn  tại phòng </h4>
                                <div class="card mb-3">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <h6 class="mb-0">Tên môn học:</h6>
                                            </div>
                                            <div class="col-sm-9 text-secondary"><%=Lop.getTen_mon_hoc()%></div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <h6 class="mb-0">Phòng học: </h6>
                                            </div>
                                            <div class="col-sm-9 text-secondary"><%=Lop.getPhong_hoc()%></div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <h6 class="mb-0">Ngày học:</h6>
                                            </div>
                                            <div class="col-sm-9 text-secondary"><%=Lop.getNgay(tuan)%></div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <h6 class="mb-0">Giờ học:</h6>
                                            </div>
                                            <div class="col-sm-9 text-secondary"><%=Lop.getGioHoc()%></div>
                                        </div>
                                    </div>
                                </div>


                                <h4>Danh sách sinh viên học trong lớp này:</h4>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">#STT</th>
                                            <th scope="col">Tên sinh viên</th>
                                            <th scope="col">Mã sinh viên</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%for (int i = 0; i < dssv.size(); i++) {%>
                                            <tr>
                                                <td><%=i + 1%></td>
                                                <td><%=sinhVien_DAO.getTentheoMa(dssv.get(i))%></td>
                                                <td><%=dssv.get(i)%></td>
                                            </tr>
                                            <%}%>
                                    </tbody>
                                </table>
                                <%}%>
                            </div>
                        </div>                    
                    </div>
                    <%}%>
                </div>
            </form>
        </div>
        <%}%>
    </body>
</html>
