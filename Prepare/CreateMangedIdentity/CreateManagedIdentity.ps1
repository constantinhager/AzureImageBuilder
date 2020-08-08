# (Create resource Group first through Terraform)

# setup role def names, these need to be unique
$ImageCreationRoleName = "Azure Image Builder Service Image Creation Role"
$idenityName = "chaibIdentity"
$subscriptionID = "<your subscription id>"

$imageResourceGroup = "sig-rg"
$vnetrgname = "WorkShop"

## Add AZ PS module to support AzUserAssignedIdentity
Install-Module -Name Az.ManagedServiceIdentity

# create identity (Create resource Group first through Terraform)
New-AzUserAssignedIdentity -ResourceGroupName "sig-rg" -Name $idenityName

$idenityNameResourceId = $(Get-AzUserAssignedIdentity -ResourceGroupName "sig-rg" -Name $idenityName).Id
$idenityNamePrincipalId = $(Get-AzUserAssignedIdentity -ResourceGroupName "sig-rg" -Name $idenityName).PrincipalId

$aibjsonPath = Join-Path -Path $PSScriptRoot -ChildPath "aibRoleImageCreation.json"

((Get-Content -path $aibjsonPath -Raw) -replace '<subscriptionID>', $subscriptionID) | Set-Content -Path $aibjsonPath
((Get-Content -path $aibjsonPath -Raw) -replace '<rgName>', $imageResourceGroup) | Set-Content -Path $aibjsonPath

# create role definition
New-AzRoleDefinition -InputFile  ./aibRoleImageCreation.json

# grant role definition to image builder service principal
New-AzRoleAssignment -ObjectId $idenityNamePrincipalId -RoleDefinitionName $ImageCreationRoleName -Scope "/subscriptions/$subscriptionID/resourceGroups/$imageResourceGroup"