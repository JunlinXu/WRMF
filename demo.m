    load drugsim;
    load virussim;
    load virusdrug;
    Vp=find(virusdrug()==1);
    Vn=find(virusdrug()==0);
    MatPredict=zeros(218,34);
    Ip=crossvalind('Kfold',numel(Vp),5);
    In=crossvalind('Kfold',numel(Vn),5);

    for I=1:5
        vp=Ip==I;
        vn=In==I;
        matDT=virusdrug;
        matDT(Vp(vp))=0;
        recMatrix=WRMF(virusdrug,drugsim,virussim,30,5);
        V=[Vn(vn);Vp(vp)];
        MatPredict(V)=recMatrix(V);
    end
    [AUC,AUPR,Acc,Sen,Spe,Pre]=ROCcompute(MatPredict(),virusdrug(),1);

        
       
       
  

