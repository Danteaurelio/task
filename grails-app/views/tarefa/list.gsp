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
									<g:remoteLink controller="tarefa" action="completar" id="${tarefaInstance.id}" class="completeRow" update="tblTasks">
				   						 Completar
									</g:remoteLink>
								</g:if>
									<g:remoteLink controller="tarefa" action="delete" id="${tarefaInstance.id}" class="deleteRow" update="tblTasks">
				   						 Deletar
									</g:remoteLink>
							</nav>
						</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<script>
				$(document).ready(function() {
					tasksController.destacarTask();
					tasksController.montarFooter();
				});
			</script>