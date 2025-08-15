#!/bin/bash
# ========================================================
# iptables-rules.sh
# --------------------------------------------------------
# A sample Defense-in-Depth firewall configuration script.
# This script is intended for educational purposes and 
# should be customized before running on a live server.
#
# WARNING: Running this script may block your access 
# if IP ranges are not set correctly.
# ========================================================

# ------------------------------
# 1. FLUSH OLD RULES
# ------------------------------
iptables -F
iptables -X

# ------------------------------
# 2. DEFAULT POLICIES
# ------------------------------
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# ------------------------------
# 3. ALLOW LOCALHOST TRAFFIC
# ------------------------------
iptables -A INPUT -i lo -j ACCEPT

# ------------------------------
# 4. ALLOW ESTABLISHED CONNECTIONS
# ------------------------------
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# ------------------------------
# 5. SSH ACCESS (CHANGE TO YOUR IP RANGE)
# Example: 192.168.1.0/24 for local network
# ------------------------------
# Allow SSH from local network
iptables -A INPUT -p tcp -s 192.168.X.X/24 --dport 22 -j ACCEPT
# Block SSH from others
iptables -A INPUT -p tcp --dport 22 -j DROP

# ------------------------------
# 6. BLOCK SPECIFIC COUNTRIES OR RANGES (EXAMPLE: CHINA IP RANGE)
# Replace with actual IP ranges from a GeoIP list
# ------------------------------
# iptables -A INPUT -p tcp -s 101.4.0.0/16 --dport 22 -j DROP

# ------------------------------
# 7. ALLOW HTTP/HTTPS (WEB TRAFFIC)
# ------------------------------
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT

# ------------------------------
# 8. BLOCK ICMP (PING) REQUESTS
# ------------------------------
iptables -A INPUT -p icmp --icmp-type echo-request -j DROP

# ------------------------------
# 9. LIMIT BRUTE FORCE ATTEMPTS (RATE LIMITING)
# ------------------------------
iptables -A INPUT -p tcp --dport 80 -m connlimit --connlimit-above 10 -j DROP
iptables -A INPUT -p tcp --dport 443 -m connlimit --connlimit-above 10 -j DROP

# ------------------------------
# 10. BLOCK KNOWN MALICIOUS IPS
# Replace <BLOCKED_IP> with actual IPs
# ------------------------------
# iptables -A INPUT -s <BLOCKED_IP> -j DROP

# ------------------------------
# 11. DETECT AND DROP PORT SCANS
# ------------------------------
iptables -N PORT-SCANS
iptables -A PORT-SCANS -p tcp --tcp-flags ALL FIN,URG,PSH -j DROP
iptables -A PORT-SCANS -p tcp --tcp-flags ALL NONE -j DROP
iptables -A PORT-SCANS -p tcp --tcp-flags SYN,RST SYN,RST -j DROP
iptables -A INPUT -j PORT-SCANS

# ------------------------------
# 12. VIEW CURRENT RULES
# ------------------------------
iptables -L -v

# ------------------------------
# 13. SAVE RULES (Debian/Ubuntu)
# ------------------------------
# Uncomment the following line to save rules permanently
# iptables-save > /etc/iptables/rules.v4

echo "Firewall rules applied successfully."
