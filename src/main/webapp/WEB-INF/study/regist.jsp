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
    <title>Study >> Regist</title>
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
    <h1 style="width: 75%; margin: 0 auto 20px; text-align: center;">나의 학습 등록</h1>
    <form name="frmRegist" id="frmRegist" method="post" action="/study/regist" enctype="multipart/form-data">
        <div class="list-group w1024" style="margin: 0 auto;">
            <div class="list-group-item list-group-item-action" style="margin-bottom: 24px;" aria-current="true">
                <div class="d-flex w-100 justify-content-center" style="margin-bottom: 8px; padding-bottom: 4px;">
                    <div class="mb-1">
                        <div class="mb-3" >
                            <div class="input-group">
                                <span class="input-group-text">writer</span>
                                <input type="text" name="writer" id="writer" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${loginInfo}" maxlength="20" readonly>
                            </div>
                            <div id="div_err_writer" style="display: none"></div>
                        </div>
                        <div class="mb-3">
                            <div class="input-group">
                                <span class="input-group-text">title</span>
                                <input type="text" name="title" id="title" value="${bbsDTO.title}" maxlength="100" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                            </div>
                            <div id="div_err_title" style="display: none"></div>
                        </div>
                        <div class="mb-3" >
                            <div class="input-group">
                                <span class="input-group-text">content</span>
                                <textarea class="form-control" aria-label="With textarea" name="content" id="content" rows="10" cols="60">${bbsDTO.content}</textarea>
                            </div>
                            <div id="div_err_content" style="display: none"></div>
                        </div>
                        <div class="mb-3">
                            <div class="input-group">
                                <span class="input-group-text">category</span>
                                <input type="text" name="category" id="category" value="${bbsDTO.category}" maxlength="100" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                            </div>
                            <div id="div_err_category" style="display: none"></div>
                        </div>
                        <div class="mb-3">
                            <div class="input-group">
                                <span class="input-group-text">hashtag</span>
                                <input type="text" name="hashtag" id="hashtag" value="${bbsDTO.hashtag}" maxlength="100" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                            </div>
                            <div id="div_err_hashtag" style="display: none"></div>
                        </div>
                        <div class="mb-3">
                            <div class="input-group">
                                <span class="input-group-text">receiver</span>
                                <input type="text" name="receiver" id="receiver" value="${bbsDTO.receiver}" maxlength="100" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                            </div>
                            <div id="div_err_receiver" style="display: none"></div>
                        </div>
                        <div class="mb-3">
                            <div class="input-group">
                                <span class="input-group-text">display_yn</span>
                                <div class="form-control">
                                    <label class="mx-3">노출
                                        <input type="radio" name="display_yn" id="display_y" value="Y" checked>
                                    </label>
                                    <label>미노출
                                        <input type="radio" name="display_yn" id="display_n" value="N">
                                    </label>
                                </div>
                            </div>
                            <div id="div_err_display_yn" style="display: none"></div>
                        </div>
                        <div class="mb-3">
                            <div class="input-group">
                                <span class="input-group-text">display_start</span>
                                <input type="date" class="form-control" name="display_start" id="display_start" value="${bbsDTO.display_start}" maxlength="20" />
                            </div>
                            <div id="div_err_display_start" style="display: none"></div>
                        </div>
                        <div class="mb-3">
                            <div class="input-group">
                                <span class="input-group-text">display_end</span>
                                <input type="date" class="form-control" name="display_end" id="display_end" value="${bbsDTO.display_end}" maxlength="20" />
                            </div>
                            <div id="div_err_display_end" style="display: none"></div>
                        </div>
                        <div class="mb-3">
                            <div class="input-group">
                                <span class="input-group-text">file</span>
                                <input type="file" name="file" class="form-control"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="mb-5">
                <button type="submit" class="btn btn-outline-primary btn-sm">글등록</button>
                <button type="reset" class="btn btn-outline-secondary btn-sm">초기화</button>
                <button type="button" class="btn btn-outline-danger btn-sm" onclick="location.href='/study/list'">취소</button>
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
