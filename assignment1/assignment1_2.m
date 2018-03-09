close all
cd('/Users/Fredrik/Desktop/Droneteknologi/2_år/AUT-2003/signalProcessing/')
fileRead('pressure_temp_relhumidity_CO2ppm.txt')

%Reading data from .txt file and plotting 
%the data with time in hours.
function [] = fileRead(file)
    data = dlmread(file);
    pressure = data(:,1);
    temperature = data(:,2);
    humidity = data(:,3);
    gasLevel = data(:,4);
    time = length(pressure);
    
    figure('name',['Measured data from ', file])
    subplot(2,2,1)
    plot(0:time-1,pressure)
    title('Pressure')
    xlabel('Time [hour]')
    ylabel('Pressure [KPa]')
    
    subplot(2,2,2)
    plot(0:time-1,temperature)
    title('Temperature')
    xlabel('Time [hour]')
    ylabel('Temperature [^\circC]')
    
    subplot(2,2,3)
    plot(0:time-1,humidity)
    title('Humidity')
    xlabel('Time [hour]')
    ylabel('Humidity [%]')
    
    subplot(2,2,4)
    plot(0:time-1,gasLevel)
    title('Gas emission')
    xlabel('Time [Hour]')
    ylabel('Emission [PPM]')
    
end