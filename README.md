# ecbs-6233-assignment-CheCHEN
![](https://img.shields.io/badge/Process-100%25-green) 
![](https://img.shields.io/badge/Email-chen__che@student.ceu.edu-lightgrey.svg?style=social&logo=github)

Welcome! This is the assignment repository for the course of Empirical Research Methods.
> [Assignment Description Link](https://ceu-economics-and-business.github.io/2021-11-02-ECBS-6233/assignment/ "Assignment Description Link")

## Author
- [Che CHEN](https://helloche.cc/)

## Statement about rights
The author of the manuscript have legitimate access to and permission to use the data used in this manuscript.

## Details about this assignment
I chose track2, and in this assignment I want to study on the effect of happiness on household risk investment preference.

# Data
## Source of the data
> [Data source link](http://chfs.swufe.edu.cn/datas/ "Data source link")

Note: To access the data you need to apply with your real name and sign a contract after approval before you can use it.

## License
https://chfser.swufe.edu.cn/datas/Home/NewsDetail/45

Note: License requires real name registration then login to view.

## Data description
The data used in this study is from the China Household Financial Survey Project (CHFS) organized and managed by China Household Financial Survey and Research Center, Southwestern University of Finance and Economics. 

I used data from 2017, which contains three dta files. `data/raw-data/hh.dta` is for the household part, `data/raw-data/ind.dta` is for the individual part, and `data/raw-data/master.dta` provides data related to non-questionnaire variables such as sample geographic information, composite variables (total household income, total household consumption total household assets, total household debt) etc. Since the data is too large, I have used `zip` to compress the three dta files, if you want to use them you need to download and then `unzip`.

There are two folders in the `data` folder: `raw-data` and `processed-data`. I use `.gitignore`, which ignores the processed data obtained by running `code/1_import_and_merge_data.do` and `code/2_clean_data.do` through the `make` command, and ignores all `*.log` files.

# Description of programs/code
This project uses Stata and GNU Make. 
To install the folders of processed data and result, also the Stata packages, run `make install`.
To do all the steps written in the .do file, run `make`.
To get the specific target, run `make target`. For example, if you want to get the merged data, run `make data/processed-data/merged-data.dta`.
Note: The above commands should run from the root of the project folder.

- The script `code/1_import_and_merge_data.do` merges all raw data.
- The script `code/2_clean_data.do` cleans the raw data, including generate variables, recode variables, rename and add label to variables, keep the needed variables, delete missing values etc.
- The script `code/3_check_summarize.do` checks the descriptive statistis of the variables.
- The script `code/4_analysis.do` runs several regression equations and compare.
- Exhibits in `results` contains all the results produced by `code/3_check_summarize.do` and `code/4_analysis.do`.

# Reference
- Survey and Research Center for China Household Finance, SWUFE. 2019. "China Household Finance Survey (CHFS 2017 dta subset) [data set]" Available at http://chfs.swufe.edu.cn/datas/ Last accessed January 08, 2022.

- Li Gan & Zhichao Yin & Jijun Tan, 2016. "Report on the Development of Household Finance in Rural China (2014)," Springer Books, Springer, edition 1, number 978-981-10-0409-4, December.

## Contact me
- Email: chen_che@student.ceu.edu