<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 현재 날짜 -->
<c:set var="now" value="<%=new java.util.Date()%>"/>
<c:set var="nowDate"><fmt:formatDate value="${now}" pattern="yyyyMMdd" /></c:set>

<%@include file="../includes/header.jsp"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board</h1>
	</div>
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<button id='listBtn' type="button" class="btn btn-xs pull-right">
					Board List</button>
				<button id='regBtn' type="button" class="btn btn-xs pull-right">Register
					New Board</button>
			</div>

			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead style="background-color: antiquewhite;">
						<tr>
							<th style="width: 5%;">번호</th>
							<th style="width: 10%;">제목</th>
							<th style="width: 10%;">작성자</th>
							<th style="width: 50%;">내용</th>
							<th>작성일</th>
							<th>수정일</th>
							<th style="width: 7%;">조회수</th>
						</tr>
					</thead>

					<c:forEach items="${list}" var="board">
						<c:set var="regDate"><fmt:formatDate value="${board.regDate}" pattern="yyyyMMdd" /></c:set>
						<c:set var="updateDate"><fmt:formatDate value="${board.updateDate}" pattern="yyyyMMdd" /></c:set>
						<tr>
							<td><c:out value="${board.bno}" /></td>
							<%-- <td><a href='/board/get?bno=<c:out value="${board.bno}"/>'><c:out value="${board.title}"/></a></td> --%>

							<td><a style="    color: burlywood; text-decoration: none;"
									href="get?pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}&bno=${board.bno}"/>
									<c:out value="${board.title}" />
							</a></td>

							<td><c:out value="${board.writer}" /></td>
							<td><c:out value="${board.content}" /></td>
							<c:choose>

								<c:when test="${nowDate > regDate}">
									<td><fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd" /></td>
								</c:when>
								<c:otherwise>
									<td><fmt:formatDate value="${board.regDate}" pattern="HH:mm:ss" /></td>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${nowDate > updateDate}">
									<td><fmt:formatDate value="${board.updateDate}" pattern="yyyy-MM-dd" /></td>
								</c:when>
								<c:otherwise>
									<td><fmt:formatDate value="${board.updateDate}" pattern="HH:mm:ss" /></td>
								</c:otherwise>
							</c:choose>
							<td><c:out value="${board.readCount}" /></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class='row' style="text-align: -webkit-center">
				<div class="col-lg-12">

					<form id='searchForm' action="/board/list" method='get'>
						<select name='type'>
							<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
							<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
							<option value="W"
									<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
							<option value="TC"
									<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목
								or 내용</option>
							<option value="TW"
									<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목
								or 작성자</option>
							<option value="TWC"
									<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목
								or 내용 or 작성자</option>
						</select> <input type='text' name='keyword'
										 value='<c:out value="${pageMaker.cri.keyword}"/>' /> <input
							type='hidden' name='pageNum'
							value='<c:out value="${pageMaker.cri.pageNum}"/>' /> <input
							type='hidden' name='amount'
							value='<c:out value="${pageMaker.cri.amount}"/>' />
						<button class='btn btn-default'>Search</button>
					</form>
				</div>
			</div>
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<c:if test="${pageMaker.prev}">
						<li class="page-item">
							<a class="page-link" aria-label="Previous" href="list?pageNum=${pageMaker.startPage -1}">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
					</c:if>

					<c:forEach var="num" begin="${pageMaker.startPage}"
							   end="${pageMaker.endPage}">
						<li class="page-item ${pageMaker.cri.pageNum == num ? "active":""}"><a class="page-link" href="list?pageNum=${num}">${num}</a></li>
					</c:forEach>

					<c:if test="${pageMaker.next}">
						<li class="page-item">
							<a class="page-link" href="list?pageNum=${pageMaker.endPage +1 }" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</c:if>
				</ul>
			</nav>

			<form id='actionForm' action="/board/list" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
				<input type='hidden' name='type'
					value='<c:out value="${ pageMaker.cri.type }"/>'> <input
					type='hidden' name='keyword'
					value='<c:out value="${ pageMaker.cri.keyword }"/>'>
			</form>


			<!-- Modal  추가 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-body">처리가 완료되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-bs-dismiss="modal">Close</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						let result = '<c:out value="${result}"/>';
						console.log('<c:out value="${pageMaker}"/>');
						checkModal(result);

						history.replaceState({}, null, null);

						function checkModal(result) {

							if (result === '' || history.state) {
								return;
							}

							if (parseInt(result) > 0) {
								$(".modal-body").html(
										"게시글 " + parseInt(result)
												+ " 번이 등록되었습니다.");
							}

							$("#myModal").modal("show");
						}

						$("#regBtn").on("click", function() {

							self.location = "/board/register";

						});

						$("#listBtn").on("click", function() {

							self.location = "/board/list";

						});

						let actionForm = $("#actionForm");

						$(".paginate_button a").on(
								"click",
								function(e) {

									e.preventDefault();

									console.log('click');

									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									actionForm.submit();
								});

						$(".move")
								.on(
										"click",
										function(e) {

											e.preventDefault();
											actionForm
													.append("<input type='hidden' name='bno' value='"
															+ $(this).attr(
																	"href")
															+ "'>");
											actionForm.attr("action",
													"/board/get");
											actionForm.submit();

										});

						let searchForm = $("#searchForm");

						$("#searchForm button").on(
								"click",
								function(e) {

									if (!searchForm.find("option:selected")
											.val()) {
										alert("검색종류를 선택하세요");
										return false;
									}

									if (!searchForm.find(
											"input[name='keyword']").val()) {
										alert("키워드를 입력하세요");
										return false;
									}

									searchForm.find("input[name='pageNum']")
											.val("1");
									e.preventDefault();

									searchForm.submit();

								});

					});
</script>






