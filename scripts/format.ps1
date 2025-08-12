
<#PSScriptInfo

.VERSION 1.0

.GUID f2740122-b7cd-49f9-8c06-3be1d2414b37

.AUTHOR waraken (email: a_m_@hotmail.co.jp)

.COMPANYNAME

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
- only-contains-comfyui-custom-scripts.csvを読み込み、categoryを1001に設定
- autocomplete.txtに追記する

#> 
param()
$content = Get-Content ./resource/only-contains-comfyui-custom-scripts.csv | ConvertFrom-Csv

$content | Add-Member -NotePropertyName category -NotePropertyValue "1001"

$content | Select-Object tag,category,hit,translate | ConvertTo-Csv -NoHeader -QuoteFields translate | Out-File ./autocomplete.txt -Append
