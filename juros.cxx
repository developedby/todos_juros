// Versão 0.2:    04/2024: trocada avaliação soZero por acumulador == 0

#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstdbool>
#include <clocale>

// estrutura para simplificar as chamadas
struct Juros {
	short Quantidade;
	bool Composto;
	double Periodo;
	double *Pagamentos;
	double *Pesos;
};

// faz a liberação da memória dos arrays, quando quantidade não é vazia
void liberaMemoria(struct Juros *juros) {
	if(juros->Quantidade != 0) {
		free(juros->Pagamentos);
		free(juros->Pesos);
	}
}

// define a quantidade e reserva memória para os arrays
bool setQuantidade(struct Juros *juros, short quantidade) {
	if(quantidade < 0) return false;
	if(quantidade == juros->Quantidade) return true;
	juros->Pagamentos = (double *) malloc(sizeof(double) * quantidade);
	if(quantidade > 0 && juros->Pagamentos == NULL) { juros->Quantidade = 0; return false; }
	juros->Pesos = (double *) malloc(sizeof(double) * quantidade);
	if(quantidade > 0 && juros->Pesos == NULL) { juros->Quantidade = 0; return false; }
	juros->Quantidade = quantidade; return true;
}

// define os valores (menos arrays) da estrutura
bool setValores(struct Juros *juros, short quantidade, bool composto, double periodo) {
	if(!setQuantidade(juros, quantidade)) return false;
	juros->Composto = composto;
	juros->Periodo = periodo;
	return true;
}

// calcula a somatória de Pesos[]
double getPesoTotal(struct Juros *juros) {
	double acumulador = 0.0;
	short indice;
	for(indice = 0; indice < juros->Quantidade; indice++) acumulador += juros->Pesos[indice];
	return acumulador;
}

// calcula o acréscimo a partir dos juros e das parcelas
double jurosParaAcrescimo(struct Juros *juros, double valor) {
	if(valor <= 0 || juros->Quantidade <= 0 || juros->Periodo <= 0.0) return 0.0;
	double pesoTotal = getPesoTotal(juros);
	double acumulador = 0; // bool soZero = true;
	short indice;
	
	for(indice = 0; indice < juros->Quantidade; indice++) {
		// if(juros->Pagamentos[indice] > 0.0 && juros->Pesos[indice] > 0) soZero = false;
		if(juros->Composto) acumulador += juros->Pesos[indice] / pow(1 + valor / 100, juros->Pagamentos[indice] / juros->Periodo);
			else acumulador += juros->Pesos[indice] / (1 + valor / 100 * juros->Pagamentos[indice] / juros->Periodo);
	}
	
	// if(soZero) return 0.0;
	if( acumulador <= 0.0 ) return 0.0;
	return(pesoTotal / acumulador - 1) * 100;
}

// calcula os juros a partir do acréscimo e das parcelas
double acrescimoParaJuros(struct Juros *juros, double valor, short precisao, short maxIteracoes, double maxJuros) {
	double minJuros = 0, medJuros = 0, minDiferenca = 0, pesoTotal = 0;
	short indice = 0;
	if(maxIteracoes < 1 || juros->Quantidade <= 0 || precisao < 1 || valor <= 0 || juros->Periodo <= 0.0) return 0.0;
	pesoTotal = getPesoTotal(juros);
	if(pesoTotal <= 0) return 0.0;
	minDiferenca = pow(0.1, precisao);

	for(indice = 0; indice < maxIteracoes; indice++) {
		medJuros = (minJuros + maxJuros) / 2;
		if((maxJuros - minJuros) < minDiferenca) return medJuros;
		if(jurosParaAcrescimo(juros, medJuros) <= valor)
			minJuros = medJuros; else maxJuros = medJuros;
	}
	
	return medJuros;
}

int main() {
    // cria um objeto juros da estrutura Juros
	struct Juros juros;
	double pesoTotal = 0.0, acrescimoCalculado = 0.0, jurosCalculado = 0.0;

	setlocale( LC_ALL, "");	

    // define os valores simples
	if(!setValores(&juros, 3, true, 30.0)) {
		printf("Erro ao definir os valores da estrutura juros!");
		return -1;
	}

	// define os valores em arrays
    for (int indice = 0; indice < juros.Quantidade; indice++) {
        juros.Pagamentos[indice] = (indice + 1.0) * 30.0;
        juros.Pesos[indice] = 1.0;
    }

	// calcula e guarda os retornos dos métodos
    pesoTotal = getPesoTotal(&juros);
    acrescimoCalculado = jurosParaAcrescimo(&juros, 3);
    jurosCalculado = acrescimoParaJuros(&juros, acrescimoCalculado, 15, 100, 50.0);

	// imprime os resultados
	printf("Peso total: %3.15f\n", pesoTotal);
	printf("Acréscimo calculado: %3.15f\n", acrescimoCalculado);
	printf("Juros calculado: %3.15f\n", jurosCalculado);

	liberaMemoria(&juros);
	
	return 0;
}