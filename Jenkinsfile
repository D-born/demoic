pipeline {
    agent any

    tools {
        maven 'Maven'
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'master',
                    url: 'git@github.com:D-born/demoic.git',
                    credentialsId: 'github-ssh'
            }
        }

        stage('Build') {
            steps {
                bat 'mvn clean compile'
            }
        }

        stage('Test') {
            steps {
                bat 'mvn test'
            }
        }

        stage('Package') {
            steps {
                bat 'mvn package'
            }
        }

        stage('Docker Build') {
            steps {
                bat 'docker build -t routsmaitre/demoic:1.0 .'
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([string(credentialsId: 'dockerhubpass', variable: 'PASS')]) {
                    bat 'docker login -u routsmaitre -p %PASS%'
                }
            }
        }

        stage('Docker Push') {
            steps {
                bat 'docker push routsmaitre/demoic:1.0'
            }
        }
    }

    post {
        success {
            echo 'Build SUCCESS 🎉'
        }

        failure {
            echo 'Build FAILED ❌'
        }
    }
}