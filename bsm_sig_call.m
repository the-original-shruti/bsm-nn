% Volatility = blsimpv(Price,Strike,Rate,Time,Value)
T = readtable('new_model_call_matlab.csv');
A = table2array(T);
A(:,7) = blsimpv(A(:,4),A(:,2),A(:,5),A(:,6),A(:,3));
A(any(isnan(A),2),:) = [];
temp = blsprice(A(:,4),A(:,2),A(:,5),A(:,6),A(:,7));
max(abs((A(:,3)-temp)))
T = array2table(A);
T.Properties.VariableNames = {'Index','K','option_price','tau','stock_price','r','impl_sig'};
writetable(T,'new_mode_call_impl_sig.csv')
