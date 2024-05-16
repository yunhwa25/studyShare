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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <title>Bbs >> Modify</title>
</head>
<body>
<div class="container-fluid">
    <%@ include file="/WEB-INF/common/header.jsp" %>
    <h1 style="width: 75%; margin: 0 auto 20px; text-align: center;">Modify</h1>
    <form name="frmModify" id="frmModify" method="post" action="/bbs/modify">
        <input type="hidden" name="idx" id="idx" value="${bbs.idx}"/>
        <div class="list-group" style="width: 75%; margin: 0 auto;">
            <div class="list-group-item list-group-item-action" style="margin-bottom: 24px;" aria-current="true">
                <div class="d-flex w-100 justify-content-center" style="margin-bottom: 8px; padding-bottom: 4px;">
                    <div class="mb-1">
                        <div class="input-group mb-3">
                            <span class="input-group-text">id</span>
                            <input type="text" name="user_id" id="user_id" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${bbs.user_id}" readonly>
                        </div>
                        <div class="mb-3">
                            <div class="input-group">
                                <span class="input-group-text" id="inputGroup-sizing-default">title</span>
                                <input type="text" name="title" id="title" value="${bbs.title}" maxlength="100" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                            </div>
                            <div id="div_err_title" style="display: none"></div>
                        </div>
                        <div class="mb-3">
                            <div class="input-group">
                                <span class="input-group-text">content</span>
                                <textarea class="form-control" aria-label="With textarea" name="content" id="content" rows="10" cols="60">${bbs.content}</textarea>
                            </div>
                            <div id="div_err_content" style="display: none"></div>
                        </div>
                        <div class="mb-3">
                            <div class="input-group">
                                <span class="input-group-text">display_date</span>
                                <input type="date" class="form-control" name="display_date" id="display_date" value="${bbs.display_date}" maxlength="10" />
                            </div>
                            <div id="div_err_display_date" style="display: none"></div>
                        </div>
                        <div class="input-group">
                            <span class="input-group-text">interest</span>
                            <div class="form-control">
                                <div class="form-check form-check-inline" style="vertical-align: middle">
                                    <input class="form-check-input" type="checkbox" name="interest" id="interest_0" value="스포츠" <c:out value="${bbs.interest.contains(\"스포츠\") ? 'checked' : ''}"/>>
                                    <label class="form-check-label" for="interest_0">스포츠</label>
                                </div>
                                <div class="form-check form-check-inline" style="vertical-align: middle">
                                    <input class="form-check-input" type="checkbox" name="interest" id="interest_1" value="여행" <c:out value="${bbs.interest.contains(\"여행\") ? 'checked' : ''}"/>>
                                    <label class="form-check-label" for="interest_1">여행</label>
                                </div>
                                <div class="form-check form-check-inline" style="vertical-align: middle">
                                    <input class="form-check-input" type="checkbox" name="interest" id="interest_2" value="영화" <c:out value="${bbs.interest.contains(\"영화\") ? 'checked' : ''}"/>>
                                    <label class="form-check-label" for="interest_2">영화</label>
                                </div>
                                <div class="form-check form-check-inline" style="vertical-align: middle">
                                    <input class="form-check-input" type="checkbox" name="interest" id="interest_3" value="음악" <c:out value="${bbs.interest.contains(\"음악\") ? 'checked' : ''}"/>>
                                    <label class="form-check-label" for="interest_3">음악</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="mb-5">
                <button type="submit" class="btn btn-outline-primary btn-sm">수정완료</button>
                <button type="reset" class="btn btn-outline-secondary btn-sm">초기화</button>
                <button type="button" class="btn btn-outline-danger btn-sm" onclick="location.href='/bbs/list'">수정취소</button>
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
