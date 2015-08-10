<!DOCTYPE html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
  		<asset:stylesheet src="tasks.css"/>
  		
		<asset:javascript src="application.js"/>
		<asset:javascript src="jquery-2.1.4.js"/>
		<asset:javascript src="date.js"/>
		<asset:javascript src="tasks-controller.js"/>

		
		<g:layoutHead/>
</head>
	<body>	

			<g:layoutBody/>	
	</body>
	<script>
		$(document).ready(function() {
			tasksController.init($('#taskPage'));
			tasksController.destacarTask();
			tasksController.montarFooter();
			
		});

	</script>

</html>
