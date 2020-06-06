%%  Initial comments. loadflow.m
%   
%   Author: Pedro Henrique Neves dos Santos (pneves) 
%   License: MIT License 
%
%   Last modification: 02/05/2020
%%
%pneves: Clear screen and all variables from workspace
clear all;
clc;

%%
%pneves: Start time tracking 
tic; % iniciando contagem de tempo computacional

fprintf('\n')
fprintf('> ---------------------------------\n')
fprintf('> Loadflow                         \n')
fprintf('> Fluxo de carga - Linearizado     \n')
fprintf('> Pedro Henrique Neves dos Santos  \n')
fprintf('> pneves                           \n')
fprintf('> ---------------------------------\n')
fprintf('\n')
fprintf('> Carregando dados da simulação ...\n')

%%
%pneves: Some script configs

%tol		=	0.001; 
%tol	=	0.00001;

%addpath('/01_PowerFlowTestCases/');

%   Arquivo de dados da rede
%P2GTD
%RedePequena
%RedePequena2
%Twobus
%Fivebus
%IEEE14
%rede_4barras
%rede_6barras
%ieee118_marina;
%syst118_noparallel;
%Sixbus_critico;
%ieee34_radial;
%IEEE14
Rede_4_barras_valida

%fprintf('\n> %s\n', nome_da_rede); 


%	Mostrar graficos ao final do cálculo
%graf		=	'nao';

%	Número máximo de iterações permitido
%itmax		=	100;

%	Tensões mínima e máxima permitidas
%vmin = 0.0;
%vmax = 2.0;

%	Considerar cargas dependentes da tensão
%	Caso 'nao' -> modelo de potência constante
%	Caso 'sim' -> considerar modelos especificados pelo vetor ModeloCarga
%cargasV		=	'nao';

%	Conversão graus <-> radianos
graus_to_rad = pi/180;
rad_to_graus = 180/pi;

%pneves: Enable debug prints.
%pneves: Better to use breakpoints instead. Used here to didatic purposes
%Debug = false;
Debug = true;


%%
%	Determinacao do tamanho da rede
fprintf('\n> Processando dados da rede ...\n')

%pneves: nb and nr are varibles of interest.
%pneves: variable colunas won't be used. 
[nb , colunas] = size(barras);
[nr , colunas] = size(ramos);

%%
%	Carregamento dos vetores de barra

%pneves: extracting bar values into arrays
%pneves: for 1 through nb (Número de barras) 
%Número - Tipo - V - Ângulo - Pg - Qg - Pc - Qc - bshk
for k = 1:nb
    numext(k)   = barras(k,1);                  
    tipo(k)     = barras(k,2);                  
    v(k)        = barras(k,3);                  
    ang(k)      = barras(k,4) * graus_to_rad;   
    pg(k)       = barras(k,5)/baseMVA;        
    qg(k)       = barras(k,6)/baseMVA;
    pc(k)       = barras(k,7)/baseMVA;
    qc(k)       = barras(k,8)/baseMVA;
    bshk(k)     = barras(k,9)/baseMVA;

    pnom(k,1)     = pg(k) - pc(k);
    qnom(k)     = qg(k) - qc(k);

    numint(barras(k,1)) = k;
    
end

%	Carregamento dos vetores de ramo
for l = 1:nr
	de(l)   = ramos(l,1);
	para(l) = ramos(l,2);
	r(l)    = ramos(l,3);
	x(l)    = ramos(l,4);
	bshl(l) = ramos(l,5)/2.;
	tap(l)  = ramos(l,6);
	fi(l)   = 0; %- ramos(l,7) * graus_to_rad;
    
%     if tap(l) == 0
%        tap(l) = 1.0;
%     end
end

fprintf('\n> Modelo de carga: potência constante (default).\n')

%%
%	Montar matriz admitância nodal
%	-> transformadores defasadores não são considerados aqui

fprintf('\n> Executando cálculo de fluxo de carga ...\n')

%pneves: prealocating matrix with zeros
Y = zeros(nb,nb);

if (Debug == true) 
    fprintf('\n> DEBUG - Y with zeros\n'); 
    Y
    fprintf('\n> DEBUG  Y with bshk\n');
end

for k = 1:nb
	Y(k,k) = i*bshk(k); 

    if (Debug == true) 
        Y
    end
end

if (Debug == true) 
    fprintf('DEBUG> Y complete\n');
end

for l = 1:nr
    k = de(l)
    m = para(l)
    %x(l)
    %y(l) = 1/(i*x(l))
    y(l) = 1/(-i*x(l)) 

    
    Y(k,k) = Y(k,k) + y(l)
    Y(m,m) = Y(m,m) + y(l)
    Y(k,m) = Y(k,m) - y(l)
    Y(m,k) = Y(m,k) - y(l)
    if (Debug == true) 
        Y
    end
end

G = real(Y);
B = imag(Y);

if (Debug == true) 
    fprintf('DEBUG> Y, G and B complete\n');
    Y
    G
    B
end
%%
% Montando a matriz B'

Blinha = B;
P=pnom;
for k = 1:nb
    if tipo(k) == 3
        %pneves: retira a linha da barra slack
        Blinha(k,:) = []
        
        %pneves: retira a coluna da barra slack
        Blinha(:,k) = []
        
        %pneves: retira a linha da barra slack
        P(k,:) = []
    end
end

%%
%pneves: Calculando a matriz Teta

Theta = inv(Blinha)*P

%pneves: Adicionando a barra de referência na matriz Theta
IndexTheta=1;
for k = 1:nb
    
    if tipo(k) == 3
        ThetaWithReferenceBar(k,1) = 0;
    else
        ThetaWithReferenceBar(k,1) = Theta(IndexTheta,1);
        IndexTheta = IndexTheta + 1;
    end

end

%pneves: Convertendo de radianos para graus
ThetaGraus=Theta*rad_to_graus

%%
%'Fim do cálculo de fluxo de carga. Preparando relatório de saída ...');
 
fprintf('\n> Fim do cálculo de fluxo de carga. Preparando relatório de saída ...\n')

for l = 1:nr
    k = de(l);
    m = para(l);
    
    pkm(l) = (ThetaWithReferenceBar(k)- ThetaWithReferenceBar(m))/x(l);
end

 
%	Relatório final

fprintf('\n\n> Relatório final\n\n')
fprintf('> Rede: %s\n',nome_da_rede)
fprintf('\n> Fluxos de potência\n\n')
fprintf('     De Para       Pkm \n')

for l = 1:nr
	fprintf('%7d %4d %9.4f \n',de(l),para(l),pkm(l))
end




