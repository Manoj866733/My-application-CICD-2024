node {
    stage('My original source code') {
        git 'https://github.com/Manoj866733/My-application-CICD-2024.git'
    }

    stage('Maven is building the file now') {
        def mvnHome = tool name: 'maven3', type: 'maven'
        sh "${mvnHome}/bin/mvn clean package"
        sh 'mv target/myweb*.war target/newapp.war'
    }

    stage('SonarQube Analysis') {
        def mvnHome = tool name: 'maven3', type: 'maven'
        withSonarQubeEnv('sonar') {
            sh "${mvnHome}/bin/mvn sonar:sonar"
        }
    }

    stage('Building My Docker Images') {
        sh 'docker build -t 866733/myweb:1.0.0 .'
    }

    stage('Docker Image Push') {
        withCredentials([string(credentialsId: 'dockerPass', variable: 'dockerPassword')]) {
            sh "docker login -u 866733 -p ${dockerPassword}"
        }
        sh 'docker push 866733/myweb:1.0.0'
    }

    stage('Docker deployment') {
        sh 'docker run -d -p 8090:8080 --name tomcatserver 866733/myweb:1.0.0'
    }
}
