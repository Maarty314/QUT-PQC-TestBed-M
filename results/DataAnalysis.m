% Read results table
data = readtable('handshake_log.csv');

%% Seperate KEMs 

mlkem512_mask = strcmp(data.group, "mlkem512");
mlkem512 = data(mlkem512_mask, :);

mlkem768_mask = strcmp(data.group, "mlkem768");
mlkem768 = data(mlkem768_mask, :);

x25519_mlkem512_mask = strcmp(data.group, "x25519_mlkem512");
x25519_mlkem512 = data(x25519_mlkem512_mask, :);

X25519MLKEM768_mask = strcmp(data.group, "X25519MLKEM768");
X25519MLKEM768 = data(X25519MLKEM768_mask, :);

%% RTT dataaa
A = [mlkem512.rtt_ms, mlkem768.rtt_ms, x25519_mlkem512.rtt_ms, X25519MLKEM768.rtt_ms]
B = [mean(A(:,1)), mean(A(:, 2)), mean(A(:, 3)), mean(A(:, 4))]
figure, hold on

boxchart(A); 
title("Return Time for Given Key Encapsulation Method")
xticklabels(["mlkem512", "mlkem768", "X25519 mlkem512", "X25519 mlkem768"]);