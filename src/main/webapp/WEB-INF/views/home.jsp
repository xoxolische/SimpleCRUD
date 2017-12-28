<%@include file="header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-offset-4 col-md-4">
				<div class="panel panel-default">
					<div class="panel-heading">jsGrid CRUD</div>
					<div class="panel-body">
						<a href="<c:url value="/jsgrid"/>" class="col-md-12 btn btn-primary">GO TO</a>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">Custom CRUD</div>
					<div class="panel-body">
						<a href="<c:url value="/custom"/>" class="col-md-12 btn btn-primary">GO TO</a>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>
