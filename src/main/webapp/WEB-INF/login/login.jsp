<%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2024-05-13
  Time: 오후 5:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <title>Login >> Login</title>
</head>
<body>
<div class="text-center d-flex align-items-center">
    <main class="form-signin" style="width: 100%; max-width: 330px; margin: 50px auto;">
        <form name="frmLogin" id="frmLogin" method="post" action="/login/login">
            <input type="hidden" name="acc_url" id="acc_url" value="${acc_url}" />
            <a href="/"><img class="mb-4" src="/resources/img/header_logo.png" height="57"></a>
            <h1 class="h3 mb-3 fw-normal">LOGIN</h1>
            <div class="form-floating">
                <input type="text" class="form-control" name="user_id" id="user_id" value="${!empty save_id ? save_id : param.id}" maxlength="50"/>
                <label for="user_id">아이디를 입력해주세요.</label>
            </div>
            <div class="form-floating" style="margin-bottom: 10px;">
                <input type="password" class="form-control" name="pwd" id="pwd" value="" maxlength="100"/>
                <label for="pwd">비밀번호를 입력해주세요.</label>
            </div>
            <div class="checkbox mb-3">
                <label style="margin-right: 10%"><input type="checkbox" name="save_id" id="save_id"
                        <c:out value="${!empty save_id ? 'checked' : ''}" />/> 아이디저장</label>
                <button class="btn btn-outline-primary" type="button" id="btnPwd" onclick="location.href='/login/findPwd';">패스워드 찾기</button>
            </div>
            <button class="w-100 btn btn-lg btn-primary mb-3" type="submit" id="btnLogin">로그인</button>
            <a href="/member/join" style="color: inherit; opacity: .65" ><small>회원가입</small></a>
        </form>
    </main>
</div>
<script src="/resources/js/bootstrap.bundle.min.js"></script>
<script>

    if (${!empty err}) {
        if (${param.try_count > 5}) alert("5회 이상 로그인 실패로 잠금 처리된 아이디입니다. 관리자에게 문의해 주세요.")
        else if (${!empty param.try_count}) alert("${err} \n로그인 시도 ${param.try_count}회/5회")
        else alert("${err}")
    }

    const btnLogin = document.getElementById("btnLogin");
    const frm = document.getElementById("frmLogin");
    const idDOM = document.getElementById(("user_id"));
    const pwdDOM = document.getElementById("pwd");


    const id_reg = /^[a-z0-9]+$/;
    const pwd_reg = /^[a-zA-Z0-9!@#$%^*+=-]+$/;

    idDOM.addEventListener("keyup", function(e){
        if(!id_reg.test(this.value)){
            this.value = this.value.replace(/[^a-z0-9]/g, '');
            alert("영어 소문자 및 숫자만 입력이 가능합니다.");
        }
    });

    pwdDOM.addEventListener("keyup", function(e){
        if(!pwd_reg.test(this.value)){
            this.value = this.value.replace(/[^a-zA-Z0-9!@#$%^*+=-]/g, '');
            alert("영어+숫자+특수문자 조합으로 최소 8자리 이상만 허용됩니다.");
        }
    });

    pwdDOM.addEventListener("input", function(e) {
        if (e.target.value.length < 8) btnLogin.disabled = true;
        else btnLogin.disabled = false;
    }, false)

</script>
</body>
</html>