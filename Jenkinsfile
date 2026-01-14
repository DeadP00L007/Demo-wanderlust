pipeline {
    agent any

    triggers {
        githubPush()
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Clean Old Containers') {
            steps {
                sh '''
                docker compose down -v || true
                docker rm -f backend frontend mongodb nginx || true
                docker system prune -af || true
                '''
            }
        }

        stage('Deploy with Docker Compose') {
            steps {
                sh '''
                docker compose pull
                docker compose up -d
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
