<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;800&display=swap" rel="stylesheet">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

    <link rel="stylesheet" href="/css/seller.css">
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/slide.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    
</head>

<body>
    <%@include file="/WEB-INF/tiles/header.jsp" %>
    <jsp:include page="/WEB-INF/views/adminFile/seller.jsp"/>
    <section>
        <div class="wrap">
            <div class="content">
                <div class="side-menu">
                    <div class="bsname">
                        <h1><a href="/seller/main">서점 이름</a></h1>
                    </div>
                    <div class="menu-title">
                        MENU
                    </div>
                    <div class="menu">
                        <div class="menu-group">
                            <div class="bigmenu"><span>서점 정보</span></div>
                            <div class="submenu"><a href="/seller/infoupdate">서점 정보 관리</a></div>
                            <div class="submenu"><a href="/seller/csmember">고객 정보 보기</a></div>
                        </div>
                        <div class="menu-group">
                            <div class="bigmenu"><span>도서 관리</span></div>
                            <div class="submenu"><a href="/seller/book/list">등록된 도서 리스트</a></div>
                            <div class="submenu"><a href="/seller/book/add">도서 추가 등록</a></div>
                        </div>
                        <div class="menu-group">
                            <div class="bigmenu"><span>대여 관리</span></div>
                            <div class="submenu"><a href="/seller/rent/reserve">예약 신청 내역</a></div>
                            <div class="submenu"><a href="/seller/rent/curr">대여 내역</a></div>
                            <div class="submenu"><a href="/seller/rent/return">반납 내역</a></div>
                        </div>
                        <div class="menu-group">
                            <div class="bigmenu"><span>판매 관리</span></div>
                            <div class="submenu"><a href="/seller/sell/history">판매 내역</a></div>
                            <div class="submenu"><a href="/seller/sell/cancel">주문 취소 관리</a></div>
                            <div class="submenu"><a href="/seller/return/manage">반품/교환 관리</a></div>
                        </div>
                        <div class="menu-group">
                            <div class="bigmenu"><span>정산</span></div>
                            <div class="submenu"><a href="/seller/calculate">정산 내역</a></div>
                        </div>
                    </div>
                </div>
                <div class="contain-3">
                    <div class="box-3">

                        <h1>판매 내역</h1>

                        <button type="button" id="save">저장</button><br><br>
                        
                        <table class="seller-list">
                            <thead>
                                <tr>
                                    <th>주문번호</th>
                                    <th>주문일자</th>
                                    <th>아이디</th>
                                    <th>제목</th>
                                    <th>수량</th>
                                    <th>주문상태</th>
                                    <th>수령방법</th>
                                    <th>배송상태</th>
                                    <th>배송완료일</th>
                                </tr>
                            </thead>
                            <tbody>

                                <c:if test="${empty pList}">
                                    <tr>
                                        <td colspan="10">판매 내역이 없습니다.</td>
                                    </tr>
                                </c:if>

                                <c:if test="${!empty pList}">
                                    <c:forEach items="${pList}" var="pItem">
                                        <tr class="row">
                                            <input type="hidden" name="p_id" class="p_id" value="${pItem.p_id}">
                                            <td>${pItem.o_id}</td>
                                            <td><fmt:formatDate value="${pItem.o_date}" pattern="yyyy-MM-dd HH:mm" /></td>
                                            <td>${pItem.o_c_id}</td>
                                            <td>${pItem.b_title}</td>
                                            <td>${pItem.p_amount}</td>
                                            <td>${pItem.order_status}</td>
                                            <td>${pItem.o_delivery_sort}</td>
                                            <td class="status_td">
                                                <c:choose>
                                                    <c:when test="${pItem.p_order_status_id eq '4'}">-</c:when>
                                                    <c:otherwise>
                                                        <c:choose>
                                                            <c:when test="${pItem.o_delivery_sort eq '택배'}">
                                                                <c:choose>
                                                                    <c:when test="${pItem.p_delivery_status_id eq '1'}">
                                                                        <select name="status_id" class="status">
                                                                            <option value="1" disabled selected>결제완료</option>
                                                                            <option value="5">배송준비중</option>
                                                                            <option value="6">배송중</option>
                                                                            <option value="7">배송완료</option>
                                                                        </select>
                                                                    </c:when>
                                                                    <c:when test="${pItem.p_delivery_status_id eq '5'}">
                                                                        <select name="status_id" class="status">
                                                                            <option value="5" disabled selected>배송준비중</option>
                                                                            <option value="6">배송중</option>
                                                                            <option value="7">배송완료</option>
                                                                        </select>
                                                                    </c:when>
                                                                    <c:when test="${pItem.p_delivery_status_id eq '6'}">
                                                                        <select name="status_id" class="status">
                                                                            <option value="6" disabled selected>배송중</option>
                                                                            <option value="7">배송완료</option>
                                                                        </select>
                                                                    </c:when>
                                                                    <c:when test="${pItem.p_delivery_status_id eq '7'}">
                                                                        <select name="status_id" class="status">
                                                                            <option value="7" disabled selected>배송완료</option>
                                                                        </select>
                                                                    </c:when>
                                                                </c:choose>
                                                            </c:when>
                                                            <c:when test="${pItem.o_delivery_sort eq '방문수령'}">
                                                                <c:choose>
                                                                    <c:when test="${pItem.p_delivery_status_id eq '1'}">
                                                                        <select name="status_id" class="status">
                                                                            <option value="1" disabled selected>결제완료</option>
                                                                            <option value="2">상품준비중</option>
                                                                            <option value="3">상품준비완료</option>
                                                                            <option value="4">수령완료</option>
                                                                        </select>
                                                                    </c:when>
                                                                    <c:when test="${pItem.p_delivery_status_id eq '2'}">
                                                                        <select name="status_id" class="status">
                                                                            <option value="2" disabled selected>상품준비중</option>
                                                                            <option value="3">상품준비완료</option>
                                                                            <option value="4">수령완료</option>
                                                                        </select>
                                                                    </c:when>
                                                                    <c:when test="${pItem.p_delivery_status_id eq '3'}">
                                                                        <select name="status_id" class="status">
                                                                            <option value="3" disabled selected>상품준비중</option>
                                                                            <option value="4">수령완료</option>
                                                                        </select>
                                                                    </c:when>
                                                                    <c:when test="${pItem.p_delivery_status_id eq '4'}">
                                                                        <select name="status_id" class="status">
                                                                            <option value="4" disabled selected>수령완료</option>
                                                                        </select>
                                                                    </c:when>
                                                                </c:choose>
                                                            </c:when>
                                                        </c:choose>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td class="deliverydate_td">
                                                <c:if test="${!empty pItem.p_deliverydate}">
                                                    <fmt:formatDate value="${pItem.p_deliverydate}" pattern="yyyy-MM-dd" />
                                                </c:if>
                                                <c:if test="${pItem.p_order_status_id eq '4'}">-</c:if>
                                            </td>
                                        </tr>
                                        <c:if test="${pItem.o_delivery_sort eq '택배'}">
                                            <tr>
                                                <td colspan="9" style="text-align: right;">배송지 : ${pItem.o_recip_addr}<br>${pItem.o_recip_name} | ${pItem.o_recip_phone}</td>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                </c:if>

                            </tbody>
                        </table>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <%@include file="/WEB-INF/tiles/footer.jsp" %>


    <script>

        $(document).ready(function () {
    
            $('#save').click(function () {
    
                let conf = confirm('저장할까요?')
    
                if (conf == true) {
    
                    let rows = document.querySelectorAll('.seller-list tbody tr.row');
                    console.log(rows)
    
                    rows.forEach(function (row) {

                        if (!row.querySelector('.status')) { return;}
    
                        let data = {};
                        data.p_id = row.querySelector('.p_id').value;
                        data.status_id = row.querySelector('.status').value;
    
                        $.ajax({
    
                            method: 'post',
                            url: '/seller/sell/history',
                            data: data,
                            dataType: 'json'
    
                        }).done(function () {
                        
                            let status_id = row.querySelector('.status').value;
    
                            if (status_id == 4 || status_id == 7) {
                                
                                const currDate = new Date();
                                const year = currDate.getFullYear();
                                const month = currDate.getMonth() + 1;
                                const day = currDate.getDate();
                                row.querySelector('.deliverydate_td').textContent = year+'-'+month+'-'+day;
                            }   
    
                        }).fail(function (err) {
                            location.href = '/seller/sell/history'
                        })
    
                    })
    
                }
            })
    
        })
    
    </script>

</body>

</html>