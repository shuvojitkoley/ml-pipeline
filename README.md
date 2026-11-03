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


📂 Repository Structure
Plaintext
.
├── .github/workflows/
│   └── deploy.yml      # GitHub Actions CI/CD workflow
├── app.py              # Flask REST API implementation
├── train.py            # ML Model training & metric logging
├── test_app.py         # Pytest test cases for health & predict endpoints
├── Dockerfile          # Docker container configuration
├── docker-compose.yml  # Container service definition & healthcheck
├── deploy.sh           # Shell script executed on EC2 during deployment
├── requirements.txt    # Python dependencies
└── README.md           # Documentation
📊 Model Evaluation Metrics
When train.py executes, it outputs performance metrics evaluated on a 20% test split:

Plaintext
--- Model Evaluation Metrics ---
Accuracy:  1.0000
Precision: 1.0000
Recall:    1.0000
F-Score:   1.0000
--------------------------------
📡 API Endpoints
1. Health Check
Endpoint: GET /health

Response (200 OK):

JSON
{
  "status": "healthy",
  "message": "ML Model REST API is running successfully."
}
2. Predict
Endpoint: POST /predict

Request Body:

JSON
{
  "features": [5.1, 3.5, 1.4, 0.2]
}
Response (200 OK):

JSON
{
  "prediction": 0
}
🛠️ Quickstart Guide (Local Setup)
1. Clone Repository
Bash
git clone [https://github.com/YOUR_USERNAME/ml-deployment-project.git](https://github.com/YOUR_USERNAME/ml-deployment-project.git)
cd ml-deployment-project
2. Run with Docker Compose
Bash
docker-compose up --build
The application will be accessible locally at http://localhost:5000.

3. Test API Endpoint
Bash
curl -X POST http://localhost:5000/predict \
     -H "Content-Type: application/json" \
     -d '{"features": [5.1, 3.5, 1.4, 0.2]}'
☁️ Deployment Setup (AWS EC2 & GitHub Actions)
Prerequisites:
AWS EC2 Instance: Ubuntu 22.04 LTS instance with Docker and Docker Compose installed.

Inbound Security Group: Expose TCP ports 22 (SSH) and 5000 (Flask API).

GitHub Secrets Configuration:
Add the following secrets to your GitHub repository (Settings > Secrets and variables > Actions):

EC2_HOST: Public IP of your EC2 instance.

EC2_USER: ubuntu

EC2_SSH_KEY: Content of your .pem private SSH key.

Once secrets are set up, pushing code to the main branch will automatically trigger testing and push updates live to EC2.

🧰 Tech Stack
Language: Python 3.10

Framework: Flask, Gunicorn

ML Libraries: Scikit-Learn, NumPy

Containerization: Docker, Docker Compose

CI/CD: GitHub Actions

Cloud Hosting: AWS EC2 (Linux)

Testing: Pytest
