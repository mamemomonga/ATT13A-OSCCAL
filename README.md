# ATTiny13A 内部オシレータ簡易キャリブレーションツール

ATTiny13Aの内部オシレータのキャリブレーションを行うための簡易なツールです。
ATTiny13A以外でも多分使えます。

# 環境
	* CrossPack AVR
	* Perl(Carton)	

# 配線
	PB1(6番ピン)をUSB-SerialアダプタのRXに接続します。

# ATTiny13Aへのインストール

	$ make
	$ make fuse
	$ make flash

# スキャナーの実行

	$ cd Reciever
	$ carton install
	$ carton exec ./serial.pl /dev/cu.usbserial-XXXXXX

	***** OSCCAL=95 *****

と言う風に番号が表示されます。うまく表示されるOSCCALの真ん中あたりの数字がだいたいいい感じの値です。
このOSCCALの値を新しく作成するプログラムのmain() の最初のほうに書きます。

