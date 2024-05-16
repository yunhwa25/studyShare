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
    <title>Bbs >> View</title>
</head>
<body>
<div class="container-fluid">
    <%@ include file="/WEB-INF/common/header.jsp" %>
    <h1 style="width: 75%; margin: 0 auto 20px; text-align: center;">View</h1>
    <form name="frmDelete" id="frmDelete" method="post" action="/bbs/delete">
        <input type="hidden" name="idx" id="idx" value="${bbs.idx}"/>
        <div class="list-group" style="width: 75%; margin: 0 auto;">
            <div class="list-group-item" style="margin-bottom: 24px;">
                <h2 class="mb-2">${bbs.title}</h2>
                <small style="margin-right: 10px;">${bbs.user_id}</small>
                <small>${bbs.reg_date}</small>
                <p class="fs-5 col-md-8" style="margin: 10px 0; border-top: 1px solid rgba(0,0,0,.125); width: 100%; padding-top: 8px;">
                    ${bbs.content}
                </p>
                <c:if test="${bbs.interest != null}">
                    <p>관심사항 : ${bbs.interest}</p>
                </c:if>
            </div>
            <div class="mb-5">
                <button type="button" onclick="location.href='/bbs/list'" class="btn btn-outline-primary btn-sm px-4">목록</button>
                <button type="button" onclick="location.href='/bbs/modify?idx=${bbs.idx}'" class="btn btn-outline-secondary btn-sm px-4">수정</button>
                <button type="button" onclick="goDelete()" class="btn btn-outline-danger btn-sm px-4">삭제</button>
            </div>
        </div>

        <div class="list-group" style="width: 75%; margin: 0 auto; margin-bottom: 48px;">
            <c:choose>
                <c:when test="${!empty bbsReply}">
                    <c:forEach items="${bbsReply}" var="list" varStatus="status">
                        <div class="list-group-item list-group-item-action" aria-current="true">
                            <div class="d-flex w-100 justify-content-between" style="margin-bottom: 8px; padding-bottom: 4px; border-bottom: 1px solid rgba(0,0,0,.125)">
                                <h5 class="mb-1">title : ${list.title}</h5>
                                <small>${list.reg_date}</small>
                            </div>
                            <small>id : ${list.user_id}</small>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="list-group-item list-group-item-action" aria-current="true">
                        <div class="d-flex w-100 justify-content-between" style="margin-bottom: 8px; padding-bottom: 4px; border-bottom: 1px solid rgba(0,0,0,.125)">
                            등록된 댓글이 없습니다.
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>

        </div>
        <form name="frmReply" id="frmReply" method="post" action="/bbs/regist">
            <div class="list-group" style="width: 75%; margin: 0 auto;">
                <div class="list-group-item list-group-item-action" style="margin-bottom: 24px;" aria-current="true">
                    <div class="d-flex w-100 justify-content-center" style="margin-bottom: 8px; padding-bottom: 4px;">
                        <div class="mb-1">
                            <div class="mb-3">
                                <div class="input-group">
                                    <span class="input-group-text" id="inputGroup-sizing-default">reply</span>
                                    <input type="text" name="reply" id="reply" value="" placeholder="댓글을 입력해주세요." maxlength="100" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                                </div>
                                <div id="div_err_reply" style="display: none"></div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <button type="submit" class="btn btn-outline-primary btn-sm">댓글등록</button>
                        <button type="reset" class="btn btn-outline-secondary btn-sm">초기화</button>
                        <button type="button" class="btn btn-outline-danger btn-sm" onclick="location.href='/bbs/list'">취소</button>
                    </div>
                </div>
            </div>
        </form>
    </form>
    <%@ include file="/WEB-INF/common/footer.jsp" %>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
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
