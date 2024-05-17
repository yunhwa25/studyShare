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
    <title>Study >> List</title>
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
    <div class="d-flex w1024" style="margin: 0 auto;">
        <button class="btn btn-lg btn-outline-primary mb-3" type="button" style="margin-right: 30px;">오늘의 학습</button>
        <button class="btn btn-lg btn-primary mb-3" type="button">나의학습</button>
        <button class="btn btn-lg btn-outline-primary mb-3" type="button">공유학습</button>
    </div>
    <div class="content w1024" style="margin: 0 auto;">
        <div class="col">
            <div class="card" style="border: none;">
                <div>
                    <form action="/study/list" method="get">
                        <%--                        <input type="hidden" name="page_size" value="${pageRequestDTO.page_size}">--%>
                        <%--                        <input type="hidden" name="page" value="${pageRequestDTO.page}">--%>
                        <div class="input-group mb-3">
                            <div class="input-group-text">검색 범위</div>
                            <div class="input-group-text">
                                <label for="search_type_0" style="margin-right: 12px;"><input style="vertical-align: middle;" class="form-check-input mt-0"  type="checkbox" id="search_type_0" name="search_type" value="t"
                                ${pageRequestDTO.checkType("t")? "checked" : ""}/> 제목</label>
                                <label for="search_type_1"><input style="vertical-align: middle;" class="form-check-input mt-0"  type="checkbox" id="search_type_1" name="search_type" value="u"
                                ${pageRequestDTO.checkType("u")? "checked" : ""}/> 내용</label>
                            </div>
                            <input type="text" class="form-control" id="search_word" name="search_word" placeholder="검색어를 입력하세요." aria-label="Text input with checkbox"
                                   value='<c:out value="${pageRequestDTO.search_word}"/>'>
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-text">검색 기간</div>
                            <div class="input-group-text">
                                <label for="search_date1" style="margin-right: 12px;">등록일 시작</label>
                                <input type="date" id="search_date1" name="search_date1" class="form-control"
                                       value="${pageRequestDTO.search_date1}">
                            </div>
                            <div class="input-group-text">
                                <label for="search_date2" style="margin-right: 12px;">등록일 끝</label>
                                <input type="date" id="search_date2" name="search_date2" class="form-control"
                                       value="${pageRequestDTO.search_date2}">
                            </div>
                        </div>
                </div>
                <div class="input-group mb-3" style="justify-content: space-between;">
                    <div class="float-end">
                        총 <span style="font-weight: bold; font-size: larger;">${responseDTO.total_count}</span>개
                    </div>
                    <div class="float-end">
                        <button class="btn btn-primary btn-sm px-4" type="button" onclick="location.href='/study/list'">전체</button>
                        <button class="btn btn-outline-primary btn-sm px-4" type="submit">검색</button>
                        <button class="btn btn-outline-secondary btn-sm px-4" type="reset">초기화</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
    <div class="float-end w1024">
        <button class="btn btn-outline-secondary btn-sm px-4" type="button">등록순</button>
        <button class="btn btn-outline-secondary btn-sm px-4" type="button">좋아요순</button>
    </div>
    <div class="list-group w1024" style="margin: 0 auto; margin-bottom: 48px;">
        <c:forEach items="${responseDTO.dtoList}" var="list" varStatus="status">
            <a href="/study/view?idx=${list.idx}" class="list-group-item list-group-item-action" aria-current="true">
                <div class="d-flex w-100 justify-content-between" style="margin-bottom: 8px; padding-bottom: 4px; border-bottom: 1px solid rgba(0,0,0,.125)">
                    <h5 class="mb-1">제목 : ${list.title}</h5>
                    <small>좋아요 : ${list.like_cnt}</small>
                </div>
                <div class="d-flex justify-content-between">
                    <p class="mb-1" style="padding-bottom: 24px;">등록일 : ${list.reg_date}</p>
                    <p class="mb-1" style="padding-bottom: 24px;">오늘의 학습 노출여부 : ${list.display_yn}</p>
                    <p class="mb-1" style="padding-bottom: 24px;">오늘의 학습 노출기간 : ${list.display_start} ~ ${list.display_end}</p>
                </div>
                <small>id : ${list.writer}</small>
            </a>
        </c:forEach>
        <div class="float-end">
            <a href="/study/regist" class="btn btn-primary my-3" style="float: right;">학습 등록</a>
        </div>
    </div>
    <div class="w1024" style="margin: 0 auto 120px;">
        <nav aria-label="Page navigation example pagination">
            <ul class="pagination justify-content-center">
                <li class="page-item
        <c:if test="${responseDTO.prev_page_flag ne true}"> disabled</c:if>">
                    <a class="page-link"
                       data-num="<c:choose><c:when test="${responseDTO.prev_page_flag}">${responseDTO.page_block_start-1}</c:when><c:otherwise>1</c:otherwise></c:choose>"
                       href="<c:choose><c:when test="${responseDTO.prev_page_flag}">${responseDTO.linkParams}&page=${responseDTO.page_block_start-1}</c:when><c:otherwise>#</c:otherwise></c:choose>" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <c:forEach begin="${responseDTO.page_block_start}" end="${responseDTO.page_block_end}" var="page_num">
                    <li class="page-item<c:if test="${responseDTO.page == page_num}"> active</c:if> ">
                        <a class="page-link" data-num="${page_num}"
                           href="<c:choose><c:when test="${responseDTO.page == page_num}">#</c:when><c:otherwise>${responseDTO.linkParams}&page=${page_num}</c:otherwise></c:choose>">${page_num}</a>
                    </li>
                </c:forEach>
                <li class="page-item
        <c:if test="${responseDTO.next_page_flag ne true}"> disabled</c:if>">
                    <a class="page-link"
                       data-num="<c:choose><c:when test="${responseDTO.next_page_flag}">${responseDTO.page_block_end+1}</c:when><c:otherwise>${responseDTO.page_block_end}</c:otherwise></c:choose>"
                       href="<c:choose><c:when test="${responseDTO.next_page_flag}">${responseDTO.linkParams}&page=${responseDTO.page_block_end+1}</c:when><c:otherwise>#</c:otherwise></c:choose>" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
    <%@ include file="/WEB-INF/common/footer.jsp" %>
</div>
<script src="/resources/js/bootstrap.bundle.min.js"></script>
<script>
    const listDOM = document.querySelectorAll(".list-group-item");
    for (let i = 0; i < listDOM.length; i++) {
        listDOM[i].addEventListener("mouseover", function(e) {
            listDOM[i].classList.add("active");
            listDOM[i].children[0].style.borderColor = "white";
        }, false)

        listDOM[i].addEventListener("mouseleave", function(e) {
            listDOM[i].classList.remove("active");
            listDOM[i].children[0].style.borderColor = "rgba(0,0,0,.125)";
        }, false)
    }

</script>

</body>
</html>
