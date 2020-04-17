%	Dados da rede

nome_da_rede = 'Rede de 5 barras e 7 ramos - Material do Castro';

baseMVA      = 100 ; % MVA
Vbase = 132; %kV

%	Dados das barras
%
%	Número - Tipo - V - Ângulo - Pg - Qg - Pc - Qc - bshk
%
%	Dados em pu e em graus
%	3 - slack ; 2 - PV ; 0 - PQ
barras = [% 1   0   1.000   0.00   000.00   000.00  200.00  100.0  60.0
           1   0   1.000   0.00   000.00   000.00  200.00  100.0  0.00
           2   2   1.010   0.00   400.00   000.00  100.00  050.0  0.00
           %3   3   1.015   0.00   000.00   000.00  000.00  000.0  0.00
           3   3   1.015   5.00   000.00   000.00  000.00  000.0  0.00
];

%	Dados dos ramos
%
%	De - Para - r - x - bshl - tap - fi
%
%	Dados em pu e em graus
%	bsh - carregamento total
%	modelo do transformador:  | tap:1 - x |

ramos  = [
       1   2   0.01   0.05   0.0   1.00 0.00
       1   3   0.01   0.04   0.0   1.00 0.00
       2   3   0.04   0.10   0.0   1.00 0.00
       3   2   0.04   0.10   0.0   1.00 0.00
       ];


