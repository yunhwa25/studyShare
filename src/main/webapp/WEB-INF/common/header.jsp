<%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2024-05-14
  Time: 오후 3:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid w1024">
        <a class="navbar-brand" href="/"><img src="/resources/img/header_logo.png" alt height="57"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav">
                <a class="nav-link active" aria-current="page" href="/">Home</a>
                <a class="nav-link active" aria-current="page" href="/study/list">Study</a>
                <c:choose>
                    <c:when test="${empty sessionScope.loginInfo}">
                        <a class="nav-link" href="/login/login">Login</a>
                    </c:when>
                    <c:otherwise>
                        <a class="nav-link" href="/member/view">Mypage</a>
                        <a class="nav-link" href="/login/logout">Logout</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</nav>