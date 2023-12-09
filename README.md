# 🎓 Student Success Predictor 🎓

**Authors** (in alphabetical order): Katherine Chen, Hancheng Qin, Yili Tang, Bill Wan

This project aims to build a machine learning model to predict student's academic success.

## 📚 About

The Student Success Predictor project addresses the critical issue of academic dropout and failure in higher education. We are interested in investigating in the topic since both school dropout and educational failure in higher education are an obstacle to economic growth, employment, competitiveness, and productivity, which have a huge impact on the lives of students and their families, higher education institutions, and society as a whole. The ultimate goal of this project is to implement targeted strategies and support systems that contribute to the reduction of academic dropout. 

Throughout the project, we built machine learning models, like Support Vector Machines (SVM), Random Forest, and Logistic Regression (with L1 and L2 regularization), to predict if a student might drop out.

Due to a large number of features and their inter-correlations, our initial models exhibited signs of overfitting. We therefore incorporated feature selection techniques such as Principal Component Analysis (PCA) and feature importance analysis, coupled with fine-tuning the models' parameters. The refined models demonstrated enhanced performance, evident in a minimized gap between training and validation accuracy. Among the three models, SVM marginally outperformed the others, achieving an accuracy of 80% and an AUC score of 0.89. However, there remains potential for further improvement in model performance through additional feature engineering and more comprehensive parameter tuning.

Our dataset is sourced from the [UCI Machine Learning Repository](https://archive.ics.uci.edu/dataset/697/predict+students+dropout+and+academic+success).

## Analysis

In the src directory, you will find four Jupyter notebooks: data_analysis_final_report.ipynb, data_analysis_model.ipynb, data_analysis_EDA.ipynb, and data_analysis_parameter_optimization.ipynb. For a comprehensive view of the analysis, execute data_analysis_final_report.ipynb, which integrates all individual parts. If you're interested in the specifics of each analytical segment, the other notebooks can be run separately to explore each in more detail.

## 📄 Report

We have compiled our analysis into a comprehensive report, which can be accessed [through this link](https://ubc-mds.github.io/Student_Success_Predict_Group15/student_success.html). Our report includes several charts and visualizations that effectively aid in understanding the data patterns and analytical results. We welcome any feedback and suggestions you may have.

## 📦 Dependencies

Docker is a container solution used to manage the software dependencies for this project. The Docker image used for this project is based on the quay.io/jupyter/minimal-notebook:2023-11-19 image. Additioanal dependencies are specified int the Dockerfile.

## 💻 Usage
##### Working with the project in the container with Jupyter lab

1. Navigate to the root of this project on your computer using the command line and run
   ```
   docker compose up
   ```
2. In the terminal, look for a URL that starts with http://127.0.0.1:8888/lab?token=. Copy and paste that URL into your browser to run jupyter lab.
3. Running the analysis
- Open up a terminal in the Jupyter IDE of the Docker container, and use the terminal in the project root to navigate to the work directory using the command: cd ./work
- To reset the project to a clean state (i.e., remove all files if you have run this analysis before):
   ```
   make clean
   ```
- To run the analysis in its entirety, enter the following command in the terminal in the project root:
   ```
   make all
   ```

Clean up:
1. Type Contrl + C in the terminal where you launched the container to shut down the container and clean up the resources
2. run
   ```
   docker compose rm
   ```

##### To add a new dependency, follow the steps below:

1. Add the dependency to the Dockerfile file on a new branch.
2. Re-build the Docker image locally to ensure it builds and runs properly.
3. Push the changes to GitHub. A new Docker image will be built and pushed to Docker Hub automatically. The tag will be the SHA for the commit that changed the file.
4. Update the docker-compose.yml fil to use the new container image .
5. Send a pull request to merge the changes into the main branch.

## 📜 License
The Student Success Predictor materials here are licensed under under MIT License. If re-using/re-mixing please provide attribution and link to this webpage.

## 📚 References
Please refer to the UCI Machine Learning Repository (https://archive.ics.uci.edu/dataset/697/predict+students+dropout+and+academic+success) for the dataset used in this project.

- Harris, C.R., Millman, K.J., van der Walt, S.J. et al. Array programming with NumPy. Nature 585, 357–362 (2020). DOI: 10.1038/s41586-020-2649-2. (Publisher link).
- Cox, D. R. (1958). The regression analysis of binary sequences. Journal of the Royal Statistical Society: Series B (Methodological), 20(2), 215–232.
- Cortes, C., & Vapnik, V. (1995). Support-vector networks. Machine Learning, 20(3), 273-297
- Breiman, L. (2001). Random Forests. Machine Learning, 45(1), 5-32. DOI: 10.1023/A:1010933404324
- Pedregosa, F. et al., 2011. Scikit-learn: Machine learning in Python. Journal of machine learning research, 12(Oct), pp.2825–2830.


