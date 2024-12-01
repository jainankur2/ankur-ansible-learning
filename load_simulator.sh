#!/bin/bash

# Function to simulate a CPU spike
simulate_cpu_spike() {
  local duration=$1
  local cpu_percent=$2

  echo "Invoking CPU Load at ${cpu_percent}% for ${duration} seconds..."
  
  local start_time=$(date +%s)
  local target_time=$(( start_time + duration ))
  local target_iterations=$(( cpu_percent * 5000000 / 100 ))  # Adjusted to match Python logic
  
  # Generate CPU load
  while [ $(date +%s) -lt $target_time ]; do
    for ((i = 1; i <= target_iterations; i++)); do
      : $((result += i))  # Dummy operation to spike CPU
    done
    sleep 0.1  # Rest briefly between iterations to control CPU utilization
  done
  
  echo "CPU Load simulation completed."
}

# Main loop to simulate CPU spikes
while true; do
  simulate_cpu_spike 30 80  # 80% CPU for 30 seconds
  sleep 10  # Rest for 10 seconds before next spike
done