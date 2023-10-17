pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
               git branch: 'main', url: 'https://github.com/aishwaryavk445/banking-project1.git'
            }
        }
         stage('Build Package') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('HTML Reports') {
            steps {
                publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: '/var/lib/jenkins/workspace/Banking-project/target/surefire-reports', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: '', useWrapperFileDirectly: true])
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t aishwaryavk445/banking-project:1.0 .'
            }
        }
}
}
