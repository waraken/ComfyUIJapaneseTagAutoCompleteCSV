
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
- temp/diff.txtを読み込む
- ComfyUI-Custom-Scriptsのdanbooru-tags.txtに含まれないタグを抽出する
- resource/only-contains-comfyui-custom-scripts.csvに出力する
#> 

param()

$diff = get-content ./temp/diff.txt | ConvertFrom-Csv

$OnlyOriginalTags =  $diff | Where-Object SideIndicator -EQ "<="

$danbooru = Invoke-RestMethod https://gist.githubusercontent.com/pythongosssss/1d3efa6050356a08cea975183088159a/raw/a18fb2f94f9156cf4476b0c24a09544d6c0baec6/danbooru-tags.txt | ConvertFrom-Csv -Header "tag","rank","hit","translate"

$OnlyOriginalRows =  $danbooru | Where-Object tag -In ($OnlyOriginalTags | ForEach-Object tag)

$OnlyOriginalRows | ConvertTo-Csv | Out-File ./resource/only-contains-comfyui-custom-scripts.csv