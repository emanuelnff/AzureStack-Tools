$ModuleName = 'AzureStack.Infra'
$ModuleImportFile = 'AzureStack.Infra.psm1'

$ModuleRoot = (Resolve-Path $PSScriptRoot\..).Path
Import-Module $script:ModuleRoot\$script:ModuleImportFile -Force

Describe $script:ModuleName {
    Context 'Module should be imported correctly' {
        It "$script:ModuleName module is imported" {
            Get-Module -Name $script:ModuleName |
                Should Not Be $null
        }

        It 'Get-AzsAlert should be exported' {
            Get-Command -Name Get-AzsAlert -ErrorAction SilentlyContinue | 
                Should Not Be $null
        }
    }
}

InModuleScope $script:ModuleName {

    $HostComputer = $global:HostComputer
    $ArmEndpoint = $global:ArmEndpoint
    $natServer = $global:natServer 
    $AdminUser= $global:AdminUser 
    $AadServiceAdmin = $global:AadServiceAdmin 

    $AdminPassword = $global:AdminPassword
    $AadServiceAdminPassword = $global:AadServiceAdminPassword
    $stackLoginCreds = $global:AzureStackLoginCredentials

    $VPNConnectionName = $global:VPNConnectionName

    $AadTenant = $global:AadTenantID

    $EnvironmentName = $global:EnvironmentName


    Describe 'Infra - Functional Tests' {
        It 'Get-AzsAlert should not throw' {
            { Get-AzsAlert -TenantID $AadTenant -EnvironmentName $EnvironmentName -AzureStackCredentials $stackLoginCreds } |
                Should Not Throw
        }
        It 'Get-AzsScaleUnit should not throw' {
            { Get-AzsAlert -TenantID $AadTenant -EnvironmentName $EnvironmentName -AzureStackCredentials $stackLoginCreds } |
                Should Not Throw
        }
        It 'Get-AzsScaleUnitNode should not throw' {
            { Get-AzsScaleUnitNode -TenantID $AadTenant -EnvironmentName $EnvironmentName -AzureStackCredentials $stackLoginCreds } |
                Should Not Throw
        }
        It 'Get-AzsStorageCapacity should not throw' {
            { Get-AzsStorageCapacity -TenantID $AadTenant -EnvironmentName $EnvironmentName -AzureStackCredentials $stackLoginCreds } |
                Should Not Throw
        }
        It 'Get-AzsInfrastructureRole should not throw' {
            { Get-AzsInfrastructureRole -TenantID $AadTenant -EnvironmentName $EnvironmentName -AzureStackCredentials $stackLoginCreds } |
                Should Not Throw
        }
        It 'Get-AzsInfrastructureRoleInstance should not throw' {
            { Get-AzsInfrastructureRoleInstance -TenantID $AadTenant -EnvironmentName $EnvironmentName -AzureStackCredentials $stackLoginCreds } |
                Should Not Throw
        }
        It 'Get-AzsStorageShare should not throw' {
            { Get-AzsStorageShare -TenantID $AadTenant -EnvironmentName $EnvironmentName -AzureStackCredentials $stackLoginCreds } |
                Should Not Throw
        }
        It 'Get-Azslogicalnetwork should not throw' {
            { Get-Azslogicalnetwork -TenantID $AadTenant -EnvironmentName $EnvironmentName -AzureStackCredentials $stackLoginCreds } |
                Should Not Throw
        }
        
        It 'Get-AzsUpdateSummary should not throw' {
            { Get-AzsUpdateSummary -TenantID $AadTenant -EnvironmentName $EnvironmentName -AzureStackCredentials $stackLoginCreds } |
                Should Not Throw
        }
        It 'Get-AzsUpdate should not throw' {
            { Get-AzsUpdate -TenantID $AadTenant -EnvironmentName $EnvironmentName -AzureStackCredentials $stackLoginCreds } |
                Should Not Throw
        }
        It 'Set-AzsLocationInformation should not throw' {
            { Set-AzsLocationInformation -TenantID $AadTenant -EnvironmentName $EnvironmentName -AzureStackCredentials $stackLoginCreds -Region 'local' -Latitude '12.972442' -Longitude '77.580643'} |
                Should Not Throw
        }


    }
    

}
