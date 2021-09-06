# This could be added to the powershell profile or with a powershell module.


function Set-BlogTFEnv () {
    $RESOURCE_GROUP_NAME = "blog_tfstate"
    $STORAGE_ACCOUNT_NAME = "blogtfstate"
    $ACCOUNT_KEY = (Get-AzStorageAccountKey -ResourceGroupName $RESOURCE_GROUP_NAME -Name $STORAGE_ACCOUNT_NAME)[0].value
    $env:ARM_ACCESS_KEY = $ACCOUNT_KEY
}

Set-BlogTFEnv

