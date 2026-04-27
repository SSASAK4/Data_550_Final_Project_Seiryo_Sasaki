# DATA 550 Final Project — Seiryo Sasaki

## Overview
This report analyzes a global dataset covering economics, education,
public health, and environmental indicators across countries worldwide.
It examines regional disparities in GDP, life expectancy, unemployment,
homicide rates, CO2 emissions, and tourism.

## Package Management with renv
This project uses `renv` to manage R packages. All package versions are
recorded in `renv.lock`. Run `make install` to restore the environment.

---

## Running the Report Locally

Make sure R is installed, then from the project root: make install, and make all

The final HTML report will be saved to `output/Final_Project_Data_550.html`.

---

## Running the Report with Docker

### Docker Image on DockerHub
The image is available publicly at: https://hub.docker.com/r/ssasak4/data550_final

Pull the image with: docker pull seiryosasaki/data550-final

### Generating the Report via Docker

The Makefile includes targets that mount a local `report/` folder into the
container. When the container finishes, the compiled HTML report will appear
in that folder.

**Mac/Linux:** make docker_run_mac

**Windows (git bash):** make docker_run_windows

The report will be saved to `report/Final_Project_Data_550.html`.

---

## Building the Docker Image
If you want to build the image yourself instead of pulling from DockerHub: docker build -t seiryosasaki/data550-final .

---

## Repository Contents

| Path | Description |
|------|-------------|
| `data/country_data.csv` | Raw dataset used in the analysis |
| `code/00_data_prep.R` | Data cleaning and subsetting |
| `code/01_table_one.R` | Code for Table 1 (summary stats by region) |
| `code/02_graph_one.R` | Code for Figure 1 (Africa population bar chart) |
| `Final_Project_DATA_550.Rmd` | Main R Markdown report file |
| `Makefile` | Builds the report; includes Docker run targets |
| `Dockerfile` | Builds the Docker image for reproducible report generation |
| `renv.lock` | Lockfile recording all package versions |
| `renv/` | renv infrastructure files |
| `output/` | Generated outputs (table, figure, HTML report) |
| `report/` | Docker output directory (compiled report lands here) |