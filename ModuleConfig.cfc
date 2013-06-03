component output = false {

	this.title 				= "Regula ColdBox Module";
	this.author 			= "Matt Geri";
	this.webURL 			= "http://mattgeri.com";
	this.description 	= "A ColdBox module that creates JS client side validation rules to forms using Regula based on ColdBox validation rules";
	this.version			= "0.1";
		
	function configure() {
		conventions = {
			pluginsLocation = "plugins"
		};
		
		interceptors = [
			{
				class = "modules.RegulaColdBox.interceptors.RegulaColdBoxInterceptor",
				properties = {}
			}
		];
	}
	
	function onLoad() { }
	
}