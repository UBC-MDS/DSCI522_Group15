# Define default target.
all: setup download preprocess eda fit evaluate report
# Setup directories
setup:
    mkdir -p data/raw data/processed results/models results/figures results/tables
# Download and extract data
download:
    python scripts/download_data.py --url https://archive.ics.uci.edu/static/public/697/predict+students+dropout+and+academic+success.zip --write-to data/raw/
# Split data into train and test sets, preprocess data for EDA and save preprocessor
preprocess:
    python scripts/split_n_preprocess.py --raw-data data/raw/data.csv --data-to data/processed/ --preprocessor-to results/models/ --drop-column data/processed/drop_column.csv --numeric-column data/processed/numeric_column.csv --categorical-column data/processed/categorical_column.csv --ordinal-column data/processed/ordinal_column.csv --binary-column data/processed/binary_column.csv
# Perform EDA and save plots
eda:
    python scripts/eda.py --training-data data/processed/student_train.csv --plot-to results/figures/
# Train and fit the model, as well as saving the models
fit:
    python scripts/fit_student_classifier.py --original-train data/processed/student_train.csv --preprocessor results/models/student_preprocessor.pickle --pipeline-to results/models/ --result-to results/tables/
# Evaluate model on test data and save results
evaluate:
    python scripts/evaluate_student_predictor.py --original-test data/processed/student_test.csv --scaled-test-data data/processed/scaled_student_test.csv --rf-from results/models/RF_model.pickle --lr-from results/models/LR_model.pickle --svc-from results/models/SVC_model.pickle --results-to results/tables/
# Build a HTML report
report:
    jupyter-book build report
# Clean target (optional)
clean:
    rm -rf data/raw/* data/processed/* results/models/* results/figures/* results/tables/*
.PHONY: all download preprocess eda fit evaluate report clean
