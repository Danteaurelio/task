package task

class Categoria {
	
	String descricao

    static constraints = {
		descricao(nullable: false, unique: true)
    }

	@Override
	public String toString() {
		return  descricao;
	}	
	
}
