set -e

# Setting folders for app
APP_DIR="/opt/web-brightness/"
CONFIG_DIR="/etc/web-brightness"

# Creating app catalogues
sudo mkdir -p $APP_DIR $CONFIG_DIR

# Copying source files
sudo cp -r ./src ./requirements.txt ./config ./install.sh $APP_DIR/

# Configuring virtual environment
sudo python3 -m venv $APP_DIR/.venv
sudo $APP_DIR/.venv/bin/pip install -r $APP_DIR/requirements.txt

# Creating config if not it's exist
if [! -f "$CONFIG_DIR/config.ini" ]; then 
    sudo cp $APP_DIR/config/config.ini $CONFIG_DIR/config.ini
fi

# Adding service
sudo cp ./src/web-brightness.service /etc/systemd/system/web-brightness.service

# Reloading systemctl
sudo systemctl daemon-reload
sudo systemctl enable myapp.service
sudo systemctl start myapp.service

# Installation is complete
echo "Web brightness is installed! See etc/web_brightness/config.ini to change settings!"