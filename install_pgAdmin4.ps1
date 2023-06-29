$pgAdminUrl = "https://ftp.postgresql.org/pub/pgadmin/pgadmin4/v5.5/windows/pgadmin4-5.5-x64.exe"
$pgAdminInstaller = "pgadmin4-5.5-x64.exe"
$installPath = "C:\pgAdmin4"

# Download pgAdmin 4 installer
Invoke-WebRequest -Uri $pgAdminUrl -OutFile $pgAdminInstaller

# Install pgAdmin 4 silently
Start-Process -FilePath $pgAdminInstaller -ArgumentList "--install", "--quiet", "--unattended", "--installdir=$installPath" -Wait

# Clean up the installer file
Remove-Item $pgAdminInstaller