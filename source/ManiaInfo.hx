package;

import lime.utils.Assets;
import Controls;
import Math;

using StringTools;

typedef SwagMania =
{
	var keys:Int;
	var arrows:Array<String>;
	var controls:Array<String>;
	var arrowkeys:Map<Int, Int>;
}

class ManiaInfo
{
	public static var StrumlineArrow:Map<String, String> = [
		'purple' => "LEFT",
		'blue' => "DOWN",
		'green' => "UP",
		'red' => "RIGHT",
		'white' => "SPACE",
		'yellow' => "LEFT",
		'violet' => "DOWN",
		'darkred' => "UP",
		'dark' => "RIGHT",
		'21la' => "TRILEFT",
		'21lb' => "TRIUP",
		'21lc' => "TRIRIGHT",
		'21ld' => "TRILEFT",
		'21le' => "TRIDOWN",
		'21lf' => "TRIRIGHT",
		'21ra' => "TRILEFT",
		'21rb' => "TRIUP",
		'21rc' => "TRIRIGHT",
		'21rd' => "TRILEFT",
		'21re' => "TRIDOWN",
		'21rf' => "TRIRIGHT",
		'13a' => "TRILEFT",
		'13b' => "TRIDOWN",
		'13c' => "TRIUP",
		'13d' => "TRIRIGHT"
	];
	
	public static var PixelArrowNum:Map<String, Int> = [ //used for something?
		'purple' => 0,
		'blue' => 1,
		'green' => 2,
		'red' => 3,
		'white' => 4,
		'yellow' => 5,
		'violet' => 6,
		'darkred' => 7,
		'dark' => 8,
		'13a' => 9,
		'13b' => 10,
		'13c' => 11,
		'13d' => 12
	];
	
	public static var PixelNoteSheetWide:Int = 13; //this one is used
	
	public static var PixelArrowTypeNum:Map<String, Int> = [ //not actually used yet
		'purple' => 0,
		'blue' => 1,
		'green' => 2,
		'red' => 3,
		'white' => 4,
		'yellow' => 0,
		'violet' => 1,
		'darkred' => 2,
		'dark' => 3,
		'13a' => 5,
		'13b' => 6,
		'13c' => 7,
		'13d' => 8
	];
	
	public static var PixelNoteTypeSheetWide:Int = 9; //also now actually used yet
	
	public static var Dir:Map<String, String> = [
		'purple' => "LEFT",
		'blue' => "DOWN",
		'green' => "UP",
		'red' => "RIGHT",
		'white' => "UP",
		'yellow' => "LEFT",
		'violet' => "DOWN",
		'darkred' => "UP",
		'dark' => "RIGHT",
		'19a' => "LEFT",
		'19b' => "DOWN",
		'19c' => "UP",
		'19d' => "RIGHT"
	];
	
	public static var BfDir:Map<String, String> = [
		'purple' => "LEFT",
		'blue' => "DOWN",
		'green' => "UP",
		'red' => "RIGHT",
		'white' => "Hey",
		'yellow' => "LEFT",
		'violet' => "DOWN",
		'darkred' => "UP",
		'dark' => "RIGHT",
		'19a' => "LEFT",
		'19b' => "DOWN",
		'19c' => "UP",
		'19d' => "RIGHT"
	];
	
	public static var AvailableMania:Array<Int> = [ //for chart editor
		0, //4k
		1, //6k
		2, //9k
		3, //5k
		4, //7k
		5, //8k
		6, //1k
		7, //2k
		8, //3k
		20, //13k
		21, //12k
		22, //21k
		23, //19k
		24 //50k
	];
	
	public static function GetManiaInfo(mania:Int):SwagMania
	{
		trace('Accessed ManiaInfo for '+mania);
		switch(mania) {
			case 0: //4K
			return {
				keys: 4,
				arrows: ['purple', 'blue', 'green', 'red'],
				controls: ["LEFT", "DOWN", "UP", "RIGHT"], //Controls in ManiaInfo are Unused Lol
				arrowkeys: [37 => 0, 40 => 1, 38 => 2, 39 => 3]
			};
			case 1: //6K
			return {
				keys: 6,
				arrows: ['purple', 'green', 'red', 'yellow', 'blue', 'dark'], //apparently that causes crashing as well
				controls: ["L1", "U1", "R1", "L2", "D1", "R2"],
				arrowkeys: [37 => 3, 40 => 4, 39 => 5]
			};
			case 2: //9K
			return {
				keys: 9,
				arrows: ['purple', 'blue', 'green', 'red', 'white', 'yellow', 'violet', 'darkred', 'dark'],
				controls: ["N0", "N1", "N2", "N3", "N4", "N5", "N6", "N7", "N8"],
				arrowkeys: [37 => 5, 40 => 6, 38 => 7, 39 => 8]
			};
			case 3: //5K
			return {
				keys: 5,
				arrows: ['purple', 'blue', 'white', 'green', 'red'],
				controls: ["LEFT", "DOWN", "N4", "UP", "RIGHT"],
				arrowkeys: [37 => 0, 40 => 1, 38 => 3, 39 => 4]
			};
			case 4: //7K
			return {
				keys: 7,
				arrows: ['purple', 'green', 'red', 'white', 'yellow', 'blue', 'dark'],
				controls: ["L1", "U1", "R1", "N4", "L2", "D1", "R2"],
				arrowkeys: [37 => 4, 40 => 5, 39 => 6]
			};
			case 5: //8K
			return {
				keys: 8,
				arrows: ['purple', 'blue', 'green', 'red', 'yellow', 'violet', 'darkred', 'dark'],
				controls: ["N0", "N1", "N2", "N3", "N5", "N6", "N7", "N8"],
				arrowkeys: [37 => 4, 40 => 5, 38 => 6, 39 => 7]
			};
			case 6: //1K
			return {
				keys: 1,
				arrows: ['white'],
				controls: ["N4"],
				arrowkeys: [40 => 0] //originally no arrow keys for 1k, now you get to press down arrow
			};
			case 7: //2K
			return {
				keys: 2,
				arrows: ['purple', 'red'],
				controls: ["LEFT", "RIGHT"],
				arrowkeys: [37 => 0, 39 => 1]
			};
			case 8: //3K
			return {
				keys: 3,
				arrows: ['purple', 'white', 'red'],
				controls: ["LEFT", "N4", "RIGHT"],
				arrowkeys: [37 => 0, 38 => 1, 39 => 2] //added down arrow for middle button
			};
			case 20: //13K
			return {
				keys: 13,
				//arrows: ['yellow', 'violet', 'darkred', 'dark', 'purple', 'blue', 'white', 'green', 'red', 'yellow', 'violet', 'darkred', 'dark'],
				arrows: ['purple', 'blue', 'green', 'red', '13a', '13b', 'white', '13c', '13d', 'yellow', 'violet', 'darkred', 'dark'],
				controls: ["N0", "N1", "N2", "N3", "LEFT", "DOWN", "N4", "UP", "RIGHT", "N5", "N6", "N7", "N8"],
				arrowkeys: [37 => 4, 40 => 5, 38 => 7, 39 => 8]
			};
			case 21: //12K
			return {
				keys: 12,
				arrows: ['yellow', 'violet', 'darkred', 'dark', 'purple', 'blue', 'green', 'red', 'yellow', 'violet', 'darkred', 'dark'],
				//arrows: ['purple', 'blue', 'green', 'red', '13a', '13b', '13c', '13d', 'yellow', 'violet', 'darkred', 'dark'],
				controls: ["N0", "N1", "N2", "N3", "LEFT", "DOWN", "UP", "RIGHT", "N5", "N6", "N7", "N8"],
				arrowkeys: [37 => 4, 40 => 5, 38 => 6, 39 => 7]
			};
			case 22: //21K
			return {
				keys: 21,
				//haha 21 keys mod
				arrows: [
					'yellow', 'purple', 'blue', 'green', 'red', 'white', 'yellow', 'violet', 'darkred', 'dark',
					'white',
					'purple', 'blue', 'green', 'red', 'white', 'yellow', 'violet', 'darkred', 'dark','red'
				],
				/*arrows: [
					'21la', '21lb', '21lc', '21ld', '21le', '21lf', 
					'purple', 'blue', 'green', 'red', 'white', 'yellow', 'violet', 'darkred', 'dark'
					'21ra', '21rb', '21rc', '21rd', '21re', '21rf', 
				],*/
				//this needs controls
				//im gonna try this
				controls: ["M0", "M1", "M2", "M3", "M4", "M5", "M6", "M7", "M8", "M9", "M10", "M11", "M12", "M13", "M14", "M15", "M16", "M17", "M18", "M19", "M20"], //i hate controls.hx fuck that shit
				arrowkeys: [-1 => 0] //no arrow keys fuck u
			};
			//putting this here idk who reads this
			//there's gonna be NO assets from the original 21 keys mod ported in any way
			//there may be inspiration but nothing will be used directly or indirectly
			//any new assets will be custom made not related to the 21 keys mod
			case 23: //19K (combined 4k+6k+9k)
			return {
				keys: 19,
				arrows: [
					'purple', 'green', 'red',
					'purple', 'blue', 'green', 'red', 
					'purple', 'blue', 'white', 'green', 'red',
					'yellow', 'violet', 'darkred', 'dark',
					'yellow', 'blue', 'dark'
				],
				/*arrows: [
					'21la', '21lb', '21lc',
					'purple', 'blue', 'green', 'red', 
					'13a', '13b', 'white', '13c', '13d',
					'yellow', 'violet', 'darkred', 'dark',
					'21rd', '21re', '21rf'
				],*/
				controls: [
					"L1", "U1", "R1", 
					"N0", "N1", "N2", "N3",
					"LEFT", "DOWN", "N4", "UP", "RIGHT",
					"N5", "N6", "N7", "N8",
					"L2", "D1", "R2"
				],
				arrowkeys: [37 => 7, 40 => 8, 38 => 10, 39 => 11]
			};
			//also add combined 19k and 21k (but wHYYY you are squeezing this game to death)
			case 24: //50k (this actually not controllable)
			//"Y'know what I dare you to do it"
			//-Mr.Shadow
			return {
				keys: 50,
				arrows: [
					'purple', 'blue', 'green', 'red', 'white', 'white', 'yellow', 'violet', 'darkred', 'dark',
					'purple', 'blue', 'green', 'red', 'white', 'white', 'yellow', 'violet', 'darkred', 'dark',
					'purple', 'blue', 'green', 'red', 'white', 'white', 'yellow', 'violet', 'darkred', 'dark',
					'purple', 'blue', 'green', 'red', 'white', 'white', 'yellow', 'violet', 'darkred', 'dark',
					'purple', 'blue', 'green', 'red', 'white', 'white', 'yellow', 'violet', 'darkred', 'dark'
				],
				/*arrows: [
					'21la', '21lb', '21lc', '21ld', '21le', '21lf',
					'purple', 'blue', 'green', 'red',
					'yellow', 'violet', 'darkred', 'dark',
					'13a', '13b', 'white', '13c', '13d',
					'purple', 'green', 'red', '21la', '21lb', '21lc', '21ld', '21le', '21lf', 'yellow', 'blue', 'dark',
					'13a', '13b', 'white', '13c', '13d',
					'purple', 'blue', 'green', 'red',
					'yellow', 'violet', 'darkred', 'dark',
					'21ra', '21rb', '21rc', '21rd', '21re', '21rf'
				],*/
				controls: ["no"], //just use botplay
				//or maybe i can put some midi keyboard support
				arrowkeys: [-1 => 0] //no arrow keys
			}; //also add combined 19k and 21k (this game not alive)
		};
		//if shit goes wrong, make it fucking 0k
		return {
			keys: 0,
			arrows: ['purple'], //these still have to count as the correct data type
			controls: ["LEFT"],
			arrowkeys: [-1 => 0]
		};
	}
	
	public static function GetNoteScale(keys:Int):Float
	{
		switch(keys) {
			case 1 | 2 | 3 | 4: //4K
			return 0.7;
			case 6: //6K
			return 0.5;
			case 9: //9K
			return 0.65;
			case 5: //5K
			return 0.58;
			case 7: //7K
			return 0.55;
			case 8: //8K
			case 13: //13K
			return 0.5 / 1.5;
			default: //anything else
			return 2.8 / Math.max(keys, 4);
		}
		return 0.7;
	}
	
	public static function GetControlPress(controls:Array<String>):Array<String>
	{
		return [
			for (v in controls) {
				v += "-press";
			}
		];
	}
	
	public static function GetControlRelease(controls:Array<String>):Array<String>
	{
		return [
			for (v in controls) {
				v += "-release";
			}
		];
	}
	
	//i also put my funny helper funcs here

	public static function ArrayRepeat(max:Int, val:Any):Any
	{
		var dumbArray:Array<Int> = [];
		for (i in 0...max)
		{
			dumbArray.push(val);
		}
		return dumbArray;
	}
}
