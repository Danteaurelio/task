
<%@ page import="task.Tarefa" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tarefa.label', default: 'Tarefa')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<g:link controller="categoria" action="create"> Criar Categoria</g:link>
	</head>
	<body>
	<main id="taskPage">
		<div id="list-tarefa" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<section id="taskCreation">
			
			
			</section>
						
			<table id="tblTasks">
			            <colgroup>
							<col width="40%">
							<col width="15%">
							<col width="15%">
							<col width="30%">
						</colgroup>
		       <thead>		               
					<tr>
						<th>Nome</th>
						<th>Deadline</th>
						<th>Categoria</th>
						<th>Ações</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${tarefas}" status="i" var="tarefaInstance">
				   	<g:if test="${tarefaInstance.completa}">
						<tr class="taskCompleted" >
					</g:if>
					<g:else>
					    <tr>
					</g:else>						
					
						<td>${fieldValue(bean: tarefaInstance, field: "descricao")}</td>
					    <td><time datetime="${tarefaInstance.finalizar.format('yyyy-MM-dd')}">${tarefaInstance.finalizar.format('yyyy-MM-dd')}</time></td>
						<td>${fieldValue(bean: tarefaInstance, field: "categoria")}</td>
						<td>
							<nav>
								<g:if test="${!tarefaInstance.completa}">
									<g:remoteLink action="edit" id="${tarefaInstance.id}" class="editRow" update="taskCreation">
				   						 Editar
									</g:remoteLink>
									<g:remoteLink controller="tarefa" action="completar" id="${tarefaInstance.id}" class="completeRow" update="tblTasks, taskCount">
				   						 Completar
									</g:remoteLink>
								</g:if>
									<g:remoteLink controller="tarefa" action="delete" id="${tarefaInstance.id}" class="deleteRow" update="tblTasks, taskCount">
				   						 Deletar
									</g:remoteLink>
							</nav>
						</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<nav>
				<g:remoteLink controller="tarefa" action="create" update="taskCreation">
				    Adicionar tarefa
				</g:remoteLink>
			</nav>
		</div>
		</main>	
		
		<footer><span id="taskCount"> </span></footer>
		
		
	
	</body>
	
	
</html>
