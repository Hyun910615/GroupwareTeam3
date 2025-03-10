<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>JaeHee Group</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="<c:url value="/resources/css/styles.css"/>" rel="stylesheet" />
    <link rel="stylesheet" href="<c:url value="/resources/css/EDMS/EDMS_ing.css"/>">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
    <%@ include file="/WEB-INF/views/intro.jsp" %>

        <div id="layoutSidenav_content">
            <div class="content_box">
                진행중문서
            </div>
            <!-- 진행중문서 리스트 테이블 -->
                <div class="EDMS_ing_docu_list">
                    <p>기안 진행중인 문서</p>
                    <div class="EDMS_ing_docu_table_list">
                    <table class="EDMS_ing_docu_table">
                        <tr class="EDMS_ing_table_bg">
                            <td>문서번호</td>
                            <td>기안일</td>
                            <td>결재양식</td>
                            <td>기안자</td>
                            <td style="width:40%">제목</td>
                            <td>긴급</td>
                            <td>첨부</td>
                        </tr>
                        <c:forEach  var="list" items="${EDMS_list}">
                            <tr class="EDMS_ing_table_hover">
                                <c:if test="${sessionScope.emp_name != list.emp_name}">
                                    <script>
                                        location.href = "/";
                                    </script>
                                </c:if>
                                <td>${list.EDMS_docu_num}</td>
                                <td>${fn:substring(list.EDMS_docu_date, 0, 10)}</td>
                                <td>${list.EDMS_docu_category}</td>
                                <td>${list.emp_name}</td>
                                <td>${list.approval_request_docu_title}</td>
                                <td>
                                    <i class="
                                    <c:out value="${list.EDMS_docu_urgent == 1 ? 'xi-error' : ''}"/>
                                    "></i>
                                </td>
                                <td>
                                    <i class="
                                    <c:out value="${list.file_no != null ? 'xi-paper' : ''}"/>
                                    "></i>
                                </td>
                            </tr>
                        </c:forEach>
<%--                        <tr class="EDMS_ing_table_hover">--%>
<%--                            <td>20203086</td>--%>
<%--                            <td>2021-12-10</td>--%>
<%--                            <td>품의서</td>--%>
<%--                            <td>김형준</td>--%>
<%--                            <td>교통비 신청 2</td>--%>
<%--                            <td></td>--%>
<%--                            <td><i class="xi-paper"></i></td>--%>
<%--                        </tr>--%>
<%--                        <tr class="EDMS_ing_table_hover">--%>
<%--                            <td>20203075</td>--%>
<%--                            <td>2021-12-05</td>--%>
<%--                            <td>품의서</td>--%>
<%--                            <td>김형준</td>--%>
<%--                            <td>교통비 신청 </td>--%>
<%--                            <td><i class="xi-error"></i></td>--%>
<%--                            <td></td>--%>
<%--                        </tr>--%>
                        
                    </table>
                     
                    </div>

                    <!-- 페이지 넘버 -->
                <div class="EDMS_ing_list_number">
                    <div>
                        <div class="EDMS_ing_list_n_menu">
                            <span class="EDMS_ing_disabled"><  이전</span>
                            <span class="EDMS_ing_current">1</span>
                            <a href="#?page=2">2</a>
                            <a href="#?page=3">3</a>
                            <span class="EDMS_ing_disabled">다음  ></span>                                
                        </div>                            
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
</body>

</html>