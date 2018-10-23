function  writeFile(matrix,fileName)
    fid=fopen(fileName,'wt');
    [m,n]=size(matrix);
 
    for i=1:m
        for j=1:n
            fprintf(fid,'%.4f\t',matrix(i,j));
        end
    fprintf(fid,'\n');
    end
    fclose(fid);
end

