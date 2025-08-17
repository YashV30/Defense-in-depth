# 🛡 Defense-in-Depth Web Security Project

A practical Defense-in-Depth implementation demonstrating multiple layers of security for a web application.
This project showcases network, application, and host-level security measures to protect a sample login system.


<img width="1080" height="608" alt="image" src="https://github.com/user-attachments/assets/7c7d3d8b-8526-4fec-9c93-b28ce590b0ae" />


# 📖 Overview

This project is designed to demonstrate Defense-in-Depth principles by securing a simple web application with:

<img width="1536" height="1024" alt="project image" src="https://github.com/user-attachments/assets/f9134117-716f-422f-9007-143114df644a" />


It can be used as an educational project to understand layered security in real-world deployments.



🔗 Live Preview

Note: Replace this with your hosted link if you deploy online.
Example: Live Demo

✨ Key Features

Frontend: HTML, CSS, JavaScript login system

Backend: PHP with secure database access

Firewall: Custom iptables rules for port/IP restrictions

Access Control: File permissions set via setfacl

IDS: Snort IDS rules for malicious activity detection

Configuration Files: .htaccess & Apache vhost security rules

Documentation: Full project report and screenshots included

🛠 Tech Stack

Frontend: HTML5, CSS3, JavaScript

Backend: PHP 8+

Database: MySQL/MariaDB (credentials removed in GitHub version)

Server: Apache2

Security Tools: iptables, Snort IDS, ACLs

OS: Debian/Ubuntu

📂 Project Structure
defense-in-depth/
│
├── src/                 # Source code
│   ├── index.html
│   ├── signup.html
│   ├── forget.html
│   ├── raw-signup.html
│   ├── signup.php
│   ├── db.php           # Fake credentials for GitHub
│   ├── style.css
│   └── script.js
│
├── config/              # Server configuration files
│   ├── .htaccess
│   └── apache-vhost.conf
│
├── security/            # Security scripts & configurations
│   ├── iptables-rules.sh
│   ├── acl-config.txt
│   └── snort-config.conf
│
├── docs/                # Documentation
│   ├── README.md
│   ├── project-report.pdf
│   ├── screenshots/
│   │   ├── login-page.png
│   │   └── firewall-rules.png

🚀 Getting Started
📌 Prerequisites

Debian/Ubuntu server

Apache2 & PHP installed

MySQL/MariaDB server

iptables, setfacl, and Snort installed

⚙️ Installation

Clone this repository:

git clone https://github.com/yourusername/defense-in-depth.git
cd defense-in-depth


Deploy the web files:

sudo cp -r src/* /var/www/html/


Configure Apache:

sudo cp config/apache-vhost.conf /etc/apache2/sites-available/000-default.conf
sudo systemctl restart apache2


Set ACL permissions:

sudo bash security/acl-config.txt


Apply iptables firewall rules:

sudo bash security/iptables-rules.sh


Configure Snort IDS:

sudo cp security/snort-config.conf /etc/snort/snort.conf
sudo snort -T -c /etc/snort/snort.conf

🧪 How to Use

Access the application via browser:

http://your-server-ip/


Try logging in or signing up.

Test firewall restrictions and IDS alerts using penetration testing tools (e.g., Nmap, cURL).

View Snort logs in:

/var/log/snort/alert

📸 Screenshots
Login Page	Firewall Rules View

	
📜 License

This project is for educational purposes only.
Not recommended for production without further hardening.

👨‍💻 Author

Your Name
📧 your.email@example.com
🔗 GitHub Profile
