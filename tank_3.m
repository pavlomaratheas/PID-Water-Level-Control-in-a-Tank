totalTime = 20;       
timeStep = 0.1;        
numSteps = totalTime / timeStep;   

tankHeight = 10;       
tankArea = 5;           
tankVolume = tankHeight * tankArea;

Kp = 1;                 
Ki = 0.5;               
Kd = 0.1;               

setpoint = 7;           % Desired water level
initialLevel = 5;       % Initial water level 
level = initialLevel;   % (updated in the loop)

time = zeros(numSteps, 1);
levelData = zeros(numSteps, 1);
errorIntegral = 0;
prevError = 0;

figure('Name', 'Water Level in Tank', 'Position', [100, 100, 800, 500]);

% Tank figure
tankAxes = subplot(2, 1, 1);
rectangle('Position', [0, 0, tankArea, tankHeight], 'LineWidth', 2);
xlim([0, tankArea]);
ylim([0, tankHeight]);
xlabel('Tank Area (m^2)');
ylabel('Tank Height (m)');
title('Tank');
grid on;

% Water Level figure
waterAxes = subplot(2, 1, 2);
waterLevelPlot = plot(time, levelData, 'b', 'LineWidth', 2);
hold on;
setpointPlot = plot([time(1), time(end)], [setpoint, setpoint], 'r--', 'LineWidth', 1.5);
hold off;
xlim([0, totalTime]);
ylim([0, tankHeight]);
xlabel('Time (s)');
ylabel('Water Level (m)');
title('Water Level');
legend([waterLevelPlot, setpointPlot], 'Water Level', 'Setpoint');
grid on;

% Simulation loop
for i = 1:numSteps
    time(i) = i * timeStep;
    
    error = setpoint - level;
    
    errorIntegral = errorIntegral + error * timeStep;
    
    errorDerivative = (error - prevError) / timeStep;
    
    controlSignal = Kp * error + Ki * errorIntegral + Kd * errorDerivative;
    
    % simulate water flow
    inflow = controlSignal * tankArea;
    outflow = sqrt(2 * 9.81 * level) * tankArea;
    levelChange = (inflow - outflow) / tankArea * timeStep;
    level = level + levelChange;
    
    prevError = error;
    
    levelData(i) = level;
    
    set(waterLevelPlot, 'XData', time, 'YData', levelData);

    set(setpointPlot, 'XData', [time(1), time(end)], 'YData', [setpoint, setpoint]);

     pause(0.05);
end

    