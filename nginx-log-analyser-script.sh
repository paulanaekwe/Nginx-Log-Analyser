#!/bin/bash

# nginx-log-analyser.sh
# A script to analyze an Nginx access log file and extract key performance metrics.

# --- Function to display usage information ---
show_help() {
  echo "Usage: $0 <path-to-nginx-access-log>"
  echo ""
  echo "This script analyzes an Nginx access log and provides a report"
  echo "of top IP addresses, requests, user agents, and status codes."
  echo ""
  echo "Arguments:"
  echo "  <path-to-nginx-access-log>  The full path to your Nginx access.log file."
}

# --- Main Script Logic ---

# Check if a log file path was provided.
if [ -z "$1" ]; then
  echo "Error: You must provide the path to an Nginx access log file."
  show_help
  exit 1
fi

LOG_FILE="$1"

# Check if the log file exists and is readable.
if [ ! -f "$LOG_FILE" ] || [ ! -r "$LOG_FILE" ]; then
  echo "Error: Log file '$LOG_FILE' not found or is not readable."
  exit 1
fi

# Set a clear title for the output
echo "================================================="
echo "  NGINX LOG ANALYSIS REPORT"
echo "================================================="
echo "Analysing: $LOG_FILE"

# --- Top 5 IP addresses with the most requests ---
echo -e "\n--- Top 5 IP addresses with the most requests ---"
# The 'cut' command extracts the first column (IP address).
# The 'sort' command sorts them numerically and counts occurrences.
# The 'head' command then gets the top 5.
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 5

# --- Top 5 most requested pages ---
echo -e "\n--- Top 5 most requested pages ---"
# 'awk' extracts the request path, which is typically the 7th field.
# The output is then sorted, counted, and the top 5 are displayed.
awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 5

# --- Top 5 requesting user agents ---
echo -e "\n--- Top 5 requesting user agents ---"
# This command extracts the user agent string, often enclosed in quotes.
# 'cut' is used to get the relevant part of the line.
# 'sort', 'uniq -c', and 'sort -nr' are used to count and rank.
awk -F\" '{print $6}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 5

# --- Top 5 frequent status codes ---
echo -e "\n--- Top 5 frequent status codes ---"
# 'awk' extracts the status code from the 9th field.
# 'sort', 'uniq -c', and 'sort -nr' rank the codes by frequency.
awk '{print $9}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 5

echo -e "\n================================================="
echo "  ANALYSIS COMPLETE"
echo "================================================="

