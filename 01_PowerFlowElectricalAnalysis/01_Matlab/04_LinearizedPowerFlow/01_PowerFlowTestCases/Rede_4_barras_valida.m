%	Dados da rede

nome_da_rede = 'Rede de 4 barras e 4 ramos - Demostração';

baseMVA      = 100 ; % MVA
Vbase = 132; %kV

%	Dados das barras
%
%	Número - Tipo - V - Ângulo - Pg - Qg - Pc - Qc - bshk
%
%	Dados em pu e em graus
%	3 - slack ; 2 - PV ; 0 - PQ
barras = [  1   3   1.000   0.00   000.00   000.00  050.00  030.99  0.00
            2   0   0.000   1.00   000.00   000.00  170.00  105.35  0.00
            3   0   0.000   1.00   000.00   000.00  200.00  123.94  0.00
            4   2   1.020   1.00   318.00   000.00  080.00  049.58  0.00
        ];

%	Dados dos ramos
%
%	De - Para - r - x - bshl - tap - fi
%
%	Dados em pu e em graus
%	bsh - carregamento total
%	modelo do transformador:  | tap:1 - x |

ramos  = [
       1   2   0.01008   0.05040   0.00   1.00 0.00
       1   3   0.00744   0.03720   0.00   1.00 0.00
       2   4   0.00744   0.03720   0.00   1.00 0.00
       3   4   0.01272   0.06360   0.00   1.00 0.00
       ];


