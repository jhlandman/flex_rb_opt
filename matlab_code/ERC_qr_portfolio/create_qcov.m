function [QRSigma, QRCorr, QRVol, AveCorr, AveVol, QRBetas,...
    BaseSigma, BaseCorr, BaseVol, BaseBetas] = create_qcov(Ri,Rm,tau, squaredRm)
%CreateQCov_Adj   This function calculates the conditional covariance and
%correlation matrices and volatility vectors for a set of stocks by 
%performing quantile regression against the benchmark.
%
% Inputs:
%   - Ri: a T x N matrix of stock returns
%   - Rm: a T x 1 vector of benchmark returns / Or T x 
%   - tau: a K-vector of quantiles
%
% Outputs:
%   - Sigma: A set of K covariance matrices (N x N x K) corresponding to 
%            the number of input quantiles
%   - Corr: A set of K correlation matrices (N x N x K) corresponding to 
%           the number of input quantiles 
%   - Vol: A set of K volatiliy vectors (K x N) corresponding to the 
%          number of input quantiles
%   - AveCorr: A 1 x K vector giving the average asset correlation for each
%              quantile
%   - AveVol: A 1 x K vector giving the average asset volatility for each
%             quantile
%   - Betas: A set of K matrices (N x 3 x K) giving the
%            quantile alpha and betas (bmk and squared bmk) for each asset
%   - BaseSigma: Sample asset covariance matrix
%   - BaseCorr: Sample asset correlation matrix
%   - BaseVol: Sample asset volatility vector
%   - BaseBetas: Sample asset volatility vector
%
%
% Created by:   Emlyn Flint
% Created on:   20 Dec 2016
% Last update:  20 Dec 2016
% 
%
%%%% ----------------------------------------------------------------- %%%%
    
nTimePer = size(Ri,1);
nMed = find(round(tau*100) == 50,1); 
%Check if Market Return is one dimensional in cols, and add cols of 1's
if size(Rm,2)==1
    Rm = [ones(nTimePer,1) Rm];
end
if nargin < 4; squaredRm = false; end
if squaredRm
    Rm = [Rm,Rm(:,2).^2];
end
     
nFactors = size(Rm,2);
nTau = max(size(tau));
nAssets = size(Ri,2);

%Preallocation
BaseBetas = NaN(nAssets,nFactors);
BaseEpsilon = NaN(nTimePer,nAssets);
QRBetas = NaN(nTau,nAssets,nFactors); %Betas or Parameters
QREpsilon = NaN(nTimePer,nAssets,nTau); %Residuals

%Quantile Regression for each asset
count = 0;
h = waitbar(count,'');
for idxAsset = 1:nAssets
    waitbar((idxAsset-1)/nAssets,h,sprintf('%d%% - Creating quantile covariances',round((idxAsset-1)/nAssets*100)));
    for idxTau = 1:nTau  
        QRBetas(idxTau,idxAsset,:) = quantreg(Rm ,Ri(:,idxAsset),tau(idxTau));
        if sum(QRBetas(idxTau,idxAsset,:)) == 0
            error('Parameter estimates sum to Zero')
        end
        QREpsilon(:,idxAsset,idxTau) = Ri(:,idxAsset) - (Rm * squeeze(QRBetas(idxTau,idxAsset,:)));
    end
    BaseBetas(idxAsset,:) = regress(Ri(:,idxAsset),Rm);
    BaseEpsilon(:,idxAsset) = Ri(:,idxAsset) - (Rm * BaseBetas(idxAsset,:)');
end
close(h)

Omega = cov(Rm(:,2:end));  %Should we drop the const?    
BaseSigma = cov(Ri);
%[BaseVol, BaseCorr] = cov2corr(BaseSigma);

errMed = squeeze(QREpsilon(:,:,nMed));
D = NaN(nAssets,nAssets,nTau);
QRSigma = NaN(nAssets,nAssets,nTau);
QRVol = NaN(nTau,nAssets);
QRCorr = NaN(nAssets,nAssets,nTau);
AveVol = NaN(nTau,1);
AveCorr = NaN(nTau,1);
for idxTau = 1:nTau
    tempB(1:nFactors,1:nAssets) = squeeze(QRBetas(idxTau,:,:))';
    tempRi = Rm * tempB + errMed;
    %QRSigma(:,:,idxTau) = QRBetas(idxTau,:,2:end)' * Omega * QRBetas(idxTau,:,2:end) + D(:,:,idxTau);
%     QRSigma(:,:,idxTau) = squeeze(QRBetas(idxTau,:,2:end)) * Omega * squeeze(QRBetas(idxTau,:,2:end))' + D(:,:,idxTau);
    QRSigma(:,:,idxTau) = cov(tempRi);
    % [QRVol(idxTau,:), QRCorr(:,:,idxTau)] = cov2corr(QRSigma(:,:,idxTau));
    AveVol(idxTau) = mean(QRVol(idxTau,:));
    AveCorr(idxTau) = sum(sum(tril(QRCorr(:,:,idxTau),-1))) / (0.5*nAssets*(nAssets-1));
end

end