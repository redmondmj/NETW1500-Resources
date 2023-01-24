$productKey = Read-Host -Prompt "Enter the product key"

slmgr.vbs -ipk $productKey

Write-Host "The product key has been applied."