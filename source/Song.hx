package;

import Section.SwagSection;
import haxe.Json;
import haxe.format.JsonParser;
import lime.utils.Assets;
#if cpp
import sys.FileSystem;
import sys.io.File;
#end

using StringTools;

typedef SwagSong =
{
	var song:String;
	var notes:Array<SwagSection>;
	var bpm:Float;
	var needsVoices:Bool;
	var speed:Float;
	var mania:Int;
	//var noteValues:Array<Float>;

	var player1:String;
	var player2:String;
	var gfVersion:String;
	var noteStyle:String;
	var stage:String;
	var validScore:Bool;
	
	var player1extra:Array<String>; //intended for shaggy x matt kinda thing
	var player2extra:Array<String>;
	var player1extraalt:Array<Bool>; //which chars use alt animation
	var player2extraalt:Array<Bool>;
	
	var IsEndless:Bool;
	var LoopStart:Float;
	var LoopEnd:Float;
}

class Song
{
	public var song:String;
	public var notes:Array<SwagSection>;
	public var bpm:Float;
	public var needsVoices:Bool = true;
	public var speed:Float = 1;
	public var mania:Int = 0;
	//public var noteValues:Array<Float> = [0, 0.01, 0.45, 2.2, 1, 0.005]; //this never ended up working :(
	//0 = global health drain
	//1 = note specific health drain
	//2 = fire note values
	//3 = death note values
	//4 = warning note values
	//5 = glitch/bob arrow values

	public var player1:String = 'bf';
	public var player2:String = 'dad';
	public var gfVersion:String = '';
	public var noteStyle:String = '';
	public var stage:String = '';
	
	public var player1extra:Array<String> = new Array<String>();
	public var player2extra:Array<String> = new Array<String>();
	public var player1extraalt:Array<Bool> = new Array<Bool>();
	public var player2extraalt:Array<Bool> = new Array<Bool>();
	
	public var IsEndless:Bool = false;
	public var LoopStart:Float = 0.0;
	public var LoopEnd:Float = 0.0;

	public function new(song, notes, bpm)
	{
		this.song = song;
		this.notes = notes;
		this.bpm = bpm;
	}
	

	public static function loadFromJsonRAW(rawJson:String)
	{
		while (!rawJson.endsWith("}"))
		{
			rawJson = rawJson.substr(0, rawJson.length - 1);
			// LOL GOING THROUGH THE BULLSHIT TO CLEAN IDK WHATS STRANGE
		}
	
		return parseJSONshit(rawJson);
	}

	public static function loadFromJson(jsonInput:String, ?folder:String):SwagSong
	{
		// pre lowercasing the folder name
		var folderLowercase = StringTools.replace(folder, " ", "-").toLowerCase();
		switch (folderLowercase) {
			case 'dad-battle': folderLowercase = 'dadbattle';
			case 'philly-nice': folderLowercase = 'philly';
		}
		
		trace('loading ' + folderLowercase + '/' + jsonInput.toLowerCase());

		return loadFromJsonRAW(LoadJSON(Paths.json(folderLowercase + '/' + jsonInput.toLowerCase())));
	}
	

	public static function LoadJSON(FilePath:String):String
	{
		#if cpp
		if (!Assets.exists(FilePath)) {
			if (FileSystem.exists(FilePath)) {
				return File.getContent(FilePath).trim();
			} else {
				//don't do anything about it
				//the game's gonna crash
				//idk what to do about it
				//not even return can save this (it just fails compile)
			}
		}
		#end

		return Assets.getText(FilePath).trim();
	}

	public static function parseJSONshit(rawJson:String):SwagSong
	{
		var swagShit:SwagSong = cast Json.parse(rawJson).song;
		swagShit.validScore = true;
		return swagShit;
	}
}
