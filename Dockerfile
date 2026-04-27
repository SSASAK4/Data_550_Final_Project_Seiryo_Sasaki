FROM --platform=linux/amd64 rocker/verse:4.4.2

WORKDIR /project

COPY renv.lock renv.lock
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

RUN Rscript -e "renv::restore()"

COPY . .

RUN mkdir -p output report

ENV RENV_CONFIG_AUTOLOADER_ENABLED=FALSE

CMD make all && cp output/Final_Project_DATA_550.html report/