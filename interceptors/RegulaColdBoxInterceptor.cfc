component name="RegulaColdBoxInterceptor" extends="coldbox.system.Interceptor" {

	function configure() { }
	
	function afterPluginCreation(event, interceptData) {
		if(isInstanceOf(arguments.interceptData.oPlugin, "coldbox.system.plugins.Renderer")){
			arguments.interceptData.oPlugin.regula = getMyPlugin(plugin="RegulaColdBoxValidator", module="RegulaColdBox");
			arguments.interceptData.oPlugin.$regulaInject = variables.$regulaInject;
			arguments.interceptData.oPlugin.$regulaInject();
		}
	}
	
	function $regulaInject() {
		variables.regula = this.regula;
	}
	
}