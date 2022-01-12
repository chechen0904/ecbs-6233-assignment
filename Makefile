STATA = stata-se -b do

results/regression_analysis.rtf: code/4_analysis.do data/processed-data/cleaned-data.dta
	mkdir -p $(dir $@)
	$(STATA) $^ $@

results/summarize_table.txt: code/3_check_summarize.do data/processed-data/cleaned-data.dta
	mkdir -p $(dir $@)
	$(STATA) $^ $@

data/processed-data/cleaned-data.dta: code/2_clean_data.do data/processed-data/merged-data.dta
	mkdir -p $(dir $@)
	$(STATA) $^ $@

data/processed-data/merged-data.dta: code/1_import_and_merge_data.do data/raw-data/hh.dta data/raw-data/ind.dta data/raw-data/master.dta
	mkdir -p $(dir $@)
	$(STATA) $^ $@

install:
	stata-se -b ssc install outreg2, replace
	stata-se -b ssc install estout, replace