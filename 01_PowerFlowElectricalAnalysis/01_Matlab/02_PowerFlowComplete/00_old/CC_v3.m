%	------------------------------------------------------------------------
%
%	loadflow.m
%
%	Cálculo de fluxo de carga pelo método de Newton
%
%	Última modificação: 16 mai 2002
%
%	------------------------------------------------------------------------

%clc
clear all

%	Condições da simulação

Rede_5_barras;

%	Verificar software

fprintf('\n> Processando dados da rede ...\n')

[nb , colunas] = size(geradores);
[nr , colunas] = size(ramos);

%	Carregamento dos vetores dos geradores

for l = 1:nb
	busg(l)   = geradores(l,1);
	rgp(l)    = 0;
	xgp(l)    = geradores(l,3);
    rgo(l)    = 0;
	xgo(l)    = geradores(l,5);
	
end

%	Carregamento dos vetores de ramo

for l = 1:nr
	de(l)   = ramos(l,1);
	para(l) = ramos(l,2);
	rp(l)    = 0;
	xp(l)    = ramos(l,4);
    ro(l)    = 0;
	xo(l)    = ramos(l,6);
	
end

%	Montar matriz admitância nodal
%	-> transformadores defasadores não são considerados aqui


Yp = zeros(nb,nb);
Yo = zeros(nb,nb);

for l = 1:nb

        k = busg(l);
        
        if xgp(l) ~= 0
        y(l) = 1/(rgp(l) + i*xgp(l));
        Yp(k,k) = Yp(k,k) + y(l);
        end
        
        if xgo(l) ~= 0
        y(l) = 1/(rgo(l) + i*xgo(l));
        Yo(k,k) = Yo(k,k) + y(l);
        end
end

for l = 1:nr

        k = de(l);
        m = para(l);

        y(l) = 1/(rp(l) + i*xp(l));

        Yp(k,k) = Yp(k,k) + y(l);
        Yp(m,m) = Yp(m,m) + y(l);
        Yp(k,m) = Yp(k,m) - y(l);
        Yp(m,k) = Yp(m,k) - y(l);
end


for l = 1:nr

        k = de(l);
        m = para(l);

        y(l) = 1/(ro(l) + i*xo(l));

        Yo(k,k) = Yo(k,k) + y(l);
        Yo(m,m) = Yo(m,m) + y(l);
        Yo(k,m) = Yo(k,m) - y(l);
        Yo(m,k) = Yo(m,k) - y(l);
end

Zp = inv(Yp);
Zo = inv(Yo);


%	Correntes de sequencia na barra sob curto

if TipoCC == 3
    for k = 1:nb
        ip(k) = 100/Zp(k,k);
        in(k) = 0;
        io(k) = 0;
    end
elseif TipoCC == 2
    for k = 1:nb
        ip(k) = 100/2*Zp(k,k);
        in(k) = - ip(k);
        io(k) = 0;
    end
elseif  TipoCC == 1
    for k = 1:nb
        ip(k) = 100/(2*Zp(k,k)+Zo(k,k));
        in(k) = ip(k);
        io(k) = ip(k);
    end
end

ip
in
io

% Tensões de sequencia para todas as barras V = Z I

% Fluxos de corrente de sequencia para todos os ramos

% Conversão para componentes de fase para as grandezas pedidas
