<%
    if ((session.getAttribute("userName") == null) || (session.getAttribute("userName") == "")) {
%>
You are not logged in<br/>
<a href="index.jsp">Please Login</a>
<%} else {
%>
<h1> Welcome FROM ANIKET ASHA </h1> <%=session.getAttribute("userName")%>
<a href='logout.jsp'>Log out</a>
<%
    }
%>
