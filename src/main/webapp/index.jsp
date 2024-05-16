<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap CSS -->
  <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
  <title>index</title>
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
  <div class="w1024">
    <c:if test="${!empty sessionScope.loginInfo}">
      <h1 style="width: 75%; margin: 0 auto 20px; text-align: center;">
          ${sessionScope.loginInfo}님, 안녕하세요!
      </h1>
      <button class="w-100 btn btn-lg btn-primary mb-3 text-center" style="max-width:330px; display: block; margin: 0 auto;" type="button" onclick="location.href='/study/list'">오늘의 학습 확인하기</button>
    </c:if>
    <c:if test="${empty sessionScope.loginInfo}">
      <h1 style="width: 75%; margin: 0 auto 20px; text-align: center;">서비스는 로그인 후 이용하실 수 있습니다.</h1>
    </c:if>
  </div>
  <%@ include file="/WEB-INF/common/footer.jsp" %>
</div>
<script src="/resources/js/bootstrap.bundle.min.js"></script>
<script>
  if (${!empty result}) alert("${result}")
</script>
</body>
</html>