
$url = "https://github.com/xdnw/locutus/"
$releaseFile = "C:\Users\jesse\GitHub\locutus3\build\libs\shadowJar-Locutus-1.0-SNAPSHOT-all.jar"
$releaseTitle = "Locutus (Adelphi)"
$releaseDesc = @'
## __**Changelog April 09/2024 -> May 17/2024**__
Added `worth` column to transfer sheet
Custom sheet nations are now sorted by alliance/cities/id (e.g. `/sheet_custom auto`)
Added IA audit for activity center
Added various placeholders for sheets and commands
Fixed formatting for various commands due to discord markdown changes
Added gpt-moderation checks to Mail and DM related commands (as mitigation for IA staff abusing mail commands)
Fixed interview question commands
Added `/channel sort category_filter` and `/channel sort sheet` for bulk sorting and management of nation channels (e.g. interviews) (see `/help command`)
- Includes checks such as user leaving server, nation activity/vm, duplicate channels
Added `/interview channel auto_rename` - to auto name channels based on the user's nation
Added sheet for `/alliance departures nationoralliance: `
Improved alliance join/leave tracking
Added `/role setalias locutusrole:ESPIONAGE_ALERTS`
Always included online nations in spy alerts instead of only the current probability ones / exclude treatied allies 
Added `/war room delete_planning`
Added `/war room delete_for_enemies`
Updated `/treaty gw_nap`
Added `/tax set_from_sheet sheet:` to bulk set tax brackets based on a spreadsheet (as alternative to filter based tax automation)
Added setting `MEMBER_CAN_ESCROW` (default: false), fixed a bug with escrow commands
Fixed continent bug with optimalbuild slash
Update `!Grant` commands retain instructions after confirmation
Improved `/war counter nation` new arguments and feedback
'@
$tagName = "v2.3.3"


$splitUrl = $url.Split("/")
$repoOwner = $splitUrl[3]
$repoName = $splitUrl[4]


# Navigate to the repository directory
Set-Location -Path "C:\Users\jesse\GitHub\locutus3" # Replace with your repository path

# Create a new release
gh release create $tagName -t $releaseTitle -n $releaseDesc

# Upload the file to the release
gh release upload $tagName $releaseFile