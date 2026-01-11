pipeline {
    agent any

    triggers {
        githubPush()
    }

    environment {
        NETWORK_NAME = "wanderlust"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Clean Old Containers & Network') {
            steps {
                echo "Cleaning old containers & network..."
                sh '''
                docker rm -f backend frontend mongodb nginx || true
                docker network rm $NETWORK_NAME || true
                docker system prune -af || true
                '''
            }
        }

        stage('Build & Deploy') {
            steps {
                echo "Building and deploying containers..."
                sh '''
                docker network create $NETWORK_NAME || true
                docker compose up -d --build
                '''
            }
        }
    }

    post {
        success {
            echo "🚀 CI/CD pipeline completed successfully!"
        }
        failure {
            echo "❌ CI/CD pipeline failed. Check logs!"
        }
    }
}
