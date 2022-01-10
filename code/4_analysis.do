args input_file output_file

use "`input_file'", clear

*Regress using the basic variables
quietly reg investment_risk_preference happiness female age, robust
estimate store reg1

*Regress using basic + composite variables
quietly reg investment_risk_preference happiness female age age2 ///
total_income total_consump total_asset total_debt, robust
estimate store reg2

*Regress using all independent variables
quietly reg investment_risk_preference happiness female age age2 ///
education_level rural_household_registration work_in_SOE financial_industry ///
unemployment total_income total_consump total_asset total_debt, robust
estimate store reg3

*Compare the regression results and export
esttab reg1 reg2 reg3 using "`output_file'", p(%9.2f) staraux replace