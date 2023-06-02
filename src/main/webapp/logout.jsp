<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<%
session = request.getSession();
session.setAttribute("userLogin", "false");
session.setAttribute("userrole", "");
request.setAttribute("thongbao", "");
session.setAttribute("username", "");
session.setAttribute("userid",null);
%>

<c:redirect url="index.jsp"></c:redirect>