tasksController = function() {

	function errorLogger(errorCode, errorMessage) {
		console.log(errorCode +':'+ errorMessage);
	}
	
	function limpaCampoTask() {
		    $(taskPage).find('form').fromObject({});
		  }

	var taskPage;
	var initialised = false;   
	return {
		init : function(page) {
			if (!initialised) {
	
				taskPage = page;
				$(taskPage).find( '[required="required"]' ).prev('label').append( '<span>*</span>').children( 'span').addClass('required');
				
				$(taskPage).find('tbody tr:even').addClass( 'even');
				
				$(taskPage).find( '#btnAddTask' ).click( function(evt) {
					evt.preventDefault();
					$(taskPage ).find('#taskCreation' ).removeClass( 'not');
				});
				
				$('#tblTasks tbody').on('click',
					function(evt) {
						$(evt.target).closest( 'td').siblings( ).andSelf( ).toggleClass( 'rowHighlight');
				});
				
				$(taskPage).find('#clearTask').click(function(evt) {
					  evt.preventDefault();
					  limpaCampoTask();
				});

						
				initialised = true;
			}
    	}
		,		
		montarFooter : function(){/*Item 1 do exercício*/
			//Pega a quantidade de tarefas cadastradas, excluindo as já completadas
			var quantidadeTarefas = $("#tblTasks tbody tr").not(".taskCompleted").length;
	
			//Monta texto para quando existem tarefas e quano não existem tarefas cadastradas
			if(quantidadeTarefas > 0)
			{
				//Monta texto tarefa/tarefas
				var textoTarefas = " tarefa";
				if(quantidadeTarefas > 1)
					textoTarefas = " tarefas";
				
				//Insere texto no footer
				$("#taskCount").html("Você tem " + quantidadeTarefas + textoTarefas);
			}
			else
			{
				$("#taskCount").html("Nenhuma tarefa");
			}
		},
		destacarTask: function() {
		    $.each($(taskPage).find('#tblTasks tbody tr'), function(idx, row) {
		      var due = Date.parse($(row).find('[datetime]').text());
		
		      if(due.compareTo(Date.today()) < 0) {
			$(row).addClass("overdue");
		      } else if (due.compareTo((2).days().fromNow()) <= 0) {
			$(row).addClass("warning");
		      }
		    });
		  }
		
	
	}
}();