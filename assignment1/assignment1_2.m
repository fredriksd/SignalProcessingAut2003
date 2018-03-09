%Assignment 2
%Read data from pressure_temp_relhumidity_CO2ppm.txt and 
%plot the data with fileRead(). 
close all
fileRead('pressure_temp_relhumidity_CO2ppm.txt')

%Reading data from .txt file and plotting 
%the data with time in hours.
function [] = fileRead(file)
    data = dlmread(file);
    %1st column pressure data
    pressure = data(:,1);
    %2nd column temperature data
    temperature = data(:,2);
    %3rd column humidity data
    humidity = data(:,3);
    %4th column CO2 level data
    gasLevel = data(:,4);
    %Equal amount of data in each column
    %therefore time has the same length.
    time = length(pressure);
    
    figure('name',['Measured data from ', file])
    subplot(2,2,1)
    plot(0:time-1,pressure), grid on
    title('Pressure')
    xlabel('Time [hour]')
    ylabel('Pressure [KPa]')
    
    subplot(2,2,2)
    plot(0:time-1,temperature), grid on
    title('Temperature')
    xlabel('Time [hour]')
    ylabel('Temperature [^\circC]')
    
    subplot(2,2,3)
    plot(0:time-1,humidity), grid on
    title('Humidity')
    xlabel('Time [hour]')
    ylabel('Humidity [%]')
    
    subplot(2,2,4)
    plot(0:time-1,gasLevel), grid on
    title('Gas emission')
    xlabel('Time [Hour]')
    ylabel('Emission [PPM]')
    
end