args input_file output_file

use "`input_file'", clear

*Check the descriptive statistics of the variables
summarize investment_risk_preference happiness female age age2 ///
education_level rural_household_registration work_in_SOE financial_industry ///
unemployment total_income total_consump total_asset total_debt

*Export the table, the outreg2 command will also generate a txt file
outreg2 using "`output_file'", replace sum(log) title(Decriptive statistics)