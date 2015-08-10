package task

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Categoria)
class CategoriaSpec extends Specification {

	def setup() {
	}

	def cleanup() {
	}

	void "Salvar e obter Categoria do banco"() {
		when:
		def categoria = new Categoria(descricao: 'Categoria 1')

		then:
		categoria.save() != null
		categoria.id != null

		when:
		def foundCategoria = Categoria.get(categoria.id)

		then:
		'Categoria 1' == foundCategoria.descricao
	}

	void "Salvar e atualizar Categoria do banco"() {
		when:
		def categoria = new Categoria(descricao: 'Categoria 1')

		then:
		categoria.save() != null

		when:
		def foundCategoria = Categoria.get(categoria.id)
		foundCategoria.descricao = 'Nova Categoria'
		foundCategoria.save()
		def editedCategoria = Categoria.get(categoria.id)

		then:
		'Nova Categoria' == editedCategoria.descricao
	}


	void "Salvar e apagar Categoria do banco"() {
		when:
		def categoria = new Categoria(descricao: 'Categoria 1')

		then:
		categoria.save() != null

		when:
		def foundCategoria = Categoria.get(categoria.id)
		foundCategoria.delete(flush: true)

		then:
		!(Categoria.exists(foundCategoria.id))
	}
	
	void "Validar Categoria com descrição única"() {
		when:
		def categoria = new Categoria(descricao: 'Categoria 1')

		then:
		categoria.save(flush: true) != null

		when:
		def categoriaNova = new Categoria(descricao: 'Categoria 1')
		
		then:
    	!categoriaNova.validate()
    			
	}
	
	
}
