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
						case "required":
							outputBuffer &= "@Required" & getRuleMessageIfExists("requiredMessage", currentRules) & " ";
							break;
						case "type":
							outputBuffer &= getTypeRule(currentRules) & " ";
							break;
						case "size":
							break;
						case "range":
							break;
						case "regex":
							break;
						case "sameAs":
							break;
						case "sameAsNoCase":
							break;
						case "discrete":
							break;
						case "min":
							break;
						case "max":
							break;
					}
				}
			}
		}
		
		return rtrim(outputBuffer);
	}
	
	private function injectRegula() {
		return "";
	}
	
	private function getRuleMessageIfExists(required string ruleMessage, required struct rulesStruct) {
		if (structKeyExists(rulesStruct, ruleMessage)) {
			return "(message='" & rulesStruct[ruleMessage] & "')";
		}
		
		return "";
	}
	
	private function getTypeRule(required struct rulesStruct) {
		var typeOutputBuffer = "";
		
		switch(rulesStruct['type']) {
			case "email":
				typeOutputBuffer &= "@Email";
				break;
			case "alpha":
				typeOutputBuffer &= "@Alpha";
				break;
			case "numeric":
				typeOutputBuffer &= "@Numeric";
				break;
			case "integer":
				typeOutputBuffer &= "@Integer";
				break;
		}
		
		if (len(typeOutputBuffer) > 0) {
			typeOutputBuffer &= getRuleMessageIfExists("typeMessage", rulesStruct);
		}
		
		return typeOutputBuffer;
	}
	
}