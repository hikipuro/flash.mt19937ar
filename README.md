# ActionScript 3 用 Mersenne Twister

Mersenne Twister を ActionScript に移植してみました。  
http://www.math.sci.hiroshima-u.ac.jp/~m-mat/MT/MT2002/mt19937ar.html


概要
-----

* Flash Player 11 以降でないと動かないと思います。
* FlasCC 1.0.1 を使って、配布元のコードをそのままビルドしています。
* ビルドすると SWC で出力されます。
* as3api.c が Flash とのインターフェイス部分になります。 SWIG は使用していません。
* ActionScript のサンプルは sample フォルダに入っています。


FlasCC でのビルドの方法
------------------------

Windows の方しか分かりませんが、

* FlasCC_1.0.1/run.bat から cygwin を起動する
* export LANG=C  
を入力する
* ソースコードの入っているディレクトリに cd で移動
* make FLASCC="/path/to/FlasCC_1.0.1/sdk" FLEX="/path/to/flex_sdk_4.6/"  
で make が通ると思います


動作確認環境
-------------

* FlashDevelop 4.3.0
* Flex SDK 4.6
* Flash Player 11
* FlasCC 1.0.1


動作速度
---------

Math.random() と比べてみました (Debug ビルドで 100 万回実行した時)。

* Math.random() : 112ms
* genrand_int32() : 250ms
* genrand_int31() : 252ms
* genrand_real1() : 253ms
* genrand_real2() : 255ms
* genrand_real3() : 251ms
* genrand_res53() : 360ms

