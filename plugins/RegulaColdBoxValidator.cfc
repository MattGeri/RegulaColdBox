component name="RegulaColdBoxValidator" singleton {
	
	property name="validationConstraints";
	
	public function RegulaColdBoxValidator() {
		validationConstraints = getSetting("validation").sharedConstraints;
	}
	
	public function validate(string constraintGroup, string constraintName) {
		return "";
	}
	
	private function injectRegula() {
		return "";
	}
	
}