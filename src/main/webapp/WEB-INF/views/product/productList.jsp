<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>	
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html lang="zxx">
<head>
<link rel="stylesheet" href="../resources/css/3d.css">   
</head>
<!-- head.jsp -->
<jsp:include page="../include/head.jsp" />
<body>

<!--우동 파일명 : productList.jsp  -->

	<!--::header part start::-->
	<!-- header.jsp -->
	<jsp:include page="../include/hearder.jsp" />
	<!-- Header part end-->

	<!-- breadcrumb part start-->

	<jsp:include page="../include/productLeft.jsp" />
	<script>	
function like_toggle(idx) {
	var like_flag;
	if($("img[name=" + idx + "]").attr('src')=="../resources/img/2.png"){
		like_flag = 1;
	}
	else{
		like_flag = -1;
	}
	var str = "";
	str += idx + "#";
	$.ajax({
		url : "../mypage/likeToggle.woo",
		type:"get",
	    contentType:"text/html;charset:utf-8",
	    data:{idx : idx, like_flag : like_flag, str : str},
 	  	success : function(d) {
 	  		if($("img[name=" + idx + "]").attr('src')=="../resources/img/2.png"){
 	  			$("img[name=" + idx + "]").attr('src', "../resources/img/1.png");
 			}
 			else{
 				$("img[name=" + idx + "]").attr('src', "../resources/img/2.png");
 			}
		},
		error : function(request,status,error) {
	          console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	      }
	});
}
</script>

 <script>
 var scrollchk = true; //스크롤 체크 여부 플래그  
 var nowPage = 1;//현재페이지 
 var state="true"; 
 
//1.productList.jsp 로 들어오면 첫 실행되는 함수
$(window).ready(function() {
	 loadlist(); 
});
//2. 
var loadlist = function(){ 
    $.ajax({  
        url : './ajaxList.woo',  
        type : 'get',  
        data : {nowPage : nowPage,
        		bname : '${parameterVO.bname}',
       			order : '${parameterVO.order}',		
       			pstate : '${parameterVO.pstate}',		
       			ispay : '${parameterVO.ispay}',		
       			priceStart : '${parameterVO.priceStart}',		
       			priceEnd : '${parameterVO.priceEnd}',		
       			searchField : '${parameterVO.searchField}',		
       			searchTxt : '${parameterVO.searchTxt}'		
        },
        async: false,
        success : function(rdata) { 
        	
	    scrollchk = false;	
   	     $("input[name='stateflag']").each(function(i){
		   	   if($("input[name='stateflag']").eq(i).val()=='false'){
	  	    			state='false';
		        }
         });
      	    
	       if(state=='true'){ 
				$('#boardHTML').append(rdata);
				nowPage++;
	      		scrollchk = true; //데이터 로딩이 끝나면 스크롤체크를 풀어준다.  
	        }
		    else if(state=='false'){ 
	   	    	//alert("데이터가 없습니다.");
	   	    }
        },                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
	   error : function(request,status,error) {
		console.log("code : "+request.status+"\n"+"message : "
		 + request.responseText+"\n"+"error : "+error);
		}
   });  
}  
//3.
$(window).scroll(function(){ 
   	//새로고침이나 뒤로가기시 스크롤이 밑으로가있으면 로딩체크를하며 알람메시지가뜨므로 페이지를 완전히 세팅후 스크롤체크를 하도록 방어처리  
	if(scrollchk){ 
		if($(window).scrollTop() >= $(document).height() - $(window).height()-30 && state=='true'){  
            loadlist(); 
        }  
    } 
});  

</script>
<!-- <script>
function itemSave(boardidx){
	 $.ajax({
			url : "../product/itemSave.woo",
			data : {boardidx : boardidx},
			dataType : "json",
			type : "get",
			contentType : "text/html;charset:utf-8",
			success : sucFunc, 
	    	error : errFunc
		 });
	 function sucFunc(d) {
		 for(var i=1 ; i<=d.length ; i++){
			 $("#img"+i).attr("src","../resources/Upload/"+d[i-1].imagefile);
			 $("#title"+i).html(d[i-1].title);
			 $("#title"+i).attr("href","../product/productView.woo?boardidx="+d[i-1].boardidx);
		   }
		  
	}
	function errFunc(e){
		 //alert(e);
	}
}




 </script>
<script>
//ajaxView 로 이동
function ajaxView(boardidx){

    $.ajax({  
        url : './ajaxproductView.woo',  
        type : 'get',  
        data : {boardidx : boardidx},
        success : function(data){
        	var test = data.split(' ');
        	if(test[0].indexOf('!!!!!!!')>-1){
        		switch (test[1]){
        			case '4' : 
        				alert('따듯한 튀김우동 이상만 볼 수 있습니다.');
        				break;
        			case '3' : 
        				alert('차가운 튀김우동 이상만 볼 수 있습니다.');
        				break;
        			case '2' : 
        				alert('따듯한 일반우동 이상만 볼 수 있습니다.');
        				break;
        		}
        	}
        	else{
	        	itemSave(boardidx);
	        	$('.modal-content').html("");
	       		$('.modal-content').html(data);
	       		$('#modalview').click();
        	}
        },  
	   	error : function(request,status,error) {
		console.log("code : "+request.status+"\n"+"message : " + request.responseText+"\n"+"error : "+error);
		}
   });
} 
	
</script> -->
	<div class="col-md-9" >
		<div class="row" id="boardHTML"></div>
	</div>
	
	</div>
	</div>
	</section>
	
	<!-- The Modal -->
  <!-- <div class="modal mainModal" id="viewModal" style="margin-top: 200px; height: 1000px;">
  	 <div class="modal-dialog modal-xl" >
      <div class="modal-content" >   
      
       </div>
     </div>
  </div> -->
	<jsp:include page="../include/bottom.jsp" />
	<jsp:include page="../include/sidebar.jsp" />
</body>
</html>
