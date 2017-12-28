$("#panelGroup").hide();

function getNotes() {
	$.ajax({
		url : '/crud/notes/getAll',
		dataType : 'json'
	}).done(function(data) {
		console.log(data);
		appendAll(data);
	}).fail(function() {
		return null;
	});
}

function insertNew() {
	var value = $("#text").val();

	if (value != null && value != "") {
		var item = {
			message : value
		};
		$.ajax({
			method : "POST",
			url : '/crud/notes/create',
			data : JSON.stringify(item),
			contentType : "application/json; charset=utf-8"
		}).done(function(data) {
			console.log(data);
			$('#holder').prepend(splitObj(data));
			$("#text").val("");
		}).fail(function() {
			return null;
		});
	} else {
		alert("Text field is empty!");
	}
}

function update() {
	var value = $("#text").val();
	var id = $("#currentId").val()
	if (value != null && value != "" && id != null && id != "") {
		var item = {
			id : id,
			message : value
		}
		return $.ajax({
			headers : {
				'Accept' : 'application/json',
				'Content-Type' : 'application/json'
			},
			method : "PUT",
			url : "/crud/notes/update",
			data : JSON.stringify(item),
			dataType : 'json'
		}).done(function(data) {
			console.log("success!")
			$("#" + data.id).replaceWith(splitObj(data));
			$("#text").val("");
			$("#saveButton").prop("disabled", false);
			$("#panelGroup").hide();
		}).fail(function() {
			console.log("oh no... Failed to update!")
		});
	}
}

function deleteItem() {
	var id = $("#currentId").val();
	var $next = $("#" + id).next(".h");
	if (id != null && id != "") {
		$.ajax({
			method : "DELETE",
			url : '/crud/notes/delete/' + id,
		}).done(function() {
			$("#" + id).hide();
			if ($next.is(":visible") && $next.attr("id") != null) {
				$next.click();
			} else {
				$("#text").val("");
				$("#saveButton").prop("disabled", false);
				$("#panelGroup").hide();
			}

		}).fail(function() {
			alert("Got error while deleting item!");
		});
	}
}

function appendAll(data) {
	for (var i = 0; i < data.length; i++) {
		$('#holder').prepend(splitObj(data[i]));
	}
}

function splitObj(obj) {
	var $panel = $("<div>").attr("class", "panel panel-default h").attr("id",
			obj.id).attr("m", obj.message);
	var $panelBody = $("<div>").attr("class", "panel-body");

	var $message = $("<p>").append("Message: " + obj.message);
	var $createDate = $("<p>").append(
			"Created At: " + prepareDateTime(obj.createDate));
	var $lastEditedAt = $("<p>").append(
			"Edited At: " + prepareDateTime(obj.lastEditedAt));
	var $div = $("<div>").append($message).append($createDate).append(
			$lastEditedAt);

	$($panelBody).append($div);
	$($panel).append($panelBody).click(function() {
		$("#text").val($(this).closest(".h").attr("m"));
		$("#currentId").val($(this).closest(".h").attr("id"));
		$("#saveButton").prop("disabled", true);
		$("#panelGroup").show();
	});
	return $panel;
}

function prepareDateTime(date) {
	var date = new Date(date);
	return moment(date).format('DD-MM-YYYY HH:mm:ss');
}

function down() {
	var id = $("#currentId").val();
	var $upper = $("#" + id);
	var $lower = $("#" + id).next(".h");	
	if($lower.is(":visible")){
		$lower.swap($upper);		
	}else{
		$("#text").val("");
		$("#saveButton").prop("disabled", false);
		$("#panelGroup").hide();
	}
}

function up() {
	var id = $("#currentId").val();
	var $upper = $("#" + id);
	var $lower = $("#" + id).prev(".h");	
	if($lower.is(":visible")){
		$lower.swap($upper);		
	}else{
		$("#text").val("");
		$("#saveButton").prop("disabled", false);
		$("#panelGroup").hide();
	}
}

jQuery.fn.swap = function(b) {
	b = jQuery(b)[0];
	var a = this[0],
	    a2 = a.cloneNode(true),
	    b2 = b.cloneNode(true),
	    stack = this;
	
	a.parentNode.replaceChild(b2, a);
	b.parentNode.replaceChild(a2, b);
	
	stack[0] = a2;
	return this.pushStack( stack );
};
