$NVIM_DIR = "$HOME\AppData\Local"

Write-Output "This script will delete all files in $NVIM_DIR\nvim if they exist"
$Ans = Read-Host "You want to continue? y-[yes] n-[no]"

if ($Ans -eq "y")
{
    Remove-Item $NVIM_DIR/nvim -Force
    New-Item -Path $NVIM_DIR -Name "nvim" -ItemType "directory"
    Copy-Item -Path "$(Get-Item .)\*" -Destination "$NVIM_DIR/nvim" -recurse -Force
}
