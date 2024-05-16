<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-04-23
  Time: 오후 2:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="/bbs/fileUpload" method="POST" enctype="multipart/form-data">
        <div>
            <span>파일 업로드</span>
            <input type="file" name="file" id="file" />
        </div>
        <div>
            <input type="submit" value="전송"/>
        </div>
    </form>
    <form action="/bbs/fileUpload2" method="POST" enctype="multipart/form-data">
        <div>
            <span>파일 업로드</span>
            <input type="file" name="files" multiple="multiple"/>
        </div>
        <div>
            <input type="submit" value="전송"/>
        </div>
    </form>
</body>
</html>
