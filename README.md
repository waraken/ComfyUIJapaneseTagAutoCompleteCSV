# ComfyUI用 日本語タグオートコンプリート辞書
![image](https://github.com/user-attachments/assets/d7f6282e-13d5-4201-b88a-4f1524955b0e)

## これは何？
ComfyUIで日本語でタグ入力出来るようにするオートコンプリート辞書です。

[a1111-sd-webui-tagcomplete](https://github.com/DominikDoom/a1111-sd-webui-tagcomplete)の[danbooru.csv](https://github.com/DominikDoom/a1111-sd-webui-tagcomplete/blob/main/tags/danbooru.csv)をベースに、
1. [booru-japanese-tag](https://github.com/boorutan/booru-japanese-tag)の手動翻訳辞書[danbooru-jp.csv](https://github.com/boorutan/booru-japanese-tag/blob/main/danbooru-jp.csv)
2. [DanbooruAPI](https://danbooru.donmai.us/wiki_pages/help:api)で取得した[Wikiに掲載されているAnotherNames](https://danbooru.donmai.us/wiki_pages/api%3Awiki_pages)
3. [booru-japanese-tag](https://github.com/boorutan/booru-japanese-tag)の機械翻訳辞書[danbooru-only-machine-jp.csv](https://github.com/boorutan/booru-japanese-tag/blob/main/danbooru-only-machine-jp.csv)

の優先度でマージした物です。

## 使い方
1. ComfyUIに[ComfyUI-Custom-Scripts](https://github.com/pythongosssss/ComfyUI-Custom-Scripts)をインストールする
2. 設定 → pysssss → Text Autocomplete → Manage Custom Words を開く
3. Load Custom Listに`https://raw.githubusercontent.com/himamon/ComfyUIJapaneseTagAutoCompleteCSV/refs/heads/main/autocomplete.txt`を入力し、Loadボタンをクリックする
4. Saveボタンをクリックする

## 利用上の注意
収録しているタグ数が多いためか、テキスト入力が重たくなります。  
作品数の少ないタグ（3番目のカラムの数字が小さいタグ）を削除すると軽くなるはずです。
