# ATTiny13A 内部オシレータ簡易キャリブレーションツール

ATTiny13Aの内部オシレータのキャリブレーションを行うための簡易なツールです。
ATTiny13A以外でも多分使えます。

# 環境
* OSX Yosemite
* USB-UARTコンバータ
* CrossPack AVR
* Perl(Carton)	

# 配線
	PB1(6番ピン)をUSB-SerialアダプタのRXに接続します。

# ATTiny13Aへのインストール

	$ make
	$ make fuse
	$ make flash

# フィルタツールの実行

	$ cd Reciever
	$ carton install
	$ carton exec ./serial.pl /dev/cu.usbserial-XXXXXX

	***** OSCCAL=92 *****
	***** OSCCAL=93 *****
	***** OSCCAL=94 *****
	***** OSCCAL=95 *****
	***** OSCCAL=96 *****
	***** OSCCAL=97 *****
	***** OSCCAL=98 *****
	***** OSCCAL=99 *****
	***** OSCCAL=100 *****

しばらくすると上のように表示されます。うまく表示される連番のOSCCALの真ん中あたりの数字がだいたいいい感じの値です。この場合96くらい。このOSCCALの値を新しく作成するプログラムのmain() の最初のほうに OSCCAL=96; みたいな感じで書きます。

