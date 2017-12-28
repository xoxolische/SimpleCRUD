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
<body onload="getNotes();">
	<div class="container-fluid">
		<div class="col-md-6 col-md-offset-3">
			<div class="form-group col-md-12">
				<label for="text">Text:</label>
				<textarea class="form-control" rows="2" id="text"></textarea>
			</div>
			<button type="button" id="saveButton"
				class="col-md-12 btn btn-success" onclick="insertNew()">Insert</button>
			<div class="btn-group btn-group-justified" id="panelGroup">
				<div class="btn-group">
					<button type="button" class="btn btn-primary" onclick="update()">Save</button>
				</div>
				<div class="btn-group">
					<button type="button" class="btn btn-primary">Up</button>
				</div>
				<div class="btn-group">
					<button type="button" class="btn btn-primary">Down</button>
				</div>
				<div class="btn-group">
					<button type="button" class="btn btn-primary">Delete</button>
				</div>
			</div>
			<div id="holder" class="top-5 well col-md-12"></div>
		</div>
	</div>
	<input type="hidden" id="currentId">
	<script type="text/javascript"
		src="<c:url value="/resources/custom.js"/>">
		
	</script>
</body>
</html>
