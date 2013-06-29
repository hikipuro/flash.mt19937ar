#include "AS3/AS3.h"
#include "mt19937ar.h"

void _init_genrand() __attribute__((used,
	annotate("as3sig:public function init_genrand(s:uint):void")));

void _init_by_array() __attribute__((used,
	annotate("as3sig:public function init_by_array(init_key:Array, key_length:int):void")));

void _genrand_int32() __attribute__((used,
	annotate("as3sig:public function genrand_int32():uint")));

void _genrand_int31() __attribute__((used,
	annotate("as3sig:public function genrand_int31():int")));

void _genrand_real1() __attribute__((used,
	annotate("as3sig:public function genrand_real1():Number")));

void _genrand_real2() __attribute__((used,
	annotate("as3sig:public function genrand_real2():Number")));

void _genrand_real3() __attribute__((used,
	annotate("as3sig:public function genrand_real3():Number")));

void _genrand_res53() __attribute__((used,
	annotate("as3sig:public function genrand_res53():Number")));

void _init_genrand() {
	unsigned long s;
	inline_as3(
		"%0 = s;\n"
		: "=r"(s) :
	);
	init_genrand(s);
}

void _init_by_array() {
	unsigned long *init_key;
	int key_length;
	inline_as3(
		"%0 = init_key;\n"
		: "=r"(init_key), "=r"(key_length) :
	);
	init_by_array(init_key, key_length);
}

void _genrand_int32() {
	inline_as3(
		"return %0;\n"
		:: "r"(genrand_int32())
	);
}

void _genrand_int31() {
	inline_as3(
		"return %0;\n"
		:: "r"(genrand_int31())
	);
}

void _genrand_real1() {
	inline_as3(
		"return %0;\n"
		:: "r"(genrand_real1())
	);
}

void _genrand_real2() {
	inline_as3(
		"return %0;\n"
		:: "r"(genrand_real2())
	);
}

void _genrand_real3() {
	inline_as3(
		"return %0;\n"
		:: "r"(genrand_real3())
	);
}

void _genrand_res53() {
	inline_as3(
		"return %0;\n"
		:: "r"(genrand_res53())
	);
}

int main() {
	AS3_GoAsync();
}
