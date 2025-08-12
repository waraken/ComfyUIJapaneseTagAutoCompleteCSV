
<#PSScriptInfo

.VERSION 1.0

.GUID a5b9e203-fcbe-41e7-a357-de33835a66be

.AUTHOR waraken (email: a_m_@hotmail.co.jp)

.COPYRIGHT waraken (c) 2025

.TAGS

.LICENSEURI https://raw.githubusercontent.com/waraken/ComfyUIJapaneseTagAutoCompleteCSV/main/LICENSE

.PROJECTURI https://github.com/waraken/ComfyUIJapaneseTagAutoCompleteCSV

.ICONURI

.EXTERNALMODULEDEPENDENCIES 

.REQUIREDSCRIPTS

.EXTERNALSCRIPTDEPENDENCIES

.RELEASENOTES


.PRIVATEDATA

#>

<# 

.DESCRIPTION 
- $Criteria以上のヒット数を持つタグを抽出し、autocomplete-lite.csvに出力する
- デフォルトではヒット数が10000以上のタグを抽出する
- ヒット数の基準は引数で指定可能
#> 

param(
    [int]$Criteria = 10000
)

$Content = Get-Content ./autocomplete.txt | ConvertFrom-Csv -Header "tag", "category", "hit", "translate" | Where-Object { ([int]$_.hit) -GE $Criteria }

$Content | Select-Object tag, category, hit, translate | ConvertTo-Csv -NoHeader -QuoteFields translate | Out-File ./autocomplete-lite.txt
