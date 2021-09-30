# create and deploy Azure Resource Manager ARM template

#sign in
az login

#set default subscription
get-AzSubscription
$context = Get-AzSubscriptionId {subID}
Set-AzContext $context

Set-AzDefault -ResourceGroupName {resourcegroupname}

#deploy template to Azure
$templateFile = "azuredeploy.json"
$date = Get-Date -Format "MM-dd-yyyy"
$deploymentName = "blanktemplate" + $date

New-AzResourceGroupdeployment -Name $deploymentName -TempleteFile $templateFile

