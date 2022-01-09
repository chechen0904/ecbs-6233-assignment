/* hh is household-level data;
ind represents individual-level data;
master is non-questionnaire-level variable data. */

args hh ind master output_file

use "`hh'", clear

* hhid is the id for each household
merge 1:m hhid using "`ind'", nogen

* Each pline represents one family member
merge 1:1 hhid pline using "`master'", nogen

save "`output_file'", replace