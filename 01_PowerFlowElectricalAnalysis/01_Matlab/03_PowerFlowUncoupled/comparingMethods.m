clc
clear
fprintf('> Comparação entre métodos\n')

tol	=	0.0001;

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
IEEE14


loadflow

toc;
tic;

loadflowUncoupled
%loadflowUncoupledFast


[SizeOfRows , SizeOfColumns] = size(pcalc_pathUncoupled)
n = 1;
GraphIndex = 1;
while n <= SizeOfColumns 
    figure (n);
    %plot (pcalc_timeUncoupled(1:end,n) , pcalc_pathUncoupled(1:end,2) , '*-' );
    plot (qcalc_pathUncoupled(1:end,n) , pcalc_pathUncoupled(1:end,n) , '*-', 'LineWidth',2 );
    ylabel('Pcalc');
    xlabel('Qcalc');
    title(sprintf('Evolução do calculo de potência - %.0f',qcalc_kUncoupled(1,GraphIndex)));
    %legend('Mismatches P','Mismatches Q',0);
    %set(gca,'XTick',1:1:iter);

    hold on
    plot (qcalc_path(1:end,n) , pcalc_path(1:end,n) , 'o-','LineWidth',2 );

    hold on
    plot(qesp(n),pesp(n),'g*')
    
        
    legend('Desacoplado','Newton', 'Solução método analítico')
    
    hold off
    
    GraphIndex = GraphIndex  + 1;
    n=n+1;
end


%figure (2);

%plot (qcalc_timeUncoupled(1:end,2) , qcalc_pathUncoupled(1:end,2) , '*-' );
%ylabel('Qcalc');
%xlabel('Tempo');
%title('Evolução do calculo de potência Q');
%legend('Mismatches P','Mismatches Q',0);
%set(gca,'XTick',1:1:iter);

%hold on
%plot (qcalc_time(1:end,2) , qcalc_path(1:end,2) , 'o-' );
