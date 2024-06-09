*** Settings ***

Resource    ${EXECDIR}/resources/base.resource

Test Setup     Start session
Test Teardown  Close session

*** Test Cases ***
Deve marcar as techs que usam appium
		[Tags]    checkbox
		Get Started
		Navigate to                     Check e Radio
		Go to item                      Checkbox          Marque as techs que usam Appium

		@{techs}    Create List         Ruby  Python  Java  Javascript  C#  Robot Framework
		
		FOR  ${tech}  IN  @{techs}
				Click Element               xpath=//android.widget.CheckBox[contains(@text, "${tech}")]
		END