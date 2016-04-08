


for i=1:40
    
    temp1='G:\PRML\lecture\Assignment_list\gallery\s';     %% strcat used for setting the path
    temp2=strcat(temp1,num2str(i),'\');
            for j=1:5
                
                temp3=strcat(temp2,num2str(j),'.pgm');
                imgmat{i,j}=imread(temp3);
               
            end
    
end

d=1;

for  k=1:40                                              %%creating a feature vector
    
    for p=1:5
        
        g=1;
        for m=1:112
            
            for n=1:92
            
                    Feat1(d,g)=imgmat{k,p}(m,n);
        
                     g=g+1;
            
            
            end
        end
        g=1;
        
        d=d+1;
    end
    
    
end

Feat1=double(Feat1);


muvect=mean(Feat1);
temp4=ones(200,1);
mumat=temp4*muvect;
Feat2=Feat1-mumat;
sigma=cov(Feat2);
lambda=svd(sigma);
righte=eig(sigma);
