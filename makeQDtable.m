function [QDsurf, QDcmb1, QDcmb2]=makeQDtable()

Lmax=2;
modnames = {'Lmax2', 'Lmax2_B_i6_v-37p25', 'Lmax2_C_i7_v23p8', 'Lmax2-svd-SV24', 'Lmax2-svd-SV25'};
induction = {'', '_indhigh', '_indlow', '_indsimple'};


for i = 1:length(induction)
    for k = 1:length(modnames)

        filename = fullfile('coefs', [modnames{k}, induction{i}, '_manycoefs.mat']);
        mod = load(filename);
        coefs = mean(mod.cfmat,2);

        % get Q/D
        fac = 2;
        coefSch = [0;coefs(1:(Lmax+1)^2-1)]*fac;
        coefSch = Simons2Olsen(coefSch);
        % Condon Shortley
        [~,~,~,~,~,~,bigm] = addmon(Lmax);
        csphase = (-1).^bigm;
        coefSch = coefSch.*csphase;
        D = 2*sum(coefSch(2:4).^2);
        Q = 3*sum(coefSch(5:9).^2);
        QDsurf(k,i) = Q/D;
        QDcmb1(k,i) = Q/D*(1/0.3)^2;
        QDcmb2(k,i) = Q/D*(1/0.25)^2;
    end
end
