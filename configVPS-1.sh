sudo apt update && sudo apt upgrade -y
sudo apt install nginx -y
-----------------------
sudo systemctl start nginx
sudo systemctl enable nginx
sudo systemctl status nginx
-----------------------
sudo npm install -g pm2
-----------------------
sudo ufw enable
sudo ufw allow ssh
sudo ufw allow 'Nginx Full'
sudo ufw allow (port: 5000 or ...)
sudo ufw status
-----------------------
sudo apt install git -y
git --version
-----------------------
sudo mkdir -p /var/www/yourwebsite.com/backend
sudo mkdir -p /var/www/yourwebsite.com/frontend
sudo mkdir -p /var/log/pm2
sudo chown -R $USER:$USER /var/www/
sudo chmod -R 755 /var/www/
-----------------------
nginx -v
pm2 --version
node --version
npm --version
git --version

plus other instalation for exmpl node.js mongoDB ....
*****************************
////////////////////////////
*****************************
# Build the application mern
npm run build

# Verify build was created
ls -la dist/

# Set proper permissions
sudo chown -R www-data:www-data dist/
sudo chmod -R 755 dist/
------------------
cd /var/www/yourwebsite.com/backend
pm2 start server.js --name yourwebsite
pm2 startup systemd # or not use systemd (Auto-start on Server Reboot)
pm2 save
..................
# Check Status & Logs
pm2 list        # Show running processes
pm2 status      # Detailed info
pm2 logs yourwebsite   # Show logs
pm2 logs        # All logs
..................
pm2 restart woolwi-backend
pm2 stop woolwi-backend
pm2 delete woolwi-backend
..................
pm2 start server.js --watch --name woolwi-backend
..................
# Update Your App
# When you update code:
git pull origin main
npm install
pm2 restart yourwebsite
..................
sudo chown -R www-data:www-data /var/www/yourwebsite/backend/uploads
sudo chmod -R 755 /var/www/yourwebsite/backend/uploads

