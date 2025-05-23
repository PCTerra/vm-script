# Set execution policy (useful if run directly)
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force

# Define helper function to check if a command exists
function Command-Exists {
    param([string]$cmd)
    $null -ne (Get-Command $cmd -ErrorAction SilentlyContinue)
}

# Git
if (-not (Command-Exists "git")) {
    Write-Output "Installing Git..."
    Invoke-WebRequest -Uri "https://github.com/git-for-windows/git/releases/download/v2.43.0.windows.1/Git-2.43.0-64-bit.exe" -OutFile "$env:TEMP\git-install.exe"
    Start-Process -FilePath "$env:TEMP\git-install.exe" -ArgumentList "/VERYSILENT" -Wait
}

# Spring Boot CLI
if (-not (Test-Path "C:\spring")) {
    Write-Output "Installing Spring Boot CLI..."
    Invoke-WebRequest -Uri "https://repo.spring.io/release/org/springframework/boot/spring-boot-cli/3.2.5/spring-boot-cli-3.2.5-bin.zip" -OutFile "$env:TEMP\spring.zip"
    Expand-Archive "$env:TEMP\spring.zip" -DestinationPath "C:\spring"
    $env:Path += ";C:\spring\spring-boot-cli-3.2.5\bin"
    [Environment]::SetEnvironmentVariable("Path", $env:Path, [EnvironmentVariableTarget]::Machine)
}

# Node.js
if (-not (Command-Exists "node")) {
    Write-Output "Installing Node.js..."
    Invoke-WebRequest -Uri "https://nodejs.org/dist/v20.11.1/node-v20.11.1-x64.msi" -OutFile "$env:TEMP\nodejs.msi"
    Start-Process msiexec.exe -ArgumentList "/i $env:TEMP\nodejs.msi /quiet" -Wait
}

# React-chartjs-2 (via npm)
if (Command-Exists "npm") {
    Write-Output "Installing React-chartjs-2..."
    npm install react-chartjs-2 chart.js
}

# Apache Kafka (for Kafka Streams)
if (-not (Test-Path "C:\kafka")) {
    Write-Output "Installing Apache Kafka..."
    Invoke-WebRequest -Uri "https://downloads.apache.org/kafka/3.7.0/kafka_2.13-3.7.0.tgz" -OutFile "$env:TEMP\kafka.tgz"
    tar -xvf "$env:TEMP\kafka.tgz" -C C:\ 
    Rename-Item "C:\kafka_2.13-3.7.0" -NewName "kafka"
}

# TensorFlow (via pip)
if (-not (Command-Exists "pip")) {
    Write-Output "Installing Python and pip..."
    Invoke-WebRequest -Uri "https://www.python.org/ftp/python/3.12.3/python-3.12.3-amd64.exe" -OutFile "$env:TEMP\python.exe"
    Start-Process "$env:TEMP\python.exe" -ArgumentList "/quiet InstallAllUsers=1 PrependPath=1" -Wait
}
Write-Output "Installing TensorFlow..."
pip install tensorflow

# Eclipse IDE
if (-not (Test-Path "C:\Eclipse")) {
    Write-Output "Installing Eclipse IDE..."
    Invoke-WebRequest -Uri "https://ftp.osuosl.org/pub/eclipse/technology/epp/downloads/release/2024-03/R/eclipse-java-2024-03-R-win32-x86_64.zip" -OutFile "$env:TEMP\eclipse.zip"
    Expand-Archive "$env:TEMP\eclipse.zip" -DestinationPath "C:\Eclipse"
}

# GitHub CLI
if (-not (Command-Exists "gh")) {
    Write-Output "Installing GitHub CLI..."
    Invoke-WebRequest -Uri "https://github.com/cli/cli/releases/download/v2.49.0/gh_2.49.0_windows_amd64.msi" -OutFile "$env:TEMP\ghcli.msi"
    Start-Process msiexec.exe -ArgumentList "/i $env:TEMP\ghcli.msi /quiet" -Wait
}

# Docker Desktop
if (-not (Get-Command "docker" -ErrorAction SilentlyContinue)) {
    Write-Output "Installing Docker Desktop..."
    Invoke-WebRequest -Uri "https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe" -OutFile "$env:TEMP\docker-installer.exe"
    Start-Process "$env:TEMP\docker-installer.exe" -ArgumentList "install --quiet" -Wait
}

# Minikube (local Kubernetes)
if (-not (Test-Path "C:\minikube")) {
    Write-Output "Installing Minikube..."
    Invoke-WebRequest -Uri "https://github.com/kubernetes/minikube/releases/download/v1.33.1/minikube-windows-amd64.exe" -OutFile "C:\minikube.exe"
    Rename-Item -Path "C:\minikube.exe" -NewName "C:\minikube\minikube.exe"
    [Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\minikube", [EnvironmentVariableTarget]::Machine)
}

Write-Output "All specified software has been installed (or was already present)."
