<%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2024-05-14
  Time: 오후 5:15
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
    <title>Login >> findPwd</title>
    <style>
        #container {
            height: 100%;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
    </style>
</head>
<body>
<div id="container">
    <%@ include file="/WEB-INF/common/header.jsp" %>
    <form name="frmJoin" id="frmJoin" method="post" action="/member/join">
        <div class="list-group" style="width: 75%; margin: 0 auto;">
    <h1 style="width: 75%; margin: 0 auto 20px; text-align: center;">패스워드를 잊으셨나요?</h1>
            <div class="list-group-item list-group-item-action" style="margin-bottom: 24px;" aria-current="true">
                <div class="d-flex w-100 justify-content-center" style="margin-bottom: 8px; padding-bottom: 4px;">
                    <div class="mb-1">
                        <div class="mb-3" >
                            <p>본인인증을 진행하기 위해 아이디를 입력하여 주세요.</p>
                            <div class="input-group">
                                <span class="input-group-text">아이디</span>
                                <input type="text" name="user_id" id="user_id" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${memberDTO.user_id}" maxlength="20">
                            </div>
                            <div id="div_err_user_id" style="display: none"></div>
                        </div>
                    </div>
                    <div class="mb-5">
                        <button type="submit" class="btn btn-outline-primary btn-sm">임시비밀번호 발송</button>
                        <button type="reset" class="btn btn-outline-secondary btn-sm">초기화</button>
                        <button type="button" class="btn btn-outline-danger btn-sm" onclick="location.href='/'">취소</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <%@ include file="/WEB-INF/common/footer.jsp" %>
</div>
<script src="/resources/js/bootstrap.bundle.min.js"></script>
<script>
    const serverValiseResult = {};
    <c:forEach items="${errors}" var="err">
    if(document.getElementById("div_err_${err.getField()}") != null) {
        document.getElementById("div_err_${err.getField()}").innerHTML = "<small style='color: red'>${err.getField()}필드는 ${err.defaultMessage}</small>";
        document.getElementById("div_err_${err.getField()}").style.display = "block";
    }
    serverValiseResult['${err.getField()}'] = '${err.defaultMessage}';
    </c:forEach>

    console.log(serverValiseResult);
</script>
</body>
</html>
