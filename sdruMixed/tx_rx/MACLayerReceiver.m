function Response = MACLayerReceiver(Receiver,Transmitter, lookingForACK)

% This function is called when the node is just listening to the spectrum
% waiting for a message to be transmitted to them

% Listen to the spectrum
[ Response ] = PHYControl(Receiver);
% Possible response messages
% 1.) Timeout
% 2.) Some message
if ~strcmp(Response,'Timeout')
    fprintf('MAC| Got message: %s\n',Response);
    if ~lookingForACK
        pause(1);
        Transmitter.Run('ACK',1e4);% Send ACK
    end
end


end

