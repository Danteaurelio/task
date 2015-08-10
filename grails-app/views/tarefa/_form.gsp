<%@ page import="task.Tarefa" %>


<g:hiddenField name="completa" value="${tarefaInstance?.completa}" />
<div class="fieldcontain ${hasErrors(bean: tarefaInstance, field: 'descricao', 'error')} required">
	<label for="descricao">
		<g:message code="tarefa.descricao.label" default="Descricao" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descricao" required="" value="${tarefaInstance?.descricao}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tarefaInstance, field: 'finalizar', 'error')} required">
	<label for="finalizar">
		<g:message code="tarefa.finalizar.label" default="Finalizar" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="finalizar" precision="day"  value="${tarefaInstance?.finalizar}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: tarefaInstance, field: 'categoria', 'error')} required">
	<label for="categoria">
		<g:message code="tarefa.categoria.label" default="Categoria" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="categoria" name="categoria.id" from="${task.Categoria.list()}" optionKey="id" required="" value="${tarefaInstance?.categoria?.id}" class="many-to-one"/>

</div>

