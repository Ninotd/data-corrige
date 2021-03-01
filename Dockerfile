FROM jupyter/base-notebook:notebook-6.0.0

RUN pip install pandas seaborn jupyter-offlinenotebook

# ./work is found inside official jupyter images, we avoid unnecessary nesting
RUN rm -rf ./work

RUN mkdir data
COPY --chown=1000:100 data/uber_requests.csv data
COPY --chown=1000:100 data/kickstarter.csv data
COPY --chown=1000:100 data/netflix_titles.csv data
COPY --chown=1000:100 data/nyc_airbnb.csv data
COPY --chown=1000:100 ./Correction_Netflix_and_Chill.ipynb .
COPY --chown=1000:100 ./Correction_Uber_Notebook.ipynb . 
COPY --chown=1000:100 ./Correction_Livecode.ipynb .
COPY --chown=1000:100 ./Correction_Kickstarter_notebook.ipynb .

