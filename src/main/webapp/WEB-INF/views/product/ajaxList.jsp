<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<input type="hidden" value="${state}" name="stateflag"/>

  <!-- 상품 리스트 반복 start-->
		<c:forEach items="${lists}" var="row">	
			<div class="col-4">
				<div class="productList_div" style="height: 270px;">
				<div>
				<c:if test="${user_id ne null}">
				<div style="padding-left: 180px;">
					<c:if test="${row.like_check eq 1}"><!-- 빨간하트 --><!-- 클릭시 좋아요 해제 -->
						<img src="../resources/img/1.png" style="width: 30px; height: 30px; position: absolute; left: 83%; padding-top: 5px; padding-left: 3px;"  name = "${row.boardidx}" id ="redHeart" onclick="like_toggle(${row.boardidx})"/>
					</c:if> 
					 <c:if test="${row.like_check ne 1}"><!-- 빈하트 --> <!-- 클릭시 좋아요 -->
						<img src="../resources/img/2.png" style="width: 30px; height: 30px; position: absolute; left: 83s%; padding-top: 5px; padding-left: 3px;" name = "${row.boardidx}" id ="whiteHeart" onclick="like_toggle(${row.boardidx})"/>
					</c:if> 
				</div>
				</c:if>
        <a href="./productView.woo?boardidx=${row.boardidx}&nowPage=${param.nowPage}">

					<img class="productList_image" src="../resources/Upload/${row.imagefile}" style="width:250px; height: 250px;" />
				</div>
				</div>
				<div style="padding-left: 15px;">
					<h3> ${row.title}</h3>
				</div>
				<div style="padding-left: 15px;">
					<h4>
					<fmt:formatNumber type="number" maxFractionDigits="3" value="${row.price}"/>원 ( boardidx : ${row.boardidx})
					</h4>
				</div>
          </a>
			</div>
		 </c:forEach> 
		 <c:if test="${empty lists}">
		 	<h2 style="color: #ff4f4f; margin-left: 200px; margin-top: 100px;" >게시물이 없습니다.</h2>
		 </c:if>  
   <!-- 상품 리스트 반복 end-->
