# PID Water Level Control in a Tank

A MATLAB simulation of a **PID controller** regulating the water level in a tank. The project demonstrates how feedback control can maintain a desired setpoint while visualizing both the tank and the water level in real time [file:1][file:2].

## Overview

Controlling liquid level is a fundamental problem in process control and industrial automation. This project models a tank system and uses a Proportional-Integral-Derivative (PID) controller to keep the water level close to a target value, even as the system dynamics evolve over time [file:1].

The simulation includes:
- A tank visualization.
- A live plot of water level over time.
- A dashed setpoint reference line.
- PID-based control logic for inflow regulation [file:2].

## Features

- PID control with proportional, integral, and derivative terms.
- Real-time simulation of tank water level dynamics.
- Visual feedback with MATLAB plots and animated updates.
- Adjustable controller gains and setpoint.
- Simple structure that can be extended for more realistic process models [file:1][file:2].

## How It Works

At each simulation step, the controller:
1. Computes the error between the desired level and the current level.
2. Updates the integral of the error.
3. Estimates the error derivative.
4. Calculates the control signal using the PID formula.
5. Uses that signal to update the tank inflow.
6. Updates the water level based on inflow and outflow dynamics [file:2].

## MATLAB Code Structure

The script is organized into:
- Simulation parameters.
- Tank parameters.
- PID gains.
- Initial conditions.
- Plot setup.
- Main simulation loop [file:2].

## Parameters

You can tune these values in the script:
- `Kp`: proportional gain.
- `Ki`: integral gain.
- `Kd`: derivative gain.
- `setpoint`: desired water level.
- `initialLevel`: starting water level.
- `tankHeight`: maximum tank height.
- `tankArea`: tank cross-sectional area [file:2].

## Getting Started

### Requirements
- MATLAB installed on your system.

### Run the simulation
1. Open `tank_3.m` in MATLAB.
2. Run the script.
3. Observe the animated tank and the water level plot.

## Project Structure

```text
├── tank_3.m
└── README.md
