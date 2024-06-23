#!/bin/bash

# Navigate to the project directory
cd MissionPlanner-scripts

# Install required dependencies
poetry install --no-root

poetry run python .\src\main.py
