package
{
	import flash.external.ExternalInterface;
	import flash.text.TextField;
	
	public class TestJavascript
	{
		private	var	targetLabel:TextField;
		public function TestJavascript(label:TextField)
		{
			targetLabel = label;

		}

	
		public	function	callFunction() : void
		{
			if( ExternalInterface.available )
			{
				ExternalInterface.addCallback("TestJavascriptCallback", callback);
				ExternalInterface.call("TestFunction");
				trace("呼び出し完了");
			}
		}

		public	function	callback(text:String) : void
		{
			targetLabel.text = "コールバック完了[" + text + "]";
		}

		
		public	function	passArray() : void
		{
			ExternalInterface.addCallback("passArrayCallback", passArrayCallback);
			ExternalInterface.call("passArray");
		}
		
		public	function	passArrayCallback(list:Array) : void
		{
			trace("受け取った配列:" + list);
		}

	}
}