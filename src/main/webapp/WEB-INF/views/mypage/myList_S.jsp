<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zxx">

<!-- head.jsp -->
<jsp:include page="../include/head.jsp" />

<body>
	<!--::header part start::-->
	<!-- header.jsp -->
	<jsp:include page="../include/hearder.jsp" />
	<!-- Header part end-->

	<jsp:include page="../include/mypageLeft.jsp" />
	<section class="left_main"
		style="padding-top: 100px; padding-left: 70px;">
		<div class="col-12" style="text-align: center;">
			<img src="../resources/img/myPage/판매목록1.png" alt="" width="280px;" />
		</div>
		<div class="cat_box">
			<div class="my_specialist_name">
				<span></span>
			</div>

		</div>

		<div class="tab_content">
			<div>
				<div class="infinite-scroll-component "
					style="height: auto; overflow: auto; -webkit-overflow-scrolling: touch">
					<ul class="mian_row profile_main_row">
						<c:choose>
							<c:when test="${empty likeList}">
								<span style="font-size: 20px; padding-left: 250px;">게시물이
									없습니다.</span>


								<div class="row"
									style="padding-top: 50px; padding-left: 50px; padding-bottom: 50px; border-bottom: 1px solid #d9d9d9;">
									<div class="col-3">
										<div class="member_image_box1"></div>
									</div>
									<div class="col-1"></div>
									<div class="member_box col-8"></div>

								</div>


							</c:when>
							<c:otherwise>
								<c:forEach var="list" items="${likeList }">
									<li class="main_col_3" style="padding: 5px"><a
										class="card card_list"
										href="/item/166608634?viewPath=wish_list&amp;clickPath=member"><div
												class="card_box">
												<div class="image_wrapper">
													<div class="image_outside">
														<div class="image_centerbox">
														<a href="../product/productView.woo?boardidx=${list.boardidx}"  > 
															<img src="../resources/Upload/${list.imagefile}"
																data-src="https://ccimg.hellomarket.com/images/2020/item/04/28/15/1709868_4830039_1.jpg?size=s4"
																class="thumbnail_img"/>
																</a> 
														</div>
														<div class="dealer_text_position"></div>
													</div>
												</div>
												<div class="cont">
													<div class="item_title related_item_icon">${list.title }</div>
													<div class="item_price profile_price">${list.price }원</div>
												</div>
											</div></a></li>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
				<ul class="pagination justify-content-center">${pagingImg }
				</ul>
			</div>

		</div>
	</section>
	</div>
	</div>
	</div>
	</div>
	</div>
	</section>
	<!--================Blog Area =================-->
	<!-- bottom.jsp -->
	<jsp:include page="../include/bottom.jsp" />
	<jsp:include page="../include/sidebar.jsp" />
</body>

</html>