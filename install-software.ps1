# install-software.ps1

# Ensure TLS 1.2 and Chocolatey is available
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12

# Install Chocolatey
if (-Not (Get-Command choco -ErrorAction SilentlyContinue)) {
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# Refresh environment
refreshenv

# Install core packages via Chocolatey
choco install openjdk17 -y
choco install postgresql -y
choco install eclipse -y
choco install git -y
choco install docker-desktop -y
choco install nodejs-lts -y
choco install minikube -y
choco install kubernetes-cli -y
choco install make -y

# Install Kafka and dependencies
choco install kafka -y

# Install TensorFlow via pip
if (-not (Get-Command python -ErrorAction SilentlyContinue)) {
    choco install python -y
}
python -m pip install --upgrade pip
pip install tensorflow

# React and charting libraries
npm install -g create-react-app
npm install -g react-chartjs-2 chart.js

# Java Streams and Kafka Streams API setup note (manual or build tool inclusion)
Write-Output "NOTE: Java Streams API and Kafka Streams are libraries typically included via Maven/Gradle in a Java project, not global installs."

# Install GitHub CLI
choco install gh -y

# GitLab CLI (if needed, CLI alternative is `glab`)
choco install glab -y

# DockerHub login setup (manual)
Write-Output "NOTE: DockerHub login and GitHub Actions setup must be done manually or with secure CI/CD integration."

# Install Kind for Kubernetes in Docker
choco install kind -y

# Final status
Write-Output "Software installation completed successfully."
