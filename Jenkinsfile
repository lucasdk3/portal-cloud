pipeline {
    agent {
        label 'portal-ativy-digital-develop'
    }

    environment {
        DEPLOY_ENV = 'develop'
        VM_NAME = "${BUILD_ID}-${BUILD_REVISION}"
        LANGUAGE = 'npm'
        TYPE = 'vm'
        WORKDIR = pwd()
        PROJECT_NAME = 'portal-cloud-ativy'
    }

    triggers {
        cron('H/15 * * * *')
    }

    stages {
        stage('Deploy Flow') {
            steps {
                script {
                    if (BRANCH_NAME == 'develop') {
                        DEPLOY_ENV = 'develop'
                    } else if (BRANCH_NAME == 'main') {
                        DEPLOY_ENV = 'production'
                    } else {
                        DEPLOY_ENV = 'homologation'
                    }

                    echo "Deploying to environment: ${DEPLOY_ENV}"

                    // Add your deployment steps here
                    checkout scm
                    sh 'git submodule update --init --recursive'
                    sh "bash -c 'task ci:flow LANGUAGE=${LANGUAGE} TYPE=${TYPE} BUILD_NAME=${BUILD_ID} PROJECT_NAME=${PROJECT_NAME} WORKDIR=${WORKDIR}'"
                }
            }
        }
    }

    post {
        always {
            echo "Cleaning up..."
        }
    }
}
