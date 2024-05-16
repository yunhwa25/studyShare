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
  </style>
</head>
<body>
<div id="container">
  <%@ include file="/WEB-INF/common/header.jsp" %>
  <div>
    content
    ${result}
  </div>
  <%@ include file="/WEB-INF/common/footer.jsp" %>
</div>
<script src="/resources/js/bootstrap.bundle.min.js"></script>
<script>
  if (${!empty result}) alert("${result}")
</script>
</body>
</html>