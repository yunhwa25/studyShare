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
                            <div id="div_err_user_id" style="display: none"></div>
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
                                <span class="input-group-text">sharer</span>
                                <input type="text" name="sharer" id="sharer" value="${bbsDTO.sharer}" maxlength="100" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                            </div>
                            <div id="div_err_sharer" style="display: none"></div>
                        </div>
                        <div class="mb-3">
                            <div class="input-group">
                                <span class="input-group-text">display_yn</span>
                                <input type="text" name="display_yn" id="display_yn" value="${bbsDTO.display_yn}" maxlength="100" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                            </div>
                            <div id="div_err_display_yn" style="display: none"></div>
                        </div>
                        <div class="mb-3">
                            <div class="input-group">
                                <span class="input-group-text">display_start</span>
                                <input type="date" class="form-control" name="display_start" id="display_start" value="${bbsDTO.display_start}" maxlength="10" />
                            </div>
                            <div id="div_err_display_start" style="display: none"></div>
                        </div>
                        <div class="mb-3">
                            <div class="input-group">
                                <span class="input-group-text">display_end</span>
                                <input type="date" class="form-control" name="display_end" id="display_end" value="${bbsDTO.display_end}" maxlength="10" />
                            </div>
                            <div id="div_err_display_end" style="display: none"></div>
                        </div>
                        <div class="mb-3">
                            <div class="input-group">
                                <span class="input-group-text">file</span>
                                <input type="file" name="file" class="form-control"/>
                            </div>
                        </div>

<%--                        <div class="input-group">--%>
<%--                            <span class="input-group-text">interest</span>--%>
<%--                            <div class="form-control">--%>
<%--                                <div class="form-check form-check-inline" style="vertical-align: middle">--%>
<%--                                    <input class="form-check-input" type="checkbox" name="interest" id="interest_0" value="스포츠" <c:out value="${bbsDTO.interest.contains(\"스포츠\") ? 'checked' : ''}"/>/>--%>
<%--                                    <label class="form-check-label" for="interest_0">스포츠</label>--%>
<%--                                </div>--%>
<%--                                <div class="form-check form-check-inline" style="vertical-align: middle">--%>
<%--                                    <input class="form-check-input" type="checkbox" name="interest" id="interest_1" value="여행" <c:out value="${bbsDTO.interest.contains(\"여행\") ? 'checked' : ''}"/>/>--%>
<%--                                    <label class="form-check-label" for="interest_1">여행</label>--%>
<%--                                </div>--%>
<%--                                <div class="form-check form-check-inline" style="vertical-align: middle">--%>
<%--                                    <input class="form-check-input" type="checkbox" name="interest" id="interest_2" value="영화" <c:out value="${bbsDTO.interest.contains(\"영화\") ? 'checked' : ''}"/>/>--%>
<%--                                    <label class="form-check-label" for="interest_2">영화</label>--%>
<%--                                </div>--%>
<%--                                <div class="form-check form-check-inline" style="vertical-align: middle">--%>
<%--                                    <input class="form-check-input" type="checkbox" name="interest" id="interest_3" value="음악" <c:out value="${bbsDTO.interest.contains(\"음악\") ? 'checked' : ''}"/>/>--%>
<%--                                    <label class="form-check-label" for="interest_3">음악</label>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
                    </div>
                </div>
            </div>
            <div class="mb-5">
                <button type="submit" class="btn btn-outline-primary btn-sm">글등록</button>
                <button type="reset" class="btn btn-outline-secondary btn-sm">초기화</button>
                <button type="button" class="btn btn-outline-danger btn-sm" onclick="location.href='/bbs/list'">취소</button>
            </div>
        </div>
    </form>
    <%@ include file="/WEB-INF/common/footer.jsp" %>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
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
