%	------------------------------------------------------------------------
%
%	simulacao.m
%
%	Definição das condições da simulação
%
%	Última modificação: 18 jul 2002
%
%	------------------------------------------------------------------------



%	Software utilizado (matlab/octave)
%software	=	'matlab';
%software	=	'octave';

%	Tolerância de convergência em pu

%tol		=	0.000000000001;
%tol		=	0.00001;

%	Arquivo de dados da rede

P2GTD
%Twobus
%Fivebus
%IEEE14
%rede_4barras
%rede_6barras
%ieee118_marina;
%syst118_noparallel;
%Sixbus_critico;
%ieee34_radial;

%	Mostrar graficos ao final do cálculo

graf		=	'nao';

%	Número máximo de iterações permitido

itmax		=	20;

%	Tensões mínima e máxima permitidas

vmin = 0.0;
vmax = 2.0;

%	Considerar cargas dependentes da tensão
%	Caso 'nao' -> modelo de potência constante
%	Caso 'sim' -> considerar modelos especificados pelo vetor ModeloCarga

cargasV		=	'nao';

%	Conversão graus <-> radianos

graus_to_rad = pi/180;
rad_to_graus = 180/pi;

%	------------------------------------------------------------------------
