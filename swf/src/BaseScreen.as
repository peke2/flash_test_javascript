package
{
	import flash.display.*;
	import flash.text.TextField;
	import flash.display.Loader;
	import flash.system.Security;
	
	import mx.core.UIComponent;
	
	public class BaseScreen extends UIComponent
	{
		public function BaseScreen()
		{
			var	base : Sprite = new Sprite();
			var	label : TextField = new TextField();
			label.text = "ラベル表示";
			base.addChild(label);
			addChild(base);

			//	javasscriptからのコールバックで「SecurityDomain 'null' が互換性のないコンテキスト」エラーが出た場合の対策
			var	loader:Loader = new Loader();
			//Security.allowDomain("*");
			trace(loader.contentLoaderInfo.url);
			Security.allowDomain(loader.contentLoaderInfo.url);
			//Security.allowDomain(this.root.contentLoaderInfo.url);

			var	test:TestJavascript = new TestJavascript(label);
			test.callFunction();
		}

	}
}