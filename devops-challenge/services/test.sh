#!/bin/bash

# Define the list of services and their corresponding test directories
services=("remainder" "division" "multiplication" "addition" "subtraction")

# Iterate over the services and echo the test file names
for service in "${services[@]}"; do
  echo "Running tests for service: $service"
  
  # Get the list of test files in the current service directory
  test_files=($(ls "services/$service/test"))

  # Iterate over the test files and echo their names
  for test_file in "${test_files[@]}"; do
    echo "Test file: $test_file"
  done

  echo # Add an empty line for readability
done
