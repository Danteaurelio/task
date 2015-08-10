package task

class Tarefa {
	
	String descricao
	Date finalizar
	Categoria categoria
	boolean completa
	
	
	
	
	
	static mapping = {
		categoria lazy:false
   }
   

    static constraints = {
		descricao(nullable: false)
		finalizar(nullable: false)
		categoria(nullable: false)
		completa(blank:true, default: Boolean.FALSE)
		
    }
}
