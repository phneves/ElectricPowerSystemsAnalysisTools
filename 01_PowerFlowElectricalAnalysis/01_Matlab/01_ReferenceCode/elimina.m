%
% Funcao que realiza a eliminacao dos nos.
% 

% Faz parte da solucao do probelam 3 do capitulo 1.


function[Gred]=elimina(A,b,n_elim)


Ab=[A,b];

[lin_ab,col_ab] = size(Ab);             % Dimensoes da matriz Aumentada.
[qtos_eliminados] = length(n_elim);

for p=1:qtos_eliminados                 % Anula todos os elementos da coluna a ser eliminada, exceto a diagonal.
    
        j=n_elim(p);
        diagonal = Ab(j,j);
    
    for i=1:lin_ab
        
        if i~= j
        cof = - Ab(i,j)/diagonal;
       
        for k=1:col_ab
            
        Ab(i,k)=Ab(i,k) + Ab(j,k)*cof;
            
        end
        end
    end
end

%Ab                                      % A matriz Ab_elim eh a matriz aumentada com as colunas 
                                        % que devem ser excluidas jah zeradas. 

for p=qtos_eliminados:-1:1              % Elimina Linha
    
    j=n_elim(p);                        % Linha a ser eliminada
    
    for k=j:lin_ab-1
        for i=1:col_ab
     
            Ab(k,i)= Ab(k+1,i);
        end
    end
end


for p=qtos_eliminados:-1:1              % Elimina Coluna
    
    j=n_elim(p);                        % Coluna a ser eliminada
    
    for k=j:col_ab-1
        for i=1:lin_ab
     
            Ab(i,k)= Ab(i,k+1);
        end
    end
end

for i=1:lin_ab-qtos_eliminados
    for j=1:col_ab-qtos_eliminados
    
           Gred(i,j) = Ab(i,j);
    end
end
