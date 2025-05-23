Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12

# Install Chocolatey
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

Start-Sleep -Seconds 30

# Install required software
choco install openjdk17 -y
choco install springboot -y
choco install postgresql -y
choco install eclipse -y
choco install git -y
choco install docker-desktop -y
choco install nodejs -y

# Use npm to install React-chartjs-2
$env:Path += ";$env:ProgramFiles\nodejs"
npm install -g react-chartjs-2

# Write completion log
"Software installation complete" | Out-File C:\install.log
