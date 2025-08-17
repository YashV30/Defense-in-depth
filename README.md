# 🛡 Defense-in-Depth Web Security Project

A practical Defense-in-Depth implementation demonstrating multiple layers of security for a web application.
This project showcases network, application, and host-level security measures to protect a sample login system.


<img width="1080" height="608" alt="image" src="https://github.com/user-attachments/assets/7c7d3d8b-8526-4fec-9c93-b28ce590b0ae" />


# 📖 Overview

This project is designed to demonstrate Defense-in-Depth principles by securing a simple web application with:

<img width="1536" height="1024" alt="project image" src="https://github.com/user-attachments/assets/f9134117-716f-422f-9007-143114df644a" />


It can be used as an educational project to understand layered security in real-world deployments.


# ✨ Key Features

Frontend: HTML, CSS, JavaScript login system

Backend: PHP with secure database access

Firewall: Custom iptables rules for port/IP restrictions

Access Control: File permissions set via setfacl

IDS: Snort IDS rules for malicious activity detection

Configuration Files: .htaccess & Apache vhost security rules

Documentation: Full project report and screenshots included

# 🛠 Tech Stack

Frontend: HTML5, CSS3, JavaScript

Backend: PHP 8+

Database: MySQL/MariaDB (credentials removed in GitHub version)

Server: Apache2

Security Tools: iptables, Snort IDS, ACLs

OS: Debian/Ubuntu


# 🚀 Getting Started
📌 Prerequisites

Debian/Ubuntu server

Apache2 & PHP installed

MySQL/MariaDB server

iptables, setfacl, and Snort installed

# ⚙️ Installation

Clone this repository:

git clone https://github.com/YashV30/defense-in-depth.git

cd defense-in-depth


Deploy the web files:

sudo cp -r src/* /var/www/html/


Configure Apache:

sudo cp config/apache-vhost.conf /etc/apache2/sites-available/000-default.conf

sudo systemctl restart apache2


## Set ACL permissions:

sudo bash security/acl-config.txt

# Output

<img width="1920" height="1080" alt="Web ACL" src="https://github.com/user-attachments/assets/b8d4d267-bab2-4df0-9912-f505907adab6" />


## Apply iptables firewall rules:

sudo bash security/iptables-rules.sh

# Output

<img width="1920" height="1080" alt="Iptables rules implementation" src="https://github.com/user-attachments/assets/b970c143-6be8-4c86-8f16-3a481e91f026" />


## Configure Snort IDS:

sudo cp security/snort-config.conf /etc/snort/snort.conf
sudo snort -T -c /etc/snort/snort.conf

# Output

<img width="1920" height="1080" alt="final result" src="https://github.com/user-attachments/assets/0cb2ea32-74d4-4e8c-b01d-8f8759630e09" />


# 🧪 How to Use

Access the application via browser:

url :- (http://192.168.141.130/)

# Output

<img width="1920" height="1080" alt="login page" src="https://github.com/user-attachments/assets/dd8d3525-e169-4182-af47-894ddff940d6" />


# Try logging in or signing up.

## Signup Page

<img width="1920" height="1080" alt="Signup Page" src="https://github.com/user-attachments/assets/2e97cf26-a3a8-4a3f-8780-1ff5aa972326" />

# Login with Cerdentials

<img width="1920" height="1080" alt="Login With user Credential" src="https://github.com/user-attachments/assets/f0117fed-b010-4058-a6c9-666c7f6f3afd" />

# Database Entry

<img width="1920" height="1080" alt="database entries" src="https://github.com/user-attachments/assets/90d60962-38e8-42f9-b5da-ebcd645cd156" />




📜 License

This project is for educational purposes only.
Not recommended for production without further hardening.

👨‍💻 Yash Shivatare 

📧 shivatareyash30@gmail.com

🔗 https://github.com/YashV30
