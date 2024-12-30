<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%-- <%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%> <%@ taglib prefix="c"
uri="jakarta.tags.core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
      crossorigin="anonymous"
    />
    <link href="${root}/assets/css/app.css" rel="stylesheet" />
    <title>SSAFY</title>
  </head>
  <body>
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-8 col-md-10 col-sm-12">
          <h2 class="my-3 py-3 shadow-sm bg-light text-center">
            <mark class="orange">회원가입</mark>
          </h2>
        </div>
        <div class="col-lg-8 col-md-10 col-sm-12">
          <form id="form-join" method="POST" action="">
            <input type="hidden" name="action" value="join" />
            <div class="mb-3">
              <label for="username" class="form-label">이름 : </label>
              <input
                type="text"
                class="form-control"
                id="username"
                name="username"
                placeholder="이름..."
              />
            </div>
            <div class="mb-3">
              <label for="userid" class="form-label">아이디 : </label>
              <input
                type="text"
                class="form-control"
                id="userid"
                name="userid"
                placeholder="아이디..."
              />
            </div>
            <div id="result-view" class="mb-3"></div>
            <div class="mb-3">
              <label for="userpwd" class="form-label">비밀번호 : </label>
              <input
                type="password"
                class="form-control"
                id="userpwd"
                name="userpwd"
                placeholder="비밀번호..."
              />
            </div>
            <div class="mb-3">
              <label for="pwdcheck" class="form-label">비밀번호확인 : </label>
              <input
                type="password"
                class="form-control"
                id="pwdcheck"
                placeholder="비밀번호확인..."
              />
            </div>
            <div class="mb-3">
              <label for="emailid" class="form-label">이메일 : </label>
              <div class="input-group">
                <input
                  type="text"
                  class="form-control"
                  id="emailid"
                  name="emailid"
                  placeholder="이메일아이디"
                />
                <span class="input-group-text">@</span>
                <select
                  class="form-select"
                  id="emaildomain"
                  name="emaildomain"
                  aria-label="이메일 도메인 선택"
                >
                  <option selected>선택</option>
                  <option value="ssafy.com">싸피</option>
                  <option value="google.com">구글</option>
                  <option value="naver.com">네이버</option>
                  <option value="kakao.com">카카오</option>
                </select>
              </div>
            </div>
            <!-- 
            <div class="mb-3">
              <label for="sido" class="form-label">지역 : </label>
              <div class="input-group">
                <select class="form-select me-1" id="sido" aria-label="시도">
                  <option selected>시도선택</option>
                  <option value="1100000000">서울특별시</option>
                  <option value="2200000000">경기도</option>
                  <option value="3300000000">강원도</option>
                  <option value="4400000000">충청도</option>
                </select>
                <select class="form-select" id="gugun" aria-label="구군">
                  <option selected>구군선택</option>
                  <option value="1111000000">종로구</option>
                  <option value="1112000000">중구</option>
                  <option value="1113000000">서초구</option>
                  <option value="1114000000">강남구</option>
                </select>
              </div>
            </div>
             -->
            <div class="col-auto text-center">
              <button type="button" id="btn-join" class="btn btn-outline-primary mb-3">
                회원가입
              </button>
              <button type="button" class="btn btn-outline-success mb-3">초기화</button>
            </div>
          </form>
        </div>
      </div>
    </div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
      crossorigin="anonymous"
    ></script>
    <script>
      let isUseId = false;
      let input = document.querySelector("#userid");
      let resultDiv = document.querySelector("#result-view");
      input.addEventListener("keyup", function () {
        let checkid = input.value;
        let len = checkid.length;
        if (len < 4 || len > 16) {
          isUseId = false;
          resultDiv.setAttribute("class", "mb-3 fw-bold text-dark");
          resultDiv.innerHTML = "아이디는 4자이상 16자이하입니다.";
        } else {
        	// 4~16자 사이이면 서버에 중복 체크 요청
           let url = "${root}/user?action=idcheck&checkid=" + checkid;
          // let url = `${root}/user?action=idcheck&checkid=${checkid}`;
          // TODO : AJAX ::> 위 url에서 아이디의 사용가능 여부를 얻고 화면에 출력.
          // CSV, JSON
          // fetch(url)
          //  .then((response) => response.text())
          //  .then(data => resultViewText(data));
       
          fetch(url) // 서버에 접속해서 데이터 요청(url을 가져오는 것을 요청)
           .then((response) => response.text()) // 서버에서 데이터를 가져오는 작업(응답)이 완료된 이후에 then의 인자에 들어가 있는 함수가 실행됨
           .then(data =>
          // console.log("서버 응답 데이터: " + data); // 서버 응답 확인
           resultViewText(data)); // 응답 데이터 처리
        }
      });

      function resultViewText(data) {
        let val = data.split(","); // 데이터를 ','로 구분하여 배열로 변환
        let id = val[0];
        let cnt = parseInt(val[1]); // cnt값을 숫자로 변환하여 비교
        
        // 중복 확인 결과 처리 
        if (cnt == 0) {
          isUseId = true;
          resultDiv.setAttribute("class", "mb-3 text-success");
          resultDiv.innerHTML = "<span class='fw-bold'>" + id + "</span>은 사용할 수 있습니다.";
        } else {
          isUseId = false;
          resultDiv.setAttribute("class", "mb-3 text-danger");
          resultDiv.innerHTML = "<span class='fw-bold'>" + id + "</span>은 사용할 수 없습니다.";
        }
      }

      function resultViewJSON(data) {
        if (data.cnt == 0) {
          isUseId = true;
          resultDiv.setAttribute("class", "mb-3 text-primary");
          resultDiv.innerHTML =
            "<span class='fw-bold'>" + data.checkid + "</span>은 사용할 수 있습니다.";
        } else {
          isUseId = false;
          resultDiv.setAttribute("class", "mb-3 text-warning");
          resultDiv.innerHTML =
            "<span class='fw-bold'>" + data.checkid + "</span>은 사용할 수 없습니다.";
        }
      }

      document.querySelector("#btn-join").addEventListener("click", function () {
        if (!document.querySelector("#username").value) {
          alert("이름 입력!!");
          return;
        } else if (!document.querySelector("#userid").value) {
          alert("아이디 입력!!");
          return;
        } else if (!isUseId) {
          alert("아이디 중복 확인!!");
          return;
        } else if (!document.querySelector("#userpwd").value) {
          alert("비밀번호 입력!!");
          return;
        } else if (
          document.querySelector("#userpwd").value != document.querySelector("#pwdcheck").value
        ) {
          alert("비밀번호 확인!!");
          return;
        } else {
          let form = document.querySelector("#form-join");
          form.setAttribute("action", "${root}/user");
          form.submit();
        }
      });
    </script>
  </body>
</html>
