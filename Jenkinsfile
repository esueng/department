pipeline {
    agent {
        kubernetes {
            yaml '''
            apiVersion: v1
            kind: Pod
            metadata:
              name: jenkins-agent
            spec:
              containers:
              - name: maven
                image: maven:3.9.9-eclipse-temurin-21-alpine
                command:
                - cat
                tty: true
              - name: docker
                image: docker:27.2.0-alpine3.20
                command:
                - cat
                tty: true
                volumeMounts:
                - mountPath: "/var/run/docker.sock"
                  name: docker-socket
              volumes:
              - name: docker-socket
                hostPath:
                  path: "/var/run/docker.sock"
            '''
        }
    }
    stages {
        // stage('Checkout') {
        //     steps {
        //         // Github에서 소스 코드를 체크아웃하는 단계
        //         git branch: 'main', 
        //             credentialsId: 'github_access_ssh', 
        //             url: 'git@github.com:beyond-sw-camp-08/department.git'
        //         sh 'pwd'
        //         sh 'ls -al'
        //     }
        // }

        stage('Maven Build') {
            steps {
                container('maven') {
                    sh 'pwd'
                    sh 'ls -al'
                    sh 'mvn -v'
                    // sh 'mvn clean'
                    // sh 'mvn package'
                    // sh 'ls -al'
                    // sh 'ls -al ./target'
                }
            }
        }

        stage('Docker Image Build') {
            steps {
                container('docker') {
                    sh 'docker -v'
                }
            }
        }
    }
}
