# Ensure script runs as admin
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
    [Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Error "Run this script as Administrator."
    exit 1
}

# Allow script execution
Set-ExecutionPolicy Bypass -Scope Process -Force

# Spring CLI Installation
Write-Output "Installing Spring CLI..."
Invoke-WebRequest -Uri "https://repo.spring.io/release/org/springframework/boot/spring-boot-cli/3.2.5/spring-boot-cli-3.2.5-bin.zip" -OutFile "$env:TEMP\spring.zip"
Expand-Archive "$env:TEMP\spring.zip" -DestinationPath "C:\spring"
$env:Path += ";C:\spring\spring-boot-cli-3.2.5\bin"

# Kafka Installation
Write-Output "Installing Apache Kafka..."
Invoke-WebRequest -Uri "https://downloads.apache.org/kafka/3.7.0/kafka_2.13-3.7.0.tgz" -OutFile "$env:TEMP\kafka.tgz"
tar -xzf "$env:TEMP\kafka.tgz" -C "C:\"
Rename-Item -Path "C:\kafka_2.13-3.7.0" -NewName "Kafka"
$env:Path += ";C:\Kafka\bin\windows"

# TensorFlow Installation
Write-Output "Installing TensorFlow via pip..."
pip install tensorflow

# React-chartjs-2 Installation
Write-Output "Installing react-chartjs-2..."
npm install react-chartjs-2 chart.js

Write-Output "✅ All missing components installed successfully."
