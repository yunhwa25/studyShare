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
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

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
        <div class="list-group w1024" style="margin: 0 auto;">
            <div class="list-group-item" style="margin-bottom: 24px;">
                <h2 class="mb-2">제목 : ${bbs.title}</h2>
                <div style="margin-bottom: 24px;">
                    <small>좋아요 : ${bbs.like_cnt} |</small>
                    <small>등록일 : ${bbs.reg_date} |</small>
                    <small>오늘의 학습 노출 여부 : ${bbs.display_yn}</small>
                    <c:if test="${bbs.display_yn ne 'N'}">
                        <small>| 오늘의 학습 노출 기간 : ${bbs.display_start} ~ ${bbs.display_end}</small>
                    </c:if>
                </div>
                <div style="margin-bottom: 24px;">
                    <p class="fs-5 col-md-8" style="margin: 10px 0; border-top: 1px solid rgba(0,0,0,.125); width: 100%; padding-top: 8px;">
                        <c:choose>
                            <c:when test="${!empty bbs.save_file_name}">
                                <img class="m-3" style="width: 400px; height: 600px;" src="<spring:url value='/resources/uploads/${bbs.save_file_name}'/>" />
                            </c:when>
                            <c:otherwise>
                                <img class="m-3 w-50" style="width: 400px; height: 600px; filter: brightness(50%)" src="<spring:url value='/resources/img/img-character002.jpg'/>" />
                            </c:otherwise>
                        </c:choose>
                        <span>${bbs.content}</span>
                    </p>
                </div>
                <div style="margin-bottom: 24px;">
                    <small>공유 받을 사람 : ${bbs.receiver}</small>
                </div>
                <div style="margin-bottom: 24px;">
                    <small>분야 : <c:out value="${!empty bbs.category ? bbs.category : '없음' }" /> |</small>
                    <small>해시태그 : #<c:out value="${!empty bbs.hashtag ? bbs.hashtag : '없음' }" /></small>
                </div>
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
