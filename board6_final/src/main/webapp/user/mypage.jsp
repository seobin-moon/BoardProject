<%@page import="com.ssafy.member.model.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<c:set var="root" value="${pageContext.request.contextPath}" />
<%
MemberDto memberDto = (MemberDto) request.getAttribute("user");
%>
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>마이페이지</title>

<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f8f9fa;
    margin: 0;
    padding: 20px;
}

.container {
    max-width: 600px;
    margin: auto;
    background: white;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

h2 {
    color: #333;
}

.form-label {
    margin-top: 10px;
    font-weight: bold;
}

.form-control {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border: 1px solid #ced4da;
    border-radius: 4px;
    box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
}

.button {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
    margin-right: 10px;
}

.button:hover {
    background-color: #0056b3;
}

.alert {
    margin-top: 20px;
    padding: 10px;
    border: 1px solid #ced4da;
    border-radius: 4px;
    background-color: #d4edda;
    color: #155724;
    display: none;
}
</style>
</head>

<body>
    <div class="container">
        <h2 class="my-3 py-3 shadow-sm bg-light text-center">
            <mark class="orange">회원 정보 수정</mark>
        </h2>
        <form action="${root}/user?action=update" method="post" id="updateForm">
    <div class="mb-3">
        <label for="curpwd" class="form-label">현재 비밀번호</label>
        <input type="password" class="form-control" id="curpwd" name="curpwd" />
    </div>
    <div class="mb-3">
        <label for="newUserpwd" class="form-label">새로운 비밀번호</label>
        <input type="password" class="form-control" id="newUserpwd" name="newUserpwd" placeholder="Password" />
    </div>
    <div class="mb-3">
        <label for="confirmpwd" class="form-label">새로운 비밀번호 확인</label>
        <input type="password" class="form-control" id="confirmpwd" name="confirmpwd" placeholder="Password" />
    </div>
    <div>
        <button type="submit" class="button">확인</button>
        <button type="button" class="button" id="btnWithdraw">탈퇴하기</button>
    </div>
    <div class="alert" id="updateAlert">회원 정보가 수정되었습니다.</div>
</form>

<script>
    document.querySelector("#btnWithdraw").addEventListener("click", function() {
        const confirmation = confirm("정말 탈퇴하시겠습니까?");
        if (confirmation) {
            location.href = "${root}/user?action=delete";
            alert("그동안 이용해 주셔서 감사합니다.");
        }
    });
</script>


</body>
</html>