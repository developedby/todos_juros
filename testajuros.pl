# pragmas
use strict;
use warnings;
use Juros;

# os arrays para serem referenciados pelos atributos 
my @Pagamentos;
my @Pesos;

for(my $indice = 0; $indice < 3; $indice++) {
	@Pagamentos[$indice] = ($indice + 1) * 30.0;
	@Pesos[$indice] = 1.0;
}

# cria o objeto $juros com os valores (o número 1 quer dizer TRUE)
my $juros = Juros->new( 3, 1, 30.0, \@Pagamentos, \@Pesos);

# testes de impressão
print "Peso Total = " . $juros->getPesoTotal() . "\n";
print "Juros = " . $juros->jurosParaAcrescimo( 3.0) . "\n";
print "Acrescimo = " . $juros->acrescimoParaJuros($juros->jurosParaAcrescimo( 3.0), 15, 100, 50.0) . "\n";

#print $juros->{Quantidade} . "\n";
#print $juros->{Composto} . "\n";
#print $juros->{Periodo} . "\n";
#
#for(my $indice = 0; $indice < 3; $indice++) {
#	print $juros->{Pagamentos}[$indice] . "\n";
#	print $juros->{Pesos}[$indice] . "\n";
#}
