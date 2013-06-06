component name="RegulaColdBoxValidator" singleton {
	property name="validationConstraints";
	
	public function init() {
		validationConstraints = getSetting("validation").sharedConstraints;
	}
	
	public function validate(required string constraintGroup, required string constraintName) {
		var outputBuffer = "";
		
		if (structKeyExists(variables.validationConstraints, constraintGroup)) {
			if (structKeyExists(variables.validationConstraints[constraintGroup], constraintName)) {
				var currentRules = variables.validationConstraints[constraintGroup][constraintName];
				
				for (var rule in currentRules) {
					switch (rule) {
						case "REQUIRED":
							outputBuffer = "@Required" & getRuleMessageIfExists("requiredMessage", currentRules);
							break;
					}
				}
			}
		}
		
		return outputBuffer;
	}
	
	private function injectRegula() {
		return "";
	}
	
	private function getRuleMessageIfExists(required string ruleMessage, required struct ruleStruct) {
		if (structKeyExists(ruleStruct, ruleMessage)) {
			return "(message='" & ruleStruct[ruleMessage] & "')";
		}
		
		return "";
	}
	
}