pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/rizalamrirozaqi/prak8-php.git', branch: 'main'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'composer install'
            }
        }

        stage('Run Unit Test') {
            steps {
                sh './vendor/bin/phpunit tests'
            }
        }

        stage('Build Docker Image & Run') {
            steps {
                sh 'docker build -t php-jenkins-app .'
                sh 'docker run --rm php-jenkins-app'
            }
        }
    }
}
