<%-- 
    Document   : DangNhap
    Created on : Nov 28, 2021, 4:27:38 PM
    Author     : JohnLark
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng nhập</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <style>
            .divider:after,
            .divider:before {
              content: "";
              flex: 1;
              height: 1px;
              background: #eee;
            }
            .h-custom {
              height: calc(100% - 73px);
            }
            @media (max-width: 450px) {
              .h-custom {
                height: 100%;
              }
            }
        </style>
    </head>
    <body>
        <c:if test = "${param.err eq 'sai'}">
            <h4 style="color: red">Sai mã sinh viên hoặc mật khẩu</h4>
        </c:if>
        <c:if test = "${param.err eq 'trong'}">
            <h4 style="color: red">Mã sinh viên hoặc mật khẩu không thể để trống</h4>
        </c:if>
<!--        <form action="DangNhap_servlet" method="post">
            Mã sinh viên:  <input type="text" name="ma_sv" />
            <br>
            Mật khẩu:  <input type="password" name="mk" />
            <br>
            <input type="submit" value="Đăng nhập"/>
        </form>-->
    <section class="vh-100">
        <div class="container-fluid h-custom">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-md-9 col-lg-6 col-xl-5">
                    <img src="https://mdbootstrap.com/img/Photos/new-templates/bootstrap-login-form/draw2.png" class="img-fluid"
                         alt="Sample image">
                </div>
                <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                    <form action="DangNhap_servlet" method="post">

                        <div class="divider d-flex align-items-center my-4">
                            <h3 class="text-center fw-bold mx-3 mb-0">ĐĂNG NHẬP</h3>
                        </div>

                        <!-- Email input -->
                        <div class="form-outline mb-4">
                            <input type="text" id="form3Example3" name="ma_sv" class="form-control form-control-lg"
                                   placeholder="Enter mã sinh viên" />
                            <label class="form-label" for="form3Example3">Mã sinh viên</label>
                        </div>

                        <!-- Password input -->
                        <div class="form-outline mb-3">
                            <input type="password" id="form3Example4" name="mk" class="form-control form-control-lg"
                                   placeholder="Enter password" />
                            <label class="form-label" for="form3Example4">Password</label>
                        </div>

                        <div class="text-center text-lg-start mt-4 pt-2">
                            <button type="submit" class="btn btn-primary btn-lg"
                                    style="padding-left: 2.5rem; padding-right: 2.5rem;">Login</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
        <div class="d-flex flex-column flex-md-row text-center text-md-start justify-content-between py-4 px-4 px-xl-5 bg-primary">
            <!-- Copyright -->
            <div class="text-white mb-3 mb-md-0">
                Copyright © 2020. All rights reserved.
            </div>
            <!-- Copyright -->
        </div>
    </section>
    </body>
</html>
