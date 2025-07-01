def dockerImage

pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps { checkout scm }
        }

        /* ---------- TEST TANPA FRAMEWORK ---------- */
        stage('Lint & Functional Tests') {
            steps {
                script {
                    docker.image('php:8.2-cli').inside(
                        "-v $WORKSPACE:/app -w /app"
                    ) {
                        sh '''
                            chmod +x test.sh
                            ./test.sh
                        '''
                    }
                }
            }
        }

        /* ---------- BUILD IMAGE ---------- */
        stage('Build Docker image') {
            steps {
                script {
                    dockerImage = docker.build("my-php-app:${env.BUILD_NUMBER}", ".")
                }
            }
        }

        /* ---------- DEPLOY LOKAL ---------- */
        stage('Deploy (local)') {
            steps {
                script {
                    dockerImage.run("-d -p 8383:80 --name my-php-app-${env.BUILD_NUMBER}")
                }
            }
        }
    }

    post {
        always { cleanWs() } 
    }
}
