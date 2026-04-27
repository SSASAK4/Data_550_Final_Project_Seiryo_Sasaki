.PHONY: all clean install

install:
	Rscript -e "renv::restore()"

all: output/Final_Project_Data_550.html

# Step 1: prep data
output/subset_data.rds: data/country_data.csv
	Rscript code/00_data_prep.R

# Step 2: build table
output/table_one.rds: output/subset_data.rds
	Rscript code/01_table_one.R

# Step 3: build figure
output/graph_one.png: output/subset_data.rds
	Rscript code/02_graph_one.R

# Step 4: render the report
output/Final_Project_Data_550.html: Final_Project_Data_550.Rmd output/table_one.rds output/graph_one.png
	Rscript -e "rmarkdown::render('Final_Project_Data_550.Rmd', output_dir = 'output')"

clean:
	rm -f output/*.rds output/*.png output/*.html *html