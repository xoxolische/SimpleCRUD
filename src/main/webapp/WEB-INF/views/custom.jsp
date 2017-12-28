<%@include file="header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<style>
.top-5 {
	margin-top: 5px;
}
</style>
<head>
<title>Custom</title>
</head>
<body>
	<div class="container-fluid">
		<div class="col-md-6 col-md-offset-3">
			<div class="form-group col-md-12">
				<label for="text">Text:</label>
				<textarea class="form-control" rows="2" id="text"></textarea>
			</div>
			<button type="button" class="col-md-12 btn btn-success">Save</button>
			<div class="top-5 well col-md-12">Basic Well</div>
		</div>
	</div>
</body>
</html>
