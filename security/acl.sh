sudo setfacl -m u:www-data:rw /var/www/html/db.php
sudo setfacl -m u:www-data:rw /var/www/html/index.html
sudo setfacl -m u:www-data:rw /var/www/html/forget.html
sudo setfacl -m u:www-data:rw /var/www/html/signup.html
sudo setfacl -m u:www-data:rw /var/www/html/raw-signup.html
sudo setfacl -m u:www-data:rw /var/www/html/style.css
sudo setfacl -m u:www-data:rw /var/www/html/signup.php
echo "🎯 ACL configuration completed."
