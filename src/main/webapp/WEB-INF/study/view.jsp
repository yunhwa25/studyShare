<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-04-17
  Time: 오전 9:28
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
    <title>Study >> View</title>
    <style>
        #container {
            height: 100%;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .w1024 {width: 1024px; margin: 0 auto;}
    </style>
</head>
<body>
<div id="container">
    <%@ include file="/WEB-INF/common/header.jsp" %>
    <h1 style="width: 75%; margin: 0 auto 20px; text-align: center;">나의 학습</h1>
    <form name="frmDelete" id="frmDelete" method="post" action="/study/delete">
        <input type="hidden" name="idx" id="idx" value="${bbs.idx}"/>
        <div class="list-group" style="width: 75%; margin: 0 auto;">
            <div class="list-group-item" style="margin-bottom: 24px;">
                <h2 class="mb-2">${bbs.title}</h2>
                <small style="margin-right: 10px;">${bbs.writer}</small>
                <small>${bbs.reg_date}</small>
                <p class="fs-5 col-md-8" style="margin: 10px 0; border-top: 1px solid rgba(0,0,0,.125); width: 100%; padding-top: 8px;">
                    ${bbs.content}
                </p>
            </div>
            <div class="mb-5">
                <button type="button" onclick="location.href='/study/list'" class="btn btn-outline-primary btn-sm px-4">목록</button>
                <button type="button" onclick="location.href='/study/modify?idx=${bbs.idx}'" class="btn btn-outline-secondary btn-sm px-4">수정</button>
                <button type="button" onclick="goDelete()" class="btn btn-outline-danger btn-sm px-4">삭제</button>
            </div>
        </div>
    </form>
    <%@ include file="/WEB-INF/common/footer.jsp" %>
</div>
<script src="/resources/js/bootstrap.bundle.min.js"></script>
<script>
    function goDelete() {
        const frm = document.getElementById("frmDelete");
        let confirm_flag = confirm("해당 게시글을 삭제하시겠습니까?");
        if (confirm_flag) {
            frm.submit();
        }
    }
</script>
</body>
</html>
