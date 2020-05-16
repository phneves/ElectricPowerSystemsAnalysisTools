fprintf('> Comparação entre métodos\n')

%loadflowUncoupled
%loadflow

figure (1);
plot (pcalc_timeUncoupled(1:end,2) , pcalc_pathUncoupled(1:end,2) , '*-' );
ylabel('Pcalc');
xlabel('Tempo');
title('Evolução do calculo de potência');
%legend('Mismatches P','Mismatches Q',0);
%set(gca,'XTick',1:1:iter);

hold on
plot (pcalc_time(1:end,2) , pcalc_path(1:end,2) , 'o-' );

