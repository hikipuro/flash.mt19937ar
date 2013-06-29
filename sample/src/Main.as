package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import mt19937ar.init_genrand;
	import mt19937ar.init_by_array;
	import mt19937ar.genrand_int32;
	import mt19937ar.genrand_int31;
	import mt19937ar.genrand_real1;
	import mt19937ar.genrand_real2;
	import mt19937ar.genrand_real3;
	import mt19937ar.genrand_res53;
	
	/**
	 * Mersenne Twister を FlasCC で Flash に移植してみるテスト.
	 * http://www.math.sci.hiroshima-u.ac.jp/~m-mat/MT/MT2002/mt19937ar.html
	 * @author Hikipuro
	 */
	public class Main extends Sprite 
	{
		public function Main():void {
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			// 初期化
			init_genrand((new Date()).time);
			
			//var array:Array = [0x123, 0x234, 0x345, 0x456];
			//init_by_array(array, array.length);
			
			// 乱数取得
			for (var i:int = 0; i < 10; i++) {
				trace(genrand_int32());
				trace(genrand_int31());
				trace(genrand_real1());
				trace(genrand_real2());
				trace(genrand_real3());
				trace(genrand_res53());
			}
			
			// Flash の Math.random() と実行時間を比べてみる
			_bench('Math.random()', function ():void {
				for (var i:int = 0; i < 1000000; i++) {
					var n:Number = Math.random();
				}
			});
			
			_bench('genrand_int32()', function ():void {
				for (var i:int = 0; i < 1000000; i++) {
					var n:Number = genrand_int32();
				}
			});
			
			_bench('genrand_int31()', function ():void {
				for (var i:int = 0; i < 1000000; i++) {
					var n:Number = genrand_int31();
				}
			});
			
			_bench('genrand_real1()', function ():void {
				for (var i:int = 0; i < 1000000; i++) {
					var n:Number = genrand_real1();
				}
			});
			
			_bench('genrand_real2()', function ():void {
				for (var i:int = 0; i < 1000000; i++) {
					var n:Number = genrand_real2();
				}
			});
			
			_bench('genrand_real3()', function ():void {
				for (var i:int = 0; i < 1000000; i++) {
					var n:Number = genrand_real3();
				}
			});
			
			_bench('genrand_res53()', function ():void {
				for (var i:int = 0; i < 1000000; i++) {
					var n:Number = genrand_res53();
				}
			});
		}
		
		/**
		 * ベンチマーク用.
		 * @param	name 実行するベンチマークの名前.
		 * @param	f 実行時間を計るメソッド.
		 */
		private function _bench(name:String, f:Function):void {
			trace('----- bench: ' + name);
			var st:Number = (new Date()).time;
			f();
			var ed:Number = (new Date()).time;
			trace('----- time: ' + (ed - st) + 'ms');
		}
	}
	
}