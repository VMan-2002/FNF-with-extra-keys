package;

#if windows
import Sys.sleep;
//import discord_rpc.DiscordRpc;

using StringTools;

class DiscordClient
{
	public function new()
	{
		/*
		start();

		var IsAvailable = FlxG.save.data.hideDiscord != 2;

		while (true)
		{
			if (IsAvailable != (FlxG.save.data.hideDiscord != 2)) {
				IsAvailable = FlxG.save.data.hideDiscord != 2;
				if (IsAvailable) {
					start();
				} else {
					shutdown();
				}
			} else if (IsAvailable) {
				DiscordRpc.process();
				sleep(2);
				//trace("Discord Client Update");
			}
			sleep(2);
		}

		if (IsAvailable) {
			DiscordRpc.shutdown();
		}
		*/
	}

	public static function start()
	{
		/*trace("Discord Client starting...");
		DiscordRpc.start({
			clientID: "557069829501091850", // change this to what ever the fuck you want lol
			onReady: onReady,
			onError: onError,
			onDisconnected: onDisconnected
		});
		trace("Discord Client started.");*/
	}

	public static function shutdown()
	{
		//DiscordRpc.shutdown();
	}

	static function onReady()
	{
		/*
		DiscordRpc.presence({
			details: "In the Menus",
			state: null,
			largeImageKey: 'icon',
			largeImageText: "fridaynightfunkin"
		});
		*/
	}

	static function onError(_code:Int, _message:String)
	{
		trace('Error! $_code : $_message');
	}

	static function onDisconnected(_code:Int, _message:String)
	{
		trace('Disconnected! $_code : $_message');
	}

	public static function initialize()
	{
		/*
		var DiscordDaemon = sys.thread.Thread.create(() ->
		{
			new DiscordClient();
		});
		trace("Discord Client initialized");
		*/
	}

	public static function changePresence(details:String, state:Null<String>, ?smallImageKey : String, ?hasStartTimestamp : Bool, ?endTimestamp: Float, ?HiddenText:String)
	{
		/*
		var startTimestamp:Float = if(hasStartTimestamp) Date.now().getTime() else 0;

		if (endTimestamp > 0)
		{
			endTimestamp = startTimestamp + endTimestamp;
		}
		
		if (HiddenText != null && FlxG.save.data.hideDiscord == 1) {
			details = HiddenText;
		}

		DiscordRpc.presence({
			details: details,
			state: state,
			largeImageKey: 'icon',
			largeImageText: "fridaynightfunkin",
			smallImageKey : smallImageKey,
			// Obtained times are in milliseconds so they are divided so Discord can use it
			startTimestamp : Std.int(startTimestamp / 1000),
            endTimestamp : Std.int(endTimestamp / 1000)
		});
		*/

		//trace('Discord RPC Updated. Arguments: $details, $state, $smallImageKey, $hasStartTimestamp, $endTimestamp');
	}
}
#end