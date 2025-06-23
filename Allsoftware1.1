# Ensure admin privileges
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
    [Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Error "Please run this script as Administrator"
    exit 1
}

# Start logging
Start-Transcript -Path "C:\install-log.txt" -Append

# Install Chocolatey if missing
if (!(Get-Command choco -ErrorAction SilentlyContinue)) {
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    $env:Path += ";$env:ALLUSERSPROFILE\chocolatey\bin"
}

# Function to check if choco package is already installed
function Install-ChocoIfMissing($package) {
    if (!(choco list --local-only | Select-String "^$package")) {
        Write-Host "Installing $package..."
        choco install $package -y --no-progress
    } else {
        Write-Host "$package already installed. Skipping..."
    }
}

# Install core tools
Install-ChocoIfMissing "git"
Install-ChocoIfMissing "jdk17"
Install-ChocoIfMissing "eclipse"
Install-ChocoIfMissing "vscode"
Install-ChocoIfMissing "python"
Install-ChocoIfMissing "nodejs-lts"
Install-ChocoIfMissing "docker-desktop"
Install-ChocoIfMissing "pgadmin4"

# Spring Boot CLI
$SpringDir = "C:\spring"
$SpringBin = "$SpringDir\spring-3.2.5\bin"
if (!(Test-Path "$SpringBin\spring.bat")) {
    Write-Host "Installing Spring Boot CLI..."
    $SpringZipUrl = "https://repo.maven.apache.org/maven2/org/springframework/boot/spring-boot-cli/3.2.5/spring-boot-cli-3.2.5-bin.zip"
    New-Item -ItemType Directory -Force -Path $SpringDir | Out-Null
    Invoke-WebRequest -Uri $SpringZipUrl -OutFile "$SpringDir\spring.zip"
    Expand-Archive -Path "$SpringDir\spring.zip" -DestinationPath $SpringDir
    [Environment]::SetEnvironmentVariable("Path", $env:Path + ";$SpringBin", [EnvironmentVariableTarget]::Machine)
} else {
    Write-Host "Spring Boot CLI already installed"
}

# Kafka install
$KafkaDir = "C:\kafka"
$KafkaBin = "$KafkaDir\kafka_2.13-3.7.0\bin\windows"
if (!(Test-Path "$KafkaBin\kafka-topics.bat")) {
    Write-Host "Installing Apache Kafka..."
    $KafkaUrl = "https://downloads.apache.org/kafka/3.7.0/kafka_2.13-3.7.0.tgz"
    New-Item -ItemType Directory -Force -Path $KafkaDir | Out-Null
    Invoke-WebRequest -Uri $KafkaUrl -OutFile "$KafkaDir\kafka.tgz"
    tar -xf "$KafkaDir\kafka.tgz" -C $KafkaDir
    [Environment]::SetEnvironmentVariable("Path", $env:Path + ";$KafkaBin", [EnvironmentVariableTarget]::Machine)
} else {
    Write-Host "Apache Kafka already installed"
}

# Python pip packages
$pythonPath = "C:\Python311\Scripts"
$env:Path += ";$pythonPath"
if (!(Get-Command pip -ErrorAction SilentlyContinue)) {
    Write-Warning "pip not found. Python may not be fully installed yet. Skipping pip packages."
} else {
    $pipPkgs = "pandas","numpy","scikit-learn","matplotlib","seaborn","plotly","jupyterlab","streamlit"
    foreach ($pkg in $pipPkgs) {
        if (!(pip show $pkg 2>$null)) {
            Write-Host "Installing Python package: $pkg"
            pip install $pkg
        } else {
            Write-Host "Python package $pkg already installed"
        }
    }
}

# DJL Samples
$DJLDir = "C:\djl"
if (!(Test-Path $DJLDir)) {
    Write-Host "Downloading DJL examples..."
    Invoke-WebRequest -Uri "https://github.com/deepjavalibrary/djl/archive/refs/heads/master.zip" -OutFile "$env:TEMP\djl.zip"
    Expand-Archive -Path "$env:TEMP\djl.zip" -DestinationPath $DJLDir
} else {
    Write-Host "DJL already downloaded"
}

# Weka Installer
$WekaDir = "C:\weka"
$WekaExe = "$env:TEMP\weka.exe"
if (!(Test-Path $WekaDir)) {
    Write-Host "Installing Weka..."
    New-Item -ItemType Directory -Force -Path $WekaDir | Out-Null
    try {
        Invoke-WebRequest -Uri "https://prdownloads.sourceforge.net/weka/weka-3-8-6-azul-zulu-windows.exe" -OutFile $WekaExe
        Start-Process -FilePath $WekaExe -ArgumentList "/S" -Wait
    } catch {
        Write-Warning "Weka installation failed or requires GUI session. Can be installed manually."
    }
} else {
    Write-Host "Weka already exists"
}

# React-chartjs-2 via npm
if (!(npm list -g react-chartjs-2 --depth=0 2>$null)) {
    Write-Host "Installing react-chartjs-2..."
    npm install -g react-chartjs-2
} else {
    Write-Host "react-chartjs-2 already installed"
}

# Done
Write-Host "`n✅ All required software checked and installed (if missing)." -ForegroundColor Green
Stop-Transcript
