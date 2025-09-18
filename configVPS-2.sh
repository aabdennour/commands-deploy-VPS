# Create Nginx configuration file
sudo nano /etc/nginx/sites-available/yourwebsite
-------------------------------------------
-------------------------------------------
--- Add this content to the Nginx config:
------------------------------------------
------------------------------------------
server {
    listen 80;
    server_name website.store www.website.store;
    
    root /var/www/website.store/frontend/dist;
    index index.html;
    
    client_max_body_size 50M;
    
    # API proxy
    location /api/ {
        proxy_pass http://localhost:5000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_cache_bypass $http_upgrade;
    }
    
    # Uploads proxy
    location /uploads/ {
        proxy_pass http://localhost:5000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
    
    # Frontend routing
    location / {
        try_files $uri $uri/ /index.html;
    }
    
    # Security headers
    add_header X-Frame-Options "SAMEORIGIN" always;
    add_header X-XSS-Protection "1; mode=block" always;
    add_header X-Content-Type-Options "nosniff" always;
}

-----------------------------------------------------
-----------------------------------------------------
----------------------------------------------------

# Enable the site
sudo ln -s /etc/nginx/sites-available/website.store /etc/nginx/sites-enabled/
--------------------
# Remove default site
sudo rm /etc/nginx/sites-enabled/default
-----------------------
# Test Nginx configuration
sudo nginx -t

# Reload Nginx
sudo systemctl reload nginx
--------------------------
# Check Nginx status
sudo systemctl status nginx
---------------------------


