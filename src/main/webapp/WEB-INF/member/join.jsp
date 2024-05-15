<%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2024-05-14
  Time: 오후 5:18
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
    <title>Member >> Join</title>
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
    <h1 style="width: 75%; margin: 0 auto 20px; text-align: center;">회원가입</h1>
    <form name="frmJoin" id="frmJoin" method="post" action="/member/join">
        <div class="list-group" style="width: 75%; margin: 0 auto;">
            <div class="list-group-item list-group-item-action" style="margin-bottom: 24px;" aria-current="true">
                <div class="d-flex w-100 justify-content-center" style="margin-bottom: 8px; padding-bottom: 4px;">
                    <div class="mb-1">
                        <div class="mb-3" >
                            <div class="input-group">
                                <span class="input-group-text">아이디</span>
                                <input type="text" name="user_id" id="user_id" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${memberDTO.user_id}" maxlength="20">
                            </div>
                            <div id="div_err_user_id" style="display: none"></div>
                        </div>
                        <div class="mb-3">
                            <div class="input-group">
                                <span class="input-group-text">이름</span>
                                <input type="text" name="name" id="name" value="${memberDTO.name}" maxlength="20" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                            </div>
                            <div id="div_err_name" style="display: none"></div>
                        </div>
                        <div class="mb-3">
                            <div class="input-group">
                                <span class="input-group-text">비밀번호</span>
                                <input type="password" name="pwd" id="pwd" value="${memberDTO.pwd}" maxlength="300" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                            </div>
                            <div id="div_err_pwd" style="display: none"></div>
                        </div>
                        <div class="mb-3">
                            <div class="input-group">
                                <input type="text" class="form-control" name="email_id" id="email_id" placeholder="이메일 아이디" aria-label="email_id" value="${memberDTO.email_id}">
                                <span class="input-group-text">@</span>
                                <input type="text" class="form-control" name="email_domain" id="email_domain"  placeholder="도메인 이름" aria-label="email_domain" value="${memberDTO.email_domain}">
                            </div>
                            <div id="div_err_email" style="display: none"></div>
                        </div>
                        <div class="mb-3">
                            <div class="input-group">
                                <span class="input-group-text">생년월일</span>
                                <input type="date" class="form-control" name="birthday" id="birthday" value="${memberDTO.birthday}"/>
                            </div>
                            <div id="div_err_birthday" style="display: none"></div>
                        </div>
                        <div class="mb-3">
                            <div class="input-group">
                                <input type="text" class="form-control" name="jumin_0" id="jumin_0" placeholder="주민등록번호 앞 6자리" aria-label="jumin_0" value="${memberDTO.jumin_0}">
                                <input type="text" class="form-control" name="jumin_1" id="jumin_1"  placeholder="주민등록번호 뒤 7자리" aria-label="jumin_1" value="${memberDTO.jumin_1}">
                            </div>
                            <div id="div_err_jumin" style="display: none"></div>
                        </div>
                        <div class="mb-3">
                            <div class="input-group">
                                <span class="input-group-text">주소1</span>
                                <input type="text" name="addr1" id="addr1" value="${memberDTO.addr1}" maxlength="100" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                            </div>
                            <div id="div_err_addr1" style="display: none"></div>
                        </div>
                        <div class="mb-3">
                            <div class="input-group">
                                <span class="input-group-text">주소2</span>
                                <input type="text" name="addr2" id="addr2" value="${memberDTO.addr2}" maxlength="100" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                            </div>
                            <div id="div_err_addr2" style="display: none"></div>
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text">관심사항</span>
                            <div class="form-control">
                                <div class="form-check form-check-inline" style="vertical-align: middle">
                                    <input class="form-check-input" type="checkbox" name="interest" id="interest_0" value="스포츠" <c:out value="${memberDTO.interest.contains(\"스포츠\") ? 'checked' : ''}"/>>
                                    <label class="form-check-label" for="interest_0">스포츠</label>
                                </div>
                                <div class="form-check form-check-inline" style="vertical-align: middle">
                                    <input class="form-check-input" type="checkbox" name="interest" id="interest_1" value="여행" <c:out value="${memberDTO.interest.contains(\"여행\") ? 'checked' : ''}"/>>
                                    <label class="form-check-label" for="interest_1">여행</label>
                                </div>
                                <div class="form-check form-check-inline" style="vertical-align: middle">
                                    <input class="form-check-input" type="checkbox" name="interest" id="interest_2" value="영화" <c:out value="${memberDTO.interest.contains(\"영화\") ? 'checked' : ''}"/>>
                                    <label class="form-check-label" for="interest_2">영화</label>
                                </div>
                                <div class="form-check form-check-inline" style="vertical-align: middle">
                                    <input class="form-check-input" type="checkbox" name="interest" id="interest_3" value="음악" <c:out value="${memberDTO.interest.contains(\"음악\") ? 'checked' : ''}"/>>
                                    <label class="form-check-label" for="interest_3">음악</label>
                                </div>
                            </div>
                        </div>
                        <div class="mb-3">
                            <div class="input-group">
                                <span class="input-group-text">직업코드</span>
                                <input type="text" name="job_code" id="job_code" value="${memberDTO.job_code}" maxlength="2" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                            </div>
                            <div id="div_err_job_code" style="display: none"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="mb-5">
                <button type="submit" class="btn btn-outline-primary btn-sm">가입완료</button>
                <button type="reset" class="btn btn-outline-secondary btn-sm">초기화</button>
                <button type="button" class="btn btn-outline-danger btn-sm" onclick="location.href='/'">가입취소</button>
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
