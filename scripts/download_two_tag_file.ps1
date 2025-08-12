
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
- ComfyUI-Custom-Scripts のdanbooru-tags.txtをダウンロード
- himamon/ComfyUIJapaneseTagAutoCompleteCSVのautocomplete.txtをダウンロード
- 2つのファイルを比較して差分をtemp/diff.txtに出力する
#> 

Param()


$danbooru = Invoke-RestMethod https://gist.githubusercontent.com/pythongosssss/1d3efa6050356a08cea975183088159a/raw/a18fb2f94f9156cf4476b0c24a09544d6c0baec6/danbooru-tags.txt | convertFrom-Csv -Header "tag","hit"
$autocomplete = Invoke-RestMethod https://raw.githubusercontent.com/himamon/ComfyUIJapaneseTagAutoCompleteCSV/refs/heads/main/autocomplete.txt | ConvertFrom-Csv -Header "tag","category","hit","translate"

$diff = $autocomplete | Compare-Object -Property tag -ReferenceObject $danbooru

$diff | ConvertTo-Csv | Out-File temp/diff.txt
