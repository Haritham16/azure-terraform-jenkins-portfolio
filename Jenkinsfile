pipeline {
    agent any

    parameters {
        choice(name: 'action', choices: ['plan', 'apply', 'destroy'], description: 'Terraform action')
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Auto approve apply/destroy')
    }

    environment {
        ARM_CLIENT_ID       = credentials('azure-client-id')
        ARM_CLIENT_SECRET   = credentials('azure-client-secret')
        ARM_SUBSCRIPTION_ID = credentials('azure-subscription-id')
        ARM_TENANT_ID       = credentials('azure-tenant-id')
        PATH = "/opt/homebrew/bin:${env.PATH}"
    }

    stages {
        stage('Checkout') { steps { checkout scm } }
        stage('Terraform Init') { steps { dir('live') { sh 'terraform init' } } }
        stage('Terraform Plan') {
            when { expression { params.action == 'plan' || params.action == 'apply' } }
            steps { dir('live') { sh 'terraform plan -out=tfplan' } }
        }
        stage('Terraform Apply') {
            when { expression { params.action == 'apply' } }
            steps { dir('live') { script { def approve = params.autoApprove ? '--auto-approve' : ''; sh "terraform apply ${approve} tfplan" } } }
        }
        stage('Terraform Destroy') {
            when { expression { params.action == 'destroy' } }
            steps { dir('live') { script { def approve = params.autoApprove ? '--auto-approve' : ''; sh "terraform destroy ${approve}" } } }
        }
    }
}
