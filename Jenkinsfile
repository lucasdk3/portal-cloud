pipeline {
    agent portal-ativy-cloud-develop

    environment {
        DEPLOY_ENV = 'develop'
        VM_NAME = "${BUILD_ID}-${BUILD_REVISION}"
        LANGUAGE = 'npm'
        TYPE = 'vm'
        WORKDIR = pwd()
    }

    triggers {
        branch 'develop'
        branch 'release'
        branch 'main'
    }

    stages {
        stage('Deploy Flow') {
            steps {
                script {
                    if (BRANCH_NAME == 'release') {
                        DEPLOY_ENV = 'homologation'
                    } else if (BRANCH_NAME == 'main') {
                        DEPLOY_ENV = 'production'
                    } else {
                        DEPLOY_ENV = 'develop'
                    }

                    echo "Deploying to environment: ${DEPLOY_ENV}"

                    // Add your deployment steps here
                    checkout scm
                    sh "bash task ci:flow LANGUAGE=${LANGUAGE} TYPE=${TYPE} BUILD_NAME=${BUILD_ID} PROJECT_NAME=${JOB_NAME} WORKDIR=${WORKDIR}"
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
