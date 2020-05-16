%	Dados da rede

nome_da_rede = 'Rede de 3 barras e 2 ramos - Demostração';

baseMVA      = 100 ; % MVA
Vbase = 132; %kV

%	Dados das barras
%
%	Número - Tipo - V - Ângulo - Pg - Qg - Pc - Qc - bshk
%
%	Dados em pu e em graus
%	3 - slack ; 2 - PV ; 0 - PQ
barras = [  1   0   1.000   0.00   000.00  -015.00  005.00  000.0  5.00
            2   3   1.010   1.00   000.00   000.00  100.00  000.0  0.00
            3   2   1.015   1.00   000.00   000.20  000.00  000.0  0.00
        ];

%	Dados dos ramos
%
%	De - Para - r - x - bshl - tap - fi
%
%	Dados em pu e em graus
%	bsh - carregamento total
%	modelo do transformador:  | tap:1 - x |

ramos  = [
       1   2   0.03   0.3   0.02   1.00 0.00
       2   3   0.05   0.8   0.01   1.00 0.00      
       ];


