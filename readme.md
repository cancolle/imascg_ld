#これなんぞ

第45回R勉強会＠東京（#TokyoR）のLTで行ったアイドルマスターシンデレラガールズに関して分析したものです。
発表時のスライドは[こちら](#)
※リンク切れ中

#ファイルたちの解説
* cgdata.csv, cgdata_without_name.csv
シンデレラガールズのデータ、と、その名前をアルファベットに置き換えたもの(without_name)
* lig.csv, lig_without_name.csv
教師データである、ラブライブ、アイマス、ガールフレンド(仮)のデータ、と、その名前をアルファベットに置き換えたもの(without_name)
* imaslike.R  
最初行っていた判別分析(結局、問題ありそうなので却下)
* imas_svm.R  
実際に発表したSVMのやつ
* imas_dl.R
暇なおじさんがDeep Learning版(h2oパッケージ)を作った
