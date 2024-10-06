<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        .contents {
            display: flex;
            justify-content: flex-start;
            background-color: #f5f5f5;
            height: auto;
        }

        .content {
            background-color: #ffffff;
            padding: 20px;
        }

        /* 사이드 메뉴 스타일 */
        .nav_menu {
            background-color: #ff4714;
            width: 300px;
            padding: 20px;
            height: 700px;
            color: white;
            font-weight: bold;
        }

        .container {
            width: 100%;
            background-color: #fafafa;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }

        /* 테이블 스타일 */
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
        }

      
        
        th, td{
            text-align: center;
            padding: 20px;
        }
        tr {
            border-bottom: 1px solid #ddd;
        }
        
        th {
            
            color: gray;
            font-weight: bold;
        }
        
        #deleteBtn {
            background-color: #ff4714;
            border: none;
            color: #fafafa;
        }
    </style>
</head>
<body>
    <%@ include file="../header_white.jsp" %>
    <div class="contents">
        <div class="content">
            <!-- 사이드 메뉴 -->
            <div class="nav_menu">회원 관리</div>
        </div>

        <div class="content">
            <!-- 테이블 컨테이너 -->
            <div class="container">
                <table>
                    <thead>
                        <tr>
                            <th>사용자 유형</th>
                            <th>아이디</th>
                            <th>이름</th>
                            <th>전화번호</th>
                            <th>이메일</th>
                            <th>가입일</th>
                            <th>작업</th>
                            <th>탈퇴 여부</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="users" items="${userList }">
                            <tr>
                                <td>${users.user_type }</td>
                                <td>${users.user_id }</td>
                                <td>${users.user_name }</td>
                                <td>${users.user_tel }</td>
                                <td>${users.user_email }</td>
                                <td>${users.user_regdate }</td>
                                <td><button id="deleteBtn">삭제</button></td>
                                <td>${users.del_state}</td>             
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
