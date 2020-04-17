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
barras = [ 1   3   1.00   0.00   0.00   0.00  0.00  0.00  0.00
           2   0   1.00   0.00   0.00   0.00  40.0  20.0  0.00
           3   0   1.00   0.00   0.00   0.00  25.0  15.0  0.00
           4   0   1.00   0.00   0.00   0.00  40.0  20.0  0.00
           5   0   1.00   0.00   0.00   0.00  50.0  20.0  0.00
];

%	Dados dos ramos
%
%	De - Para - r - x - bshl - tap - fi
%
%	Dados em pu e em graus
%	bsh - carregamento total
%	modelo do transformador:  | tap:1 - x |

ramos  = [
       1   2   0.05   0.11   0.02   1.00 0.00
       1   3   0.05   0.11   0.02   1.00 0.00
       1   5   0.03   0.08   0.02   1.00 0.00
       2   3   0.04   0.09   0.02   1.00 0.00
       2   5   0.04   0.09   0.02   1.00 0.00
       3   4   0.06   0.13   0.03   1.00 0.00
       4   5   0.04   0.09   0.02   1.00 0.00
];


