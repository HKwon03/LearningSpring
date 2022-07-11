<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<title>축제 게시판</title>
	 	<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
		</style>
	</head>
	<body>

		<div id="root">
			<header>
				<h1> 축제 게시판</h1>
			</header>
			<hr />
			 
			 <jsp:include page="korMap.jsp"></jsp:include>
			 
			 <br><br><br>
			 
			<div>
				<%@include file="nav.jsp" %>
			</div>
			<hr />
			
			<section id="container">
				<form role="form" method="get">
					<table>
						<tr><th>축제 이름</th><th>축제 장소</th><th>축제 시작일</th><th>축제 종료일</th><th>주최기관 전화번호</th></tr>
						
						<c:forEach items="${list}" var = "list">
							<tr>
								<td>
									<a href="/festival/readView?f_code=${list.f_code}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"><c:out value="${list.f_name}" /></a>
								</td>
								<td><c:out value="${list.f_place}" /></td>
								<td><c:out value="${list.f_startdate}" /></td>
								<td><c:out value="${list.f_enddate}" /></td>
								<td><c:out value="${list.f_tel}" /></td>
							</tr>
						</c:forEach>
						
					</table>
					
					<div class="search">
					    <select name="searchType">
					      <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
					      <option value="se1"<c:out value="${scri.searchType eq 'se1' ? 'selected' : ''}"/>>서울특별시 축제일 검색</option>
					      <option value="se2"<c:out value="${scri.searchType eq 'se2' ? 'selected' : ''}"/>>경기도 축제일 검색</option>
					      <option value="se3"<c:out value="${scri.searchType eq 'se3' ? 'selected' : ''}"/>>인천광역시 축제일 검색</option>
					      <option value="se4"<c:out value="${scri.searchType eq 'se4' ? 'selected' : ''}"/>>강원도 축제일 검색</option>
					      <option value="se5"<c:out value="${scri.searchType eq 'se5' ? 'selected' : ''}"/>>충청남도 축제일 검색</option>
					      <option value="se6"<c:out value="${scri.searchType eq 'se6' ? 'selected' : ''}"/>>충청북도 축제일 검색</option>
					      <option value="se7"<c:out value="${scri.searchType eq 'se7' ? 'selected' : ''}"/>>세종특별자치시 축제일 검색</option>
					      <option value="se8"<c:out value="${scri.searchType eq 'se8' ? 'selected' : ''}"/>>대전광역시 축제일 검색</option>
					      <option value="se9"<c:out value="${scri.searchType eq 'se9' ? 'selected' : ''}"/>>경상남도 축제일 검색</option>
					      <option value="se10"<c:out value="${scri.searchType eq 'se10' ? 'selected' : ''}"/>>경상북도 축제일 검색</option>
					      <option value="se11"<c:out value="${scri.searchType eq 'se11' ? 'selected' : ''}"/>>대구광역시 축제일 검색</option>
					      <option value="se12"<c:out value="${scri.searchType eq 'se12' ? 'selected' : ''}"/>>울산광역시 축제일 검색</option>
					      <option value="se13"<c:out value="${scri.searchType eq 'se13' ? 'selected' : ''}"/>>부산광역시 축제일 검색</option>
					      <option value="se14"<c:out value="${scri.searchType eq 'se14' ? 'selected' : ''}"/>>전라남도 축제일 검색</option>
					      <option value="se15"<c:out value="${scri.searchType eq 'se15' ? 'selected' : ''}"/>>전라북도 축제일 검색</option>
					      <option value="se16"<c:out value="${scri.searchType eq 'se16' ? 'selected' : ''}"/>>광주광역시 축제일 검색</option>
					      <option value="se17"<c:out value="${scri.searchType eq 'se17' ? 'selected' : ''}"/>>제주특별자치도 축제일 검색</option>
					    </select>
					
					    <input type="date" name="keyword" id="keywordInput" value="${scri.keyword}"/>
					
					    <button id="searchBtn" type="button">검색</button>
					    <script>
					      $(function(){
					        $('#searchBtn').click(function() {
					          self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
					        });
					      });   
					    </script>
					</div>
					
					<div>
						<ul>
						    <c:if test="${pageMaker.prev}">
						    	<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
						    </c:if> 
						
						    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						    	<li><a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
						    </c:forEach>
						
						    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						    	<li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
						    </c:if> 
						</ul>
					</div>
					
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>