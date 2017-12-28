<%@include file="header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Custom</title>
</head>
<body>
	<div class="container-fluid">
		<div id="jsGrid"></div>
	</div>

	<script>
		var o = null;
		$("#jsGrid")
				.jsGrid(
						{
							width : "100%",
							//height : "400px",

							filtering : false,
							inserting : true,
							editing : true,
							sorting : true,
							paging : true,
							pageSize : 10,
							pageButtonCount : 5,
							autoload : true,

							controller : {
								loadData : function() {
									var deferred = $.Deferred();
									$.ajax({
										url : '/crud/notes/getAll',
										dataType : 'json'
									}).done(function(data) {
										deferred.resolve(data);
									}).fail(function() {
										deferred.reject("loading error");
									});
									return deferred.promise();
								},
								insertItem : function(item) {
									var deferred = $.Deferred();

									return $
											.ajax(
													{
														method : "POST",
														url : '/crud/notes/create',
														data : JSON
																.stringify(item),
														contentType : "application/json; charset=utf-8"
													})
											.done(function() {
												deferred.resolve(item);
											})
											.fail(
													function() {
														deferred
																.reject("loading error");
													});
									return deferred.promise();
								},
								deleteItem : function(item) {
									return $.ajax({
										method : "DELETE",
										url : '/crud/notes/delete/' + item.id,
									}).fail(function() {

									});
								},
								updateItem : function(item) {
									var deferred = $.Deferred();
									return $.ajax({
										headers : {
											'Accept' : 'application/json',
											'Content-Type' : 'application/json'
										},
										method : "PUT",
										url : "/crud/notes/update",
										data : JSON.stringify(item),
										dataType : 'json'
									}).done(function() {
										deferred.resolve(item);
									}).fail(function() {
										deferred.reject("loading error");
									});
									return deferred.promise();
								}
							},
							fields : [
									{
										name : "message",
										title : "Message",
										type : "text",
										validate : "required",
										editing : true,
										width : "45%"
									},
									{
										name : "createDate",
										title : "Create Date",
										type : "text",
										editing : false,
										inserting : false,
										width : "20%",
										itemTemplate : function(value, item) {
											var $result = jsGrid.fields.control.prototype.itemTemplate
													.apply(this, arguments);

											if (item.createDate == null) {
												return $("<div>").append("");
											}
											var date = new Date(item.createDate);
											return $("<div>")
													.append(
															moment(date)
																	.format(
																			'DD-MM-YYYY HH:mm:ss'));
										}
									},
									{
										name : "lastEditedAt",
										title : "Edited At",
										editing : false,
										inserting : false,
										width : "20%",
										itemTemplate : function(value, item) {
											var $result = jsGrid.fields.control.prototype.itemTemplate
													.apply(this, arguments);

											if (item.lastEditedAt == null) {
												return $("<div>").append("");
											}
											var date = new Date(
													item.lastEditedAt);
											return $("<div>")
													.append(
															moment(date)
																	.format(
																			'DD-MM-YYYY HH:mm:ss'));
										}
									}, {
										type : "control",
										editButton : true,
										deleteButton : true,
										modeSwitchButton : false,
										clearFilterButton : false,
										width : "15%"
									} ]
						});
	</script>
</body>
</html>
