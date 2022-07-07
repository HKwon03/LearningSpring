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
					      <option value="f"<c:out value="${scri.searchType eq 'f' ? 'selected' : ''}"/>>축제 이름</option>
					      <option value="s"<c:out value="${scri.searchType eq 's' ? 'selected' : ''}"/>>축제 시작일</option>
					      <option value="e"<c:out value="${scri.searchType eq 's' ? 'selected' : ''}"/>>축제 종료일</option>
					       <option value="se"<c:out value="${scri.searchType eq 's' ? 'selected' : ''}"/>>축제일</option>
					    </select>
					
					    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
					
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