
$url = "https://github.com/xdnw/locutus/"
$releaseFile = "C:\Users\jesse\GitHub\locutus3\build\libs\shadowJar-Locutus-1.0-SNAPSHOT-all.jar"
$releaseTitle = "Locutus July Update"
$releaseDesc = @'
Improved optimalbuild handling for manu=false and infralow, added `timeout` argument
Added `/mail read` and `/mail search`
Added transfer status summary in disburse command
Added `/embed rename button`
Add additional notes to defensive wars about how to mark alliances as enemies 
Added `/conflict edit add_forum_post`, `/conflict sync db_file` + other conflict command changes
Added who suggestions for invalid input
Remove member role requirements for some non-guild information related commands:
- build get, counterstats, various trade commands, spies, various nation placeholders
Added guiding_satellite_np and nuclear_launch_facility_np to snapshots
Added /nation vm_history command
Fixed warcostranking nuke/missile kill stats
Fixed snapshot arguments for VM and project data/filters
Fixed leftaa / alliance departures when timeframe is specified
Fixed /grant_template bug
Adapted the following legacy `!` commands to slash
- Various debug/administration commands
- /interview sheet
- /offshore list prolific
- /offshore list all
- /offshore find for_coalition
- /offshore find for_enemies
- /alers trade unsubscribe
- /alerts trade list
- /war room purge
- /admin command multiple
- /admin command format_for_nations
- /coalition sheet
- /alerts bank list
- /alerts bank unsubscribe
- /alerts bank subscribe
- /alliance stats loot_ranking
- /stats_war by_day warcost_versus
- /stats_war by_day warcost_global
- /stats_war attack_breakdown versus
- /admin dm
- /grant project
- /grant city
- /grant land
- /grant infra
- /grant build
- /grant unit
- /grant consumption
- /grant warchest

Added a notice when using a legacy command:
'@

$version = "2.3.4"
$tagName = "v$version"
$releaseDirectory = [System.IO.Path]::GetDirectoryName($releaseFile)
$uploadedFileName = [System.IO.Path]::Combine($releaseDirectory, "Locutus-$version.jar")

$splitUrl = $url.Split("/")
$repoOwner = $splitUrl[3]
$repoName = $splitUrl[4]


# Navigate to the repository directory
Set-Location -Path "C:\Users\jesse\GitHub\locutus3" # Replace with your repository path

# Create a new release
gh release create $tagName -t $releaseTitle -n $releaseDesc

# Make copy of file with uploadedFileName
Copy-Item $releaseFile $uploadedFileName
# delete it when this script exits
Register-EngineEvent PowerShell.Exiting -Action { Remove-Item $uploadedFileName }

# Upload the file to the release
gh release upload $tagName $uploadedFileName
