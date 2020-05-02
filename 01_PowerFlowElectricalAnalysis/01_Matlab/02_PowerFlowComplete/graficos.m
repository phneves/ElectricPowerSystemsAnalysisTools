%	------------------------------------------------------------------------
%
%	graficos.m
%
%	Mostra gráficos
%
%	Última modificação: 22 ago 2001
%
%	------------------------------------------------------------------------

%	Plots

%	Evolução dos mimatches de potência
figure (1);
plot (iteracao,mismP,iteracao,mismQ);
ylabel('Máximos mismatches [pu] - valores absolutos');
xlabel('Iteração');
title('Evolução dos mismatches de potência');
legend('Mismatches P','Mismatches Q',0);
set(gca,'XTick',1:1:iter);

%	Perfil de tensões
figure (2);
plot (numext,v,'*-');
%bar (numext,v);
ylabel('Magnitude de tensão [pu]');
xlabel('Barra');
title('Perfil de tensão');
axis([ 1 nb 0 1.2 ]);
set(gca,'XTick',1:1:nb);

