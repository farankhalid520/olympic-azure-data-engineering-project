# Introduction
The goal of this project was to create an ETL pipeline and perform data analytics on the Tokyo Olympics 2021 dataset mainly by using Azure Cloud tools like Data Factory, Data Lake Gen 2, Azure Databricks and Azure Synapse Analytics.

# Architecture
![ETL Pipeline](https://github.com/user-attachments/assets/19823bdb-03e0-4d07-b7a2-5799114ed8ad)

The Olympics 2021 data was sourced from Kaggle (https://www.kaggle.com/datasets/arjunprasadsarkhel/2021-olympics-in-tokyo). Then the raw data was extracted into the Azure cloud platform using Data Factory via Kaggle API and stored on a Data Lake Gen 2 data storage container. 
![Data Factory](https://github.com/user-attachments/assets/9001c734-52a4-46a3-b1c7-4c0fd4ff49ea)

Then we performed some basic transformations on the data using Databricks Spark. The transformed data was then stored in another Data Lake Gen 2 data storage container.
![Databricks Spark](https://github.com/user-attachments/assets/b17a44ea-bba0-49d9-b1d3-bd2779f76622)

Finally, we loaded the data into Synapse Analytics and did some data analysis using SQL to get some insights from the data.
![Synapse Analytics](https://github.com/user-attachments/assets/9374bcd0-c4bf-4f8e-9e9c-3c3acc7aae6d)

# Technologies Used
1- Python Programming Language
2- SQL
3- Azure Data Factory
4- Azure Data Lake Gen 2
5- Azure Databricks Spark
6- Azure Synapse Analytics



