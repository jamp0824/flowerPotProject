<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form action="">
	<table class="table table-striped table-sm">

		<thead>
			<tr>
				<th>#</th>
				<th>제목</th>
				<th>등록일</th>
			</tr>
		</thead>

		<tbody>

			<c:if test="${!empty EnqList }">
				<c:forEach var="EnqList" items="${EnqList }">
					<tr>
						<td>${EnqList.ccno }</td>
						<td><a
							href="${pageContext.request.contextPath }/customerCenter/enquiry/content?ccno=${EnqList.ccno }">${EnqList.title }</a></td>
						<td>${EnqList.regdate}</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty EnqList }">
				<tr>
					<th colspan="3">게시물이 존재하지 않습니다.</th>
				</tr>
			</c:if>
		</tbody>

	</table>
	<button>
		<a href="enquiry/write">글쓰기</a>
	</button>
</form>