STATA = stata-se -b do

data/processed-data/cleaned-data.dta: code/2_clean_data.do data/processed-data/merged-data.dta
	mkdir -p $(dir $@)
	$(STATA) $^ $@

data/processed-data/merged-data.dta: code/1_import_and_merge_data.do data/raw-data/hh.dta data/raw-data/ind.dta data/raw-data/master.dta
	mkdir -p $(dir $@)
	$(STATA) $^ $@

install:
	mkdir -p data/processed-data
	mkdir -p results