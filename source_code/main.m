%% Selma Boudissa
% Course: Human Psychophysics
% Project: Human Vision
% Date: 13/05/18

clear all   % clear all the variables
close all   % close all the figures
clc         % close the command window

%% Part 1: 

disp('Part 1:'); 

%  training vectors

Tr = [1, 1, 0, 0; 1, 0, 0, 0; 0, 0, 0, 1; 0, 0, 1, 1];

% test vectors

Te = [0, 0, 0, 0.9; 0, 0, 0.8, 0.9; 0.7, 0, 0, 0; 0.7, 0.9, 0, 0];

% calling the function 
X = kohonen_network(Tr,Te);

%% Part 2:
% Train the Network with the training dataset 'patient.txt' and
% 'control.txt'

disp('----------------------------------------------------------------------------');
disp('Part 2:');

% Loading the training dataset
C = load('dataset/control.txt');         
P = load('dataset/patient.txt'); 

X = kohonen_network2(C, P);

% Time series

disp('The times series is equal to');

%% Part 3: The text file 'test_five.txt' contains the data 
% from 4 subjects You have to identify which ones are patients 
% or controls based on  the Kohonen network that you have already constructed.

disp('----------------------------------------------------------------------------');
disp('Part 3:'); 
weights = learn (C, P);
Nweights = reshape(weights,2,650,[]);

F = load('dataset/test_five.txt');  % F for final test
X = kohonen_network3(C,P, F);


