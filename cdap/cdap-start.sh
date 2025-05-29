#!/bin/bash

echo "Starting CDAP Sandbox..."
echo

# Set Java 8
sudo update-java-alternatives --set /usr/lib/jvm/java-1.8.0-openjdk-amd64

sudo sed -i 's|^JAVA_HOME=.*|JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk-amd64"|' /etc/environment || \
echo 'JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk-amd64"' | sudo tee -a /etc/environment
echo "Path: $PATH"

java -version

echo

# Start CDAP
cd /opt/cdap-sandbox-6.11.0
sudo ./bin/cdap sandbox start --enable-debug
cd
echo

# Set Java 21
sudo update-java-alternatives --set /usr/lib/jvm/java-1.21.0-openjdk-amd64

sudo sed -i 's|^JAVA_HOME=.*|JAVA_HOME="/usr/lib/jvm/java-1.21.0-openjdk-amd64"|' /etc/environment || \
echo 'JAVA_HOME="/usr/lib/jvm/java-1.21.0-openjdk-amd64"' | sudo tee -a /etc/environment
echo "Path: $PATH"

java -version

echo
echo "Finished starting CDAP Sandbox!"
