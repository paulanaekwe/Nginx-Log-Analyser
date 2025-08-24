# Nginx-Log-Analyser
Nginx Log Analyser
Project Page: https://roadmap.sh/projects/nginx-log-analyser

This project contains a command-line script, nginx-log-analyser.sh, for analyzing Nginx access.log files. The tool is designed to provide quick insights into server traffic and performance.

Features
The script analyzes the log file to provide the following reports:

Top 5 IP Addresses with the most requests.

Top 5 Most Requested Pages by visitors.

Top 5 Requesting User Agents (e.g., web browsers, bots).

Top 5 Frequent Status Codes (e.g., 200 OK, 404 Not Found, 500 Server Error).

How to Run the Script
1. Make the file executable
Before you can run the script, you need to grant it executable permissions.

chmod +x nginx-log-analyser.sh

2. Run the script
Execute the script from your terminal, providing the full path to your Nginx access.log file as an argument.

./nginx-log-analyser.sh <path-to-nginx-access-log>

Example:
If your Nginx log file is located at /var/log/nginx/access.log, you would run:

./nginx-log-analyser.sh /var/log/nginx/access.log

