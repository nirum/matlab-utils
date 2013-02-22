% matrix to latex output
% Niru Maheswaranathan
% Fri Feb 22 14:35:16 2013

function mat2tex(A)

    for row = 1:size(A,1)
        for col = 1:size(A,2)
            if col < size(A,2)
                fprintf('%g & ', A(row,col));
            else
                fprintf('%g \\\\\n', A(row,col));
            end
        end
    end
