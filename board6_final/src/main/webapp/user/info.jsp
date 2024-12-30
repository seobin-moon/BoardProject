<%@page import="com.ssafy.member.model.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<c:set var="root" value="${pageContext.request.contextPath}" />
<%
MemberDto memberDto = (MemberDto) request.getAttribute("userinfo");
%>
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>회원 정보 조회</title>

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
            <mark class="orange">회원 정보 조회</mark>
        </h2>
    <div class="mb-3">
    	이름 : <%=memberDto.getUserName() %>
    </div>
    <div class="mb-3">
    	아이디 : <%=memberDto.getUserId() %>
    </div>
    <div class="mb-3">
    	이메일 : <%=memberDto.getEmailId() %>@<%=memberDto.getEmailDomain() %>
    </div>


</body>
</html>