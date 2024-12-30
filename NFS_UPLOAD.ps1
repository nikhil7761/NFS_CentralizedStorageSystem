# Define variables
$SourceDir = "C:\Users\CAPRICON\Desktop\Nikhil_Devops"    # Local directory path
$TargetDir = "\\172.30.1.23/mnt/shared/"   

if (-Not (Test-Path -Path $SourceDir)) {
    Write-Host "Error: Source directory $SourceDir does not exist."
    Exit 1
}

if (-Not (Test-Path -Path $TargetDir)) {
    Write-Host "Error: Target directory $TargetDir is not accessible."
    Exit 1
}

try {
    Copy-Item -Path $SourceDir -Destination $TargetDir -Recurse -Force -ErrorAction Stop
    Write-Host "Files uploaded successfully from $SourceDir to $TargetDir."
} catch {
    Write-Host "Error: Failed to upload files. $_"
    Exit 1
}

Write-Host "Upload script completed."
Exit 0
