# 🚀 Automated ML Model Deployment Pipeline

An end-to-end Automated Machine Learning Deployment Pipeline that containerizes a Flask-based REST API using **Docker** and automates testing & continuous deployment (**CI/CD**) to an **AWS EC2** instance via **GitHub Actions**.

---

## 📌 Features & Highlights

- **RESTful API**: Flask API hosting a Random Forest classifier trained on the Iris dataset.
- **Model Evaluation**: Evaluation metrics calculated during model build: **Accuracy, Precision, Recall, and F1-Score**.
- **Containerization**: Fully containerized runtime using Docker and `docker-compose` with built-in HTTP health checks.
- **Automated CI/CD Pipeline**: 
  - **Testing**: Runs automated `pytest` test suites on push to `main`.
  - **Deployment**: Automatic SSH deployment to AWS EC2 using GitHub Actions and Linux deployment scripts (`deploy.sh`).
- **Production Server**: Uses `Gunicorn` WSGI server for multi-worker production handling.

---

## 🏗️ System Architecture & Workflow

```text
+------------------+         +-----------------------+         +-----------------------+
|  Developer Push  |  ---->  |    GitHub Actions     |  ---->  |        AWS EC2        |
|   (main branch)  |         |  (Run Tests / Build)  |         | (Docker & Gunicorn)   |
+------------------+         +-----------------------+         +-----------------------+
                                                                           |
                                                                           v
                                                                 +-------------------+
                                                                 | Exposed REST API  |
                                                                 |    Port: 5000     |
                                                                 +-------------------+
