note
	description: "Classe raiz da aplica��o de testes"
	author: "Ricardo Erick Reb�lo"
	date: "$Date$"
	revision: "$Revision$"

class APPLICATION

inherit ARGUMENTS_32

create make

feature {NONE}
	make
	local
		juros: JUROS
		pesoTotal, acrescimoCalculado, jurosCalculado: REAL_64
	do  -- cria objeto com os valores iniciais
		juros := create {JUROS}.make(3, true, 30.0, <<30.0, 60.0, 90.0>>, <<1.0, 1.0, 1.0>>)

		-- testa as fun��es
		pesoTotal := juros.getPesoTotal
		acrescimoCalculado := juros.jurosParaAcrescimo(3.0)
		jurosCalculado := juros.acrescimoParaJuros(acrescimoCalculado, 15, 100, 50.0)
		print("%NPeso total = ")
		print(pesoTotal)
		print("%NAcrescimo = ")
		print(acrescimoCalculado)
		print("%NJuros = ")
		print(jurosCalculado)
		print("%N")
	end
end
