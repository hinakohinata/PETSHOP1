<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<%@include file="include/head.jsp"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
	<div class="container">
		<div class="row">
			<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
  Launch demo modal
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
















			<form action="EmailSendingServlet" method="post">
				<table border="0" width="35%" align="center">
					<caption>
						<h2>Send New E-mail</h2>
					</caption>
					<tr>
						<td width="50%">Recipient address</td>
						<td><input type="text" name="recipient" size="50" /></td>
					</tr>
					<tr>
						<td>Subject</td>
						<td><input type="text" name="subject" size="50" /></td>
					</tr>
					<tr>
						<td>Content</td>
						<td><textarea rows="10" cols="39" name="content"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit"
							value="Send" /></td>
					</tr>
				</table>

			</form>

		</div>
	</div>
</body>
</html>