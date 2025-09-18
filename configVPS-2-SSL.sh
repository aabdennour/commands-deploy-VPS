# Install Certbot and Nginx plugin
sudo apt install certbot python3-certbot-nginx -y
--------------------------
# Obtain SSL certificates (make sure your domain points to this server first!)
sudo certbot --nginx -d website.store -d www.website.store
-------------------------

# Test SSL certificate
sudo certbot certificates
---------------------------
# Test automatic renewal
sudo certbot renew --dry-run
-----------------------------
# Check Nginx configuration was updated
sudo nginx -t
sudo systemctl reload nginx
-----------------------------------
