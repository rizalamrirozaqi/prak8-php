pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                echo 'Repo sudah ter-clone oleh SCM.'
            }
        }

        stage('Install Dependencies') {
            steps {
                echo 'Tidak ada dependency untuk di-install.'
            }
        }

        stage('Run Unit Test') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'php tests/index_test.php'
                    } else {
                        bat 'run_tests.bat'
                    }
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'docker build -t php-simple-app .'
                    } else {
                        bat 'docker build -t php-simple-app .'
                    }
                }
            }
        }

        stage('Deploy Container') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'docker run -d -p 9890:9090 php-simple-app'
                    } else {
                        bat 'docker run -d -p 9890:9698 php-simple-app'
                    }
                }
            }
        }
    }
}
