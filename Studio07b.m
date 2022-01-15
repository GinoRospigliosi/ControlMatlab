K=logspace(-4,-1,10000);             % Define range of K from 1 to 2000 in 
                                    % steps of 1.
for n=1:length(K);                  % Set up length of DO LOOP to equal 
                                   % number of K values to be tested.
       dent=[1 2.6817 (0.11-520*K(n)) (0.0126-10.3844*K(n))];        
                                     % Define the denominator of T(s) for 
                                    % the nth value of K.
       poles=roots(dent);           % Find the poles for the nth value of 
                                    % K.
       r=real(poles);               % Form a vector containing the real 
                                    % parts of the poles for K(n).
             if max(r)>=0,          % Test poles found for the nth value 
                                    % of K for a real value > or = 0.
                  poles             % Display first pole values where
                                    % there is a real part > or = 0.
                  K=K(n)            % Display corresponding value of K.
                  break             % Stop loop if rhp poles are found.
       end                          % End if. 
end                                 % End for.
