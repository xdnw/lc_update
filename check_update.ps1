$download = $true;
# check if file `version.txt` exists
if (Test-Path .\version.txt) {
    # read from file `version.txt`
    $CurrentVersion = Get-Content -Path .\version.txt
    # check if file is empty
    if ([string]::IsNullOrEmpty($CurrentVersion)) {
        $CurrentVersion = "0.0.0"
    }
} else {
    $CurrentVersion = "0.0.0"
}

$url = "https://github.com/xdnw/locutus/releases/latest"

$request = [System.Net.WebRequest]::Create($url)
$response = $request.GetResponse()
$realTagUrl = $response.ResponseUri.OriginalString
$ghTag = $realTagUrl.split('/')[-1]
$GitHubversion = $ghTag.Trim('v')

$updateavailable = $false
if ($CurrentVersion.split(".")[0] -lt $GitHubversion.split(".")[0]){$updateavailable = $true}
if ($CurrentVersion.split(".")[1] -lt $GitHubversion.split(".")[1]){$updateavailable = $true}
if ($CurrentVersion.split(".")[2] -lt $GitHubversion.split(".")[2]){$updateavailable = $true}

if ($updateavailable -eq $true){
    Write-Host "Update available, See Github for latest version. Your version: $CurrentVersion, Latest version: $GitHubversion"
    if ($download -eq $true){
        Write-Host "Downloading latest version..."
        $url = "https://github.com/xdnw/locutus/releases/download/$ghTag/shadowJar-Locutus-1.0-SNAPSHOT-all.jar"
        Write-Host "Downloading from $url"
        $output = "Locutus-updated.jar"
        try {
            Invoke-WebRequest -Uri $url -OutFile $output
            Write-Host "Download complete: $output"
            # update version
            $GitHubversion | Set-Content -Path .\version.txt
            Write-Host "Version updated to $GitHubversion"
        } catch {
            Write-Host "Error: $_"
            exit 1
        }
    } else {
        Write-Host "Download option is not set"
    }
} else {
    Write-Host "No update available. Your version: $CurrentVersion, Latest version: $GitHubversion"
}