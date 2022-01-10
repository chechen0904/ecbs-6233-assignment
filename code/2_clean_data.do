args input_file output_file

use "`input_file'", clear

/*Generate an investment risk preference variable with a value of 3 
when the household member has a high investment risk preference, 
2 for a medium investment risk preference as well as 
1 for a low investment risk preference or risk aversion.*/
recode h3104 (1=3)(2=3)(3=2)(4=1)(5=1)(6=2), gen(investment_risk_preference)
drop if investment_risk_preference == .

/*Generate a dummy variable for happiness. 
The variables are derived from a question on the questionnaire "Do you feel happy now?". 
The variable is assigned a value of 1 when the household member answers very happy or happy, 
and 0 for any other answers.*/
gen happiness = .
replace happiness = 1 if h3514 == 1 | h3514 == 2
replace happiness = 0 if h3514 == 3 | h3514 == 4
drop if happiness == .

gen female = .
replace female = 0 if a2003 == 1
replace female = 1 if a2003 == 2
drop if female == .

gen age = 2017 - a2005
drop if age == .

gen age2 = age*age

rename a2012 education_level
drop if education_level == .

/*Generate a dummy variable for the rural household registration. 
If the family member owns a rural household registration, assign a value of 1; 
if not, assign a value of 0.*/
gen rural_household_registration = .
replace rural_household_registration = 1 if a2022 == 1
replace rural_household_registration = 0 if a2022 != 1
drop if rural_household_registration == .

/*Generate a dummy variable for the SOE (state-owned enterprise). 
If the family member works for the SOE, assign a value of 1; 
if not, assign a value of 0.*/
gen work_in_SOE = 0
replace work_in_SOE = 1 if a3106 == 1 | a3106 == 2
drop if work_in_SOE == .

/*Generate a dummy variable for the financial industry. 
If the family member works in the financial industry, assign a value of 1; 
if not, assign a value of 0.*/
gen financial_industry = 0
replace financial_industry = 1 if a3110 == 10 | a3111d == 5
drop if financial_industry == .

/*Generate a dummy variable for the unemployment. 
If the family member works is unemployed, assign a value of 1; 
if not, assign a value of 0.*/
gen unemployment = 0
replace unemployment = 1 if a3131 == 1 | a3131 == 4 | a3131 == 5 | a3145 == 1 | f3001 == 1
drop if unemployment == .

*Keep the variables I need for subsequent analysis
keep hhid pline investment_risk_preference happiness female age age2 education_level ///
rural_household_registration work_in_SOE financial_industry unemployment total_income ///
total_consump total_asset total_debt

*Adding the label to the variable
label var hhid "ID for each household"
label var pline "ID for each household family member"
label var investment_risk_preference "Variable for the household member's investment risk preference"
label var happiness "Dummy variable for whether the household member feels happiness"
label var female "Gender dummy variable"
label var age "Household member's age"
label var age2 "Age square"
label var education_level "The education level of the family member"
label var rural_household_registration "Whether the family member owns rural household registration"
label var work_in_SOE "Whether the family member works in a SOE"
label var financial_industry "Whether the family member works in financial industry"
label var unemployment "Whether the family member is unemployed"
label var total_income "Total income of the family"
label var total_consump "Total consumption of the family"
label var total_asset "Total assets of the family"
label var total_debt "Total debts of the family"

save "`output_file'", replace