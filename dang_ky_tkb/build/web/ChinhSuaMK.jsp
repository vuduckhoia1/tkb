<%-- 
    Document   : ChinhSuaMK
    Created on : Nov 29, 2021, 11:31:35 PM
    Author     : JohnLark
--%>

<%@page import="DAO.SinhVien_DAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chỉnh sửa mật khẩu</title>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>
        <%
        if(request.getSession().getAttribute("ma_sv")==null){
            response.sendRedirect("DangNhap.jsp");
        }else{%>
        <%
            SinhVien_DAO sinhVien_DAO = new SinhVien_DAO();
            String ma = (String)request.getSession().getAttribute("ma_sv");
            String ten = sinhVien_DAO.getTentheoMa(ma);
            String ma_tmp = ma.toUpperCase();
        %>
        <div class="container-fluid">
            <form action="ChinhSuaMK_servlet" method="post">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex flex-column align-items-center text-center">
                                    <%if(ma.equals("admin")){%>
                                    <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Admin" class="rounded-circle p-1 bg-primary" width="110">
                                    <%}else{%>
                                    <img src="https://bootdey.com/img/Content/avatar/avatar6.png" alt="Admin" class="rounded-circle p-1 bg-primary" width="110">
                                    <%}%>
                                    <div class="mt-3">
                                        <h4><%=ten%></h4>
                                        <p class="text-secondary mb-1"><%=ma_tmp%></p>
                                        <p class="text-muted font-size-sm">Học viện Công nghệ Bưu Chính Viễn Thông</p>
                                    </div>
                                </div>
                                <hr>
                                <%if(ma.equals("admin")){%>
                                    <button type="submit" name="quay_lai1" class="btn btn-primary mt-3">Quay lại</button> 
                                    <%}else{%>
                                    <button type="submit" name="quay_lai2" class="btn btn-primary mt-3">Quay lại</button> 
                                <%}%>
                                
                                <br>
                                <button type="submit" name="dang_xuat" class="btn btn-primary mt-3">Đăng xuất</button>
                            </div>
                        </div>
                    </div>           
                                        
                    <div class="col-lg-9">
                        <div class="main-box clearfix">
                            <c:if test = "${param.err eq 'saiMK'}">
                                <div class="alert alert-danger">
                                    <div class="container">
                                        <b>Error Alert:</b> Mật khẩu hiện tại không đúng
                                    </div>
                                </div>                             
                            </c:if>
                            <c:if test = "${param.err eq 'trungMK'}">
                                <div class="alert alert-danger">
                                    <div class="container">
                                        <b>Error Alert:</b> Mật khẩu mới không thể trùng với mật khẩu hiện tại
                                    </div>
                                </div>                                
                            </c:if>
                            <c:if test = "${param.err eq 'trong'}">
                                <div class="alert alert-danger">
                                    <div class="container">
                                        <b>Error Alert:</b> Mật khẩu mới và mật khẩu hiện tại không thể trống
                                    </div>
                                </div>                                 
                            </c:if>
                            <c:if test = "${param.err eq 'xong'}">
                                <div class="alert alert-success">
                                    <div class="container">
                                        <b>Success</b> Đổi mật khẩu hoàn tất
                                    </div>
                                </div>                                 
                            </c:if>
                            <h4>Chỉnh sửa mật khẩu </h4>
                            <div class="form-outline mb-4" style="width:25%">
                                <input type="password" id="form3Example3" style="height:30px" name="MK_hien_tai" class="form-control form-control-lg" accept=""placeholder="Enter mật khẩu hiện tại" />
                                <label class="form-label" for="form3Example3">Mật khẩu hiện tại</label>
                                <input type="password" id="form3Example3" style="height:30px" name="MK_moi" class="form-control form-control-lg" accept=""placeholder="Enter mật khẩu mới" />
                                <label class="form-label" for="form3Example3">Mật khẩu mới</label>
                            <br>
                            <button type="submit" name="doi_mk" class="btn btn-primary">Đổi mật khẩu</button> 
                            
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <%}%>
    </body>
</html>
