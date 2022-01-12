STATA = stata-se -b do

# $^ and $@ are automatic variables 
# $^ means all sources used by the recipe 
# $@ means the target being created by the recipe 

# Run three regression equations results and export the results
results/regression_analysis.rtf: code/4_analysis.do data/processed-data/cleaned-data.dta
	mkdir -p $(dir $@)
	$(STATA) $^ $@

# Check the descriptive statistis of variables 
results/summarize_table.txt: code/3_check_summarize.do data/processed-data/cleaned-data.dta
	mkdir -p $(dir $@)
	$(STATA) $^ $@

# Clean the merged data
data/processed-data/cleaned-data.dta: code/2_clean_data.do data/processed-data/merged-data.dta
	mkdir -p $(dir $@)
	$(STATA) $^ $@

# Merge the raw datas: hh.dta, ind.dta and master.dta
data/processed-data/merged-data.dta: code/1_import_and_merge_data.do data/raw-data/hh.dta data/raw-data/ind.dta data/raw-data/master.dta
	mkdir -p $(dir $@)
	$(STATA) $^ $@

install:
	stata-se -b ssc install outreg2, replace
	stata-se -b ssc install estout, replace