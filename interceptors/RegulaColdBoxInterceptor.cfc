component name="RegulaColdBoxInterceptor" extends="coldbox.system.Interceptor" {

	property name="jsPath" inject="coldbox:setting:regula_js_path@RegulaColdBox";

	public function configure() { }
	
	public function afterPluginCreation(event, interceptData) {
		if(isInstanceOf(arguments.interceptData.oPlugin, "coldbox.system.plugins.Renderer")){
			arguments.interceptData.oPlugin.regula = getMyPlugin(plugin="RegulaColdBoxValidator", module="RegulaColdBox");
			arguments.interceptData.oPlugin.$regulaInject = variables.$regulaInject;
			arguments.interceptData.oPlugin.$regulaInject();
		}
	}
	
	public function preViewRender() {
		$htmlhead('<script src="#jsPath#regula-min.js" type="text/javascript"></script>');
	}
	
	private function $regulaInject() {
		variables.regula = this.regula;
	}
	
}