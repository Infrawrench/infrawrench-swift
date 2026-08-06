/*
 * InfrawrenchSDK v0.36.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.36.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Resource type id. Note: not every plugin exposes every type — see the plugin's
/// `resourceTypes` for the valid (pluginId, typeId) pairs.
public enum ResourceTypeId: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case accessApplication
    case accessPolicy
    case account
    case acmCertificate
    case agentApiKey
    case aiGateway
    case aiSearch
    case alb
    case alertPolicy
    case alloydbCluster
    case alloydbInstance
    case apiGateway
    case apiKey
    case app
    case appEngineService
    case apprunnerService
    case artifactRegistryRepo
    case auditEvent
    case autoScalingGroup
    case azureAksCluster
    case azureAppGateway
    case azureAppRegistration
    case azureAppService
    case azureAppServicePlan
    case azureContainerInstance
    case azureContainerRegistry
    case azureCosmosDb
    case azureDisk
    case azureDnsZone
    case azureEventHub
    case azureFirewall
    case azureFunctionApp
    case azureKeyVault
    case azureLoadBalancer
    case azureLogAnalytics
    case azureManagedIdentity
    case azureMysqlFlexible
    case azureNatGateway
    case azureNsg
    case azurePostgresFlexible
    case azurePrivateDnsZone
    case azurePublicIp
    case azureRedisCache
    case azureResourceGroup
    case azureRouteTable
    case azureServiceBus
    case azureSqlDatabase
    case azureStorageAccount
    case azureSubnet
    case azureVm
    case azureVnet
    case backendService
    case backupVault
    case balance
    case batch
    case batchInferenceJob
    case batchJobQueue
    case bedrockModel
    case bigqueryDataset
    case bigqueryTable
    case bigtableInstance
    case blockVolume
    case cacheRule
    case cachedContent
    case certificate
    case chDatabase
    case chService
    case cloudArmorPolicy
    case cloudBuildTrigger
    case cloudDeployPipeline
    case cloudDnsRecordSet
    case cloudDnsZone
    case cloudFunction
    case cloudNat
    case cloudRouter
    case cloudRunService
    case cloudSchedulerJob
    case cloudTasksQueue
    case cloudformationStack
    case cloudfrontDistribution
    case cloudsqlInstance
    case cloudtrailTrail
    case cloudwatchAlarm
    case cloudwatchLogGroup
    case codebuildProject
    case codepipelinePipeline
    case cognitoUserPool
    case collection
    case composerEnvironment
    case connection
    case container
    case containerRegistry
    case customHostname
    case customVoice
    case d1Database
    case databricksApp
    case databricksCatalog
    case databricksCluster
    case databricksClusterPolicy
    case databricksDashboard
    case databricksFunction
    case databricksJob
    case databricksModelVersion
    case databricksNodeType
    case databricksPipeline
    case databricksRegisteredModel
    case databricksRepo
    case databricksSchema
    case databricksSecretScope
    case databricksServingEndpoint
    case databricksSqlQuery
    case databricksSqlWarehouse
    case databricksTable
    case databricksVectorSearchEndpoint
    case databricksVectorSearchIndex
    case databricksVolume
    case databricksWorkspaceObject
    case dataflowJob
    case dataset
    case dbSubnetGroup
    case dbUser
    case dedicatedInference
    case deployedModel
    case deployment
    case directory
    case directoryGroup
    case directoryUser
    case dnsRecord
    case dockerContainer
    case dockerImage
    case dockerNetwork
    case dockerVolume
    case documentdbCluster
    case doksCluster
    case domain
    case droplet
    case durableObjectNamespace
    case dynamodbTable
    case ebsVolume
    case ec2Instance
    case ecrRepository
    case ecsService
    case efsFileSystem
    case eksCluster
    case elasticIp
    case elasticacheCluster
    case emailRoutingRule
    case embedJob
    case endpoint
    case eval
    case evaluation
    case eventbridgeRule
    case file
    case fileSearchDocument
    case fileSearchStore
    case fineTune
    case fineTuningJob
    case finetunedModel
    case firestoreDatabase
    case firewall
    case firewallRule
    case floatingIp
    case folder
    case forwardingRule
    case gateway
    case gceDisk
    case gceInstance
    case gcpProject
    case gcpServiceAccount
    case gcsBucket
    case genAiAgent
    case genAiKnowledgeBase
    case genAiModelRouter
    case gkeCluster
    case glueDatabase
    case groqBatch
    case groqFile
    case groqFineTuning
    case groqModel
    case hardware
    case healthCheck
    case healthcheck
    case historyItem
    case hyperdrive
    case iamRole
    case iamUser
    case image
    case inferenceBatch
    case instance
    case instanceGroup
    case instanceTemplate
    case internetGateway
    case invitation
    case invite
    case ipAccessRule
    case ipAllocation
    case job
    case k8sCluster
    case k8sConfigmap
    case k8sCronjob
    case k8sDaemonset
    case k8sDeployment
    case k8sIngress
    case k8sJob
    case k8sNamespace
    case k8sNode
    case k8sPod
    case k8sSecret
    case k8sService
    case k8sStatefulset
    case kafkaCluster
    case kafkaConsumerGroup
    case kafkaTopic
    case kapsuleCluster
    case kinesisStream
    case kmsKey
    case kmsKeyRing
    case kvNamespace
    case lambdaFunction
    case loadBalancer
    case logSink
    case logpushJob
    case machine
    case managedDatabase
    case managedDb
    case managedEndpoint
    case managedKube
    case mediaAsset
    case member
    case memcachedInstance
    case memorystoreMemcached
    case memorystoreRedis
    case messageBatch
    case mistralApiKey
    case mistralBatchJob
    case mistralFile
    case mistralFineTuningJob
    case mistralModel
    case mistralVoice
    case model
    case modelApiKey
    case modelEndpoint
    case mongodbDatabase
    case mqBroker
    case mskCluster
    case mssqlDatabase
    case mysqlDatabase
    case natGateway
    case neonAiGateway
    case neonAuth
    case neonAuthDomain
    case neonAuthOauthProvider
    case neonBranch
    case neonBucket
    case neonCredential
    case neonDataApi
    case neonDatabase
    case neonEndpoint
    case neonFunction
    case neonProject
    case neonRole
    case neonSnapshot
    case neptuneCluster
    case netlifyBuildHook
    case netlifyDeploy
    case netlifyDnsRecord
    case netlifyDnsZone
    case netlifyEnvVar
    case netlifyForm
    case netlifySite
    case network
    case nfsShare
    case notificationPolicy
    case objectStorageBucket
    case opensearchCluster
    case opensearchDomain
    case organization
    case organizationMembership
    case organizationUser
    case pageRule
    case pgDatabase
    case pgSchema
    case placementGroup
    case prediction
    case primaryIp
    case privateNetwork
    case project
    case projectApiKey
    case pronunciationDict
    case pronunciationDictionary
    case provider
    case psBackup
    case psBranch
    case psDatabase
    case psDeployRequest
    case psPassword
    case pubsubSubscription
    case pubsubTopic
    case queue
    case quota
    case r2Bucket
    case rateLimitRule
    case rdbInstance
    case rdsCluster
    case rdsInstance
    case redirectRule
    case redisInstance
    case redshiftCluster
    case reservedIp
    case role
    case routeTable
    case route53HealthCheck
    case route53HostedZone
    case route53RecordSet
    case s3Bucket
    case sagemakerEndpoint
    case secret
    case secretManagerSecret
    case secretsManagerSecret
    case securityGroup
    case server
    case snapshot
    case snsTopic
    case spacesBucket
    case spannerBackup
    case spannerDatabase
    case spannerInstance
    case spectrumApplication
    case sqsQueue
    case sshKey
    case sshTarget
    case sslCertificate
    case ssmParameter
    case staticIp
    case stepFunction
    case subnet
    case supervisedFineTuningJob
    case targetGroup
    case training
    case transcript
    case transcription
    case transformation
    case tunedModel
    case tunnel
    case turnstileWidget
    case tursoApiToken
    case tursoDatabase
    case tursoDatabaseInstance
    case tursoGroup
    case tursoLocation
    case tursoOrganizationInvite
    case tursoOrganizationMember
    case uploadPreset
    case user
    case vectorStore
    case vectorizeIndex
    case vercelDeployment
    case vercelDomain
    case vercelEnvVar
    case vercelProject
    case vercelTeam
    case vertexAiEndpoint
    case vertexGeminiModel
    case vocabulary
    case voice
    case volume
    case vpc
    case vpcNetwork
    case wafWebAcl
    case waitingRoom
    case webhookEndpoint
    case worker
    case workerRoute
    case workersAiModel
    case workflow
    case workspace
    case zone
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "access-application": self = .accessApplication
        case "access-policy": self = .accessPolicy
        case "account": self = .account
        case "acm-certificate": self = .acmCertificate
        case "agent-api-key": self = .agentApiKey
        case "ai-gateway": self = .aiGateway
        case "ai-search": self = .aiSearch
        case "alb": self = .alb
        case "alert-policy": self = .alertPolicy
        case "alloydb-cluster": self = .alloydbCluster
        case "alloydb-instance": self = .alloydbInstance
        case "api-gateway": self = .apiGateway
        case "api-key": self = .apiKey
        case "app": self = .app
        case "app-engine-service": self = .appEngineService
        case "apprunner-service": self = .apprunnerService
        case "artifact-registry-repo": self = .artifactRegistryRepo
        case "audit-event": self = .auditEvent
        case "auto-scaling-group": self = .autoScalingGroup
        case "azure-aks-cluster": self = .azureAksCluster
        case "azure-app-gateway": self = .azureAppGateway
        case "azure-app-registration": self = .azureAppRegistration
        case "azure-app-service": self = .azureAppService
        case "azure-app-service-plan": self = .azureAppServicePlan
        case "azure-container-instance": self = .azureContainerInstance
        case "azure-container-registry": self = .azureContainerRegistry
        case "azure-cosmos-db": self = .azureCosmosDb
        case "azure-disk": self = .azureDisk
        case "azure-dns-zone": self = .azureDnsZone
        case "azure-event-hub": self = .azureEventHub
        case "azure-firewall": self = .azureFirewall
        case "azure-function-app": self = .azureFunctionApp
        case "azure-key-vault": self = .azureKeyVault
        case "azure-load-balancer": self = .azureLoadBalancer
        case "azure-log-analytics": self = .azureLogAnalytics
        case "azure-managed-identity": self = .azureManagedIdentity
        case "azure-mysql-flexible": self = .azureMysqlFlexible
        case "azure-nat-gateway": self = .azureNatGateway
        case "azure-nsg": self = .azureNsg
        case "azure-postgres-flexible": self = .azurePostgresFlexible
        case "azure-private-dns-zone": self = .azurePrivateDnsZone
        case "azure-public-ip": self = .azurePublicIp
        case "azure-redis-cache": self = .azureRedisCache
        case "azure-resource-group": self = .azureResourceGroup
        case "azure-route-table": self = .azureRouteTable
        case "azure-service-bus": self = .azureServiceBus
        case "azure-sql-database": self = .azureSqlDatabase
        case "azure-storage-account": self = .azureStorageAccount
        case "azure-subnet": self = .azureSubnet
        case "azure-vm": self = .azureVm
        case "azure-vnet": self = .azureVnet
        case "backend-service": self = .backendService
        case "backup-vault": self = .backupVault
        case "balance": self = .balance
        case "batch": self = .batch
        case "batch-inference-job": self = .batchInferenceJob
        case "batch-job-queue": self = .batchJobQueue
        case "bedrock-model": self = .bedrockModel
        case "bigquery-dataset": self = .bigqueryDataset
        case "bigquery-table": self = .bigqueryTable
        case "bigtable-instance": self = .bigtableInstance
        case "block-volume": self = .blockVolume
        case "cache-rule": self = .cacheRule
        case "cached-content": self = .cachedContent
        case "certificate": self = .certificate
        case "ch-database": self = .chDatabase
        case "ch-service": self = .chService
        case "cloud-armor-policy": self = .cloudArmorPolicy
        case "cloud-build-trigger": self = .cloudBuildTrigger
        case "cloud-deploy-pipeline": self = .cloudDeployPipeline
        case "cloud-dns-record-set": self = .cloudDnsRecordSet
        case "cloud-dns-zone": self = .cloudDnsZone
        case "cloud-function": self = .cloudFunction
        case "cloud-nat": self = .cloudNat
        case "cloud-router": self = .cloudRouter
        case "cloud-run-service": self = .cloudRunService
        case "cloud-scheduler-job": self = .cloudSchedulerJob
        case "cloud-tasks-queue": self = .cloudTasksQueue
        case "cloudformation-stack": self = .cloudformationStack
        case "cloudfront-distribution": self = .cloudfrontDistribution
        case "cloudsql-instance": self = .cloudsqlInstance
        case "cloudtrail-trail": self = .cloudtrailTrail
        case "cloudwatch-alarm": self = .cloudwatchAlarm
        case "cloudwatch-log-group": self = .cloudwatchLogGroup
        case "codebuild-project": self = .codebuildProject
        case "codepipeline-pipeline": self = .codepipelinePipeline
        case "cognito-user-pool": self = .cognitoUserPool
        case "collection": self = .collection
        case "composer-environment": self = .composerEnvironment
        case "connection": self = .connection
        case "container": self = .container
        case "container-registry": self = .containerRegistry
        case "custom-hostname": self = .customHostname
        case "custom-voice": self = .customVoice
        case "d1-database": self = .d1Database
        case "databricks-app": self = .databricksApp
        case "databricks-catalog": self = .databricksCatalog
        case "databricks-cluster": self = .databricksCluster
        case "databricks-cluster-policy": self = .databricksClusterPolicy
        case "databricks-dashboard": self = .databricksDashboard
        case "databricks-function": self = .databricksFunction
        case "databricks-job": self = .databricksJob
        case "databricks-model-version": self = .databricksModelVersion
        case "databricks-node-type": self = .databricksNodeType
        case "databricks-pipeline": self = .databricksPipeline
        case "databricks-registered-model": self = .databricksRegisteredModel
        case "databricks-repo": self = .databricksRepo
        case "databricks-schema": self = .databricksSchema
        case "databricks-secret-scope": self = .databricksSecretScope
        case "databricks-serving-endpoint": self = .databricksServingEndpoint
        case "databricks-sql-query": self = .databricksSqlQuery
        case "databricks-sql-warehouse": self = .databricksSqlWarehouse
        case "databricks-table": self = .databricksTable
        case "databricks-vector-search-endpoint": self = .databricksVectorSearchEndpoint
        case "databricks-vector-search-index": self = .databricksVectorSearchIndex
        case "databricks-volume": self = .databricksVolume
        case "databricks-workspace-object": self = .databricksWorkspaceObject
        case "dataflow-job": self = .dataflowJob
        case "dataset": self = .dataset
        case "db-subnet-group": self = .dbSubnetGroup
        case "db-user": self = .dbUser
        case "dedicated-inference": self = .dedicatedInference
        case "deployed-model": self = .deployedModel
        case "deployment": self = .deployment
        case "directory": self = .directory
        case "directory-group": self = .directoryGroup
        case "directory-user": self = .directoryUser
        case "dns-record": self = .dnsRecord
        case "docker-container": self = .dockerContainer
        case "docker-image": self = .dockerImage
        case "docker-network": self = .dockerNetwork
        case "docker-volume": self = .dockerVolume
        case "documentdb-cluster": self = .documentdbCluster
        case "doks-cluster": self = .doksCluster
        case "domain": self = .domain
        case "droplet": self = .droplet
        case "durable-object-namespace": self = .durableObjectNamespace
        case "dynamodb-table": self = .dynamodbTable
        case "ebs-volume": self = .ebsVolume
        case "ec2-instance": self = .ec2Instance
        case "ecr-repository": self = .ecrRepository
        case "ecs-service": self = .ecsService
        case "efs-file-system": self = .efsFileSystem
        case "eks-cluster": self = .eksCluster
        case "elastic-ip": self = .elasticIp
        case "elasticache-cluster": self = .elasticacheCluster
        case "email-routing-rule": self = .emailRoutingRule
        case "embed-job": self = .embedJob
        case "endpoint": self = .endpoint
        case "eval": self = .eval
        case "evaluation": self = .evaluation
        case "eventbridge-rule": self = .eventbridgeRule
        case "file": self = .file
        case "file-search-document": self = .fileSearchDocument
        case "file-search-store": self = .fileSearchStore
        case "fine-tune": self = .fineTune
        case "fine-tuning-job": self = .fineTuningJob
        case "finetuned-model": self = .finetunedModel
        case "firestore-database": self = .firestoreDatabase
        case "firewall": self = .firewall
        case "firewall-rule": self = .firewallRule
        case "floating-ip": self = .floatingIp
        case "folder": self = .folder
        case "forwarding-rule": self = .forwardingRule
        case "gateway": self = .gateway
        case "gce-disk": self = .gceDisk
        case "gce-instance": self = .gceInstance
        case "gcp-project": self = .gcpProject
        case "gcp-service-account": self = .gcpServiceAccount
        case "gcs-bucket": self = .gcsBucket
        case "gen-ai-agent": self = .genAiAgent
        case "gen-ai-knowledge-base": self = .genAiKnowledgeBase
        case "gen-ai-model-router": self = .genAiModelRouter
        case "gke-cluster": self = .gkeCluster
        case "glue-database": self = .glueDatabase
        case "groq-batch": self = .groqBatch
        case "groq-file": self = .groqFile
        case "groq-fine-tuning": self = .groqFineTuning
        case "groq-model": self = .groqModel
        case "hardware": self = .hardware
        case "health-check": self = .healthCheck
        case "healthcheck": self = .healthcheck
        case "history-item": self = .historyItem
        case "hyperdrive": self = .hyperdrive
        case "iam-role": self = .iamRole
        case "iam-user": self = .iamUser
        case "image": self = .image
        case "inference-batch": self = .inferenceBatch
        case "instance": self = .instance
        case "instance-group": self = .instanceGroup
        case "instance-template": self = .instanceTemplate
        case "internet-gateway": self = .internetGateway
        case "invitation": self = .invitation
        case "invite": self = .invite
        case "ip-access-rule": self = .ipAccessRule
        case "ip-allocation": self = .ipAllocation
        case "job": self = .job
        case "k8s-cluster": self = .k8sCluster
        case "k8s-configmap": self = .k8sConfigmap
        case "k8s-cronjob": self = .k8sCronjob
        case "k8s-daemonset": self = .k8sDaemonset
        case "k8s-deployment": self = .k8sDeployment
        case "k8s-ingress": self = .k8sIngress
        case "k8s-job": self = .k8sJob
        case "k8s-namespace": self = .k8sNamespace
        case "k8s-node": self = .k8sNode
        case "k8s-pod": self = .k8sPod
        case "k8s-secret": self = .k8sSecret
        case "k8s-service": self = .k8sService
        case "k8s-statefulset": self = .k8sStatefulset
        case "kafka-cluster": self = .kafkaCluster
        case "kafka-consumer-group": self = .kafkaConsumerGroup
        case "kafka-topic": self = .kafkaTopic
        case "kapsule-cluster": self = .kapsuleCluster
        case "kinesis-stream": self = .kinesisStream
        case "kms-key": self = .kmsKey
        case "kms-key-ring": self = .kmsKeyRing
        case "kv-namespace": self = .kvNamespace
        case "lambda-function": self = .lambdaFunction
        case "load-balancer": self = .loadBalancer
        case "log-sink": self = .logSink
        case "logpush-job": self = .logpushJob
        case "machine": self = .machine
        case "managed-database": self = .managedDatabase
        case "managed-db": self = .managedDb
        case "managed-endpoint": self = .managedEndpoint
        case "managed-kube": self = .managedKube
        case "media-asset": self = .mediaAsset
        case "member": self = .member
        case "memcached-instance": self = .memcachedInstance
        case "memorystore-memcached": self = .memorystoreMemcached
        case "memorystore-redis": self = .memorystoreRedis
        case "message-batch": self = .messageBatch
        case "mistral-api-key": self = .mistralApiKey
        case "mistral-batch-job": self = .mistralBatchJob
        case "mistral-file": self = .mistralFile
        case "mistral-fine-tuning-job": self = .mistralFineTuningJob
        case "mistral-model": self = .mistralModel
        case "mistral-voice": self = .mistralVoice
        case "model": self = .model
        case "model-api-key": self = .modelApiKey
        case "model-endpoint": self = .modelEndpoint
        case "mongodb-database": self = .mongodbDatabase
        case "mq-broker": self = .mqBroker
        case "msk-cluster": self = .mskCluster
        case "mssql-database": self = .mssqlDatabase
        case "mysql-database": self = .mysqlDatabase
        case "nat-gateway": self = .natGateway
        case "neon-ai-gateway": self = .neonAiGateway
        case "neon-auth": self = .neonAuth
        case "neon-auth-domain": self = .neonAuthDomain
        case "neon-auth-oauth-provider": self = .neonAuthOauthProvider
        case "neon-branch": self = .neonBranch
        case "neon-bucket": self = .neonBucket
        case "neon-credential": self = .neonCredential
        case "neon-data-api": self = .neonDataApi
        case "neon-database": self = .neonDatabase
        case "neon-endpoint": self = .neonEndpoint
        case "neon-function": self = .neonFunction
        case "neon-project": self = .neonProject
        case "neon-role": self = .neonRole
        case "neon-snapshot": self = .neonSnapshot
        case "neptune-cluster": self = .neptuneCluster
        case "netlify-build-hook": self = .netlifyBuildHook
        case "netlify-deploy": self = .netlifyDeploy
        case "netlify-dns-record": self = .netlifyDnsRecord
        case "netlify-dns-zone": self = .netlifyDnsZone
        case "netlify-env-var": self = .netlifyEnvVar
        case "netlify-form": self = .netlifyForm
        case "netlify-site": self = .netlifySite
        case "network": self = .network
        case "nfs-share": self = .nfsShare
        case "notification-policy": self = .notificationPolicy
        case "object-storage-bucket": self = .objectStorageBucket
        case "opensearch-cluster": self = .opensearchCluster
        case "opensearch-domain": self = .opensearchDomain
        case "organization": self = .organization
        case "organization-membership": self = .organizationMembership
        case "organization-user": self = .organizationUser
        case "page-rule": self = .pageRule
        case "pg-database": self = .pgDatabase
        case "pg-schema": self = .pgSchema
        case "placement-group": self = .placementGroup
        case "prediction": self = .prediction
        case "primary-ip": self = .primaryIp
        case "private-network": self = .privateNetwork
        case "project": self = .project
        case "project-api-key": self = .projectApiKey
        case "pronunciation-dict": self = .pronunciationDict
        case "pronunciation-dictionary": self = .pronunciationDictionary
        case "provider": self = .provider
        case "ps-backup": self = .psBackup
        case "ps-branch": self = .psBranch
        case "ps-database": self = .psDatabase
        case "ps-deploy-request": self = .psDeployRequest
        case "ps-password": self = .psPassword
        case "pubsub-subscription": self = .pubsubSubscription
        case "pubsub-topic": self = .pubsubTopic
        case "queue": self = .queue
        case "quota": self = .quota
        case "r2-bucket": self = .r2Bucket
        case "rate-limit-rule": self = .rateLimitRule
        case "rdb-instance": self = .rdbInstance
        case "rds-cluster": self = .rdsCluster
        case "rds-instance": self = .rdsInstance
        case "redirect-rule": self = .redirectRule
        case "redis-instance": self = .redisInstance
        case "redshift-cluster": self = .redshiftCluster
        case "reserved-ip": self = .reservedIp
        case "role": self = .role
        case "route-table": self = .routeTable
        case "route53-health-check": self = .route53HealthCheck
        case "route53-hosted-zone": self = .route53HostedZone
        case "route53-record-set": self = .route53RecordSet
        case "s3-bucket": self = .s3Bucket
        case "sagemaker-endpoint": self = .sagemakerEndpoint
        case "secret": self = .secret
        case "secret-manager-secret": self = .secretManagerSecret
        case "secrets-manager-secret": self = .secretsManagerSecret
        case "security-group": self = .securityGroup
        case "server": self = .server
        case "snapshot": self = .snapshot
        case "sns-topic": self = .snsTopic
        case "spaces-bucket": self = .spacesBucket
        case "spanner-backup": self = .spannerBackup
        case "spanner-database": self = .spannerDatabase
        case "spanner-instance": self = .spannerInstance
        case "spectrum-application": self = .spectrumApplication
        case "sqs-queue": self = .sqsQueue
        case "ssh-key": self = .sshKey
        case "ssh-target": self = .sshTarget
        case "ssl-certificate": self = .sslCertificate
        case "ssm-parameter": self = .ssmParameter
        case "static-ip": self = .staticIp
        case "step-function": self = .stepFunction
        case "subnet": self = .subnet
        case "supervised-fine-tuning-job": self = .supervisedFineTuningJob
        case "target-group": self = .targetGroup
        case "training": self = .training
        case "transcript": self = .transcript
        case "transcription": self = .transcription
        case "transformation": self = .transformation
        case "tuned-model": self = .tunedModel
        case "tunnel": self = .tunnel
        case "turnstile-widget": self = .turnstileWidget
        case "turso-api-token": self = .tursoApiToken
        case "turso-database": self = .tursoDatabase
        case "turso-database-instance": self = .tursoDatabaseInstance
        case "turso-group": self = .tursoGroup
        case "turso-location": self = .tursoLocation
        case "turso-organization-invite": self = .tursoOrganizationInvite
        case "turso-organization-member": self = .tursoOrganizationMember
        case "upload-preset": self = .uploadPreset
        case "user": self = .user
        case "vector-store": self = .vectorStore
        case "vectorize-index": self = .vectorizeIndex
        case "vercel-deployment": self = .vercelDeployment
        case "vercel-domain": self = .vercelDomain
        case "vercel-env-var": self = .vercelEnvVar
        case "vercel-project": self = .vercelProject
        case "vercel-team": self = .vercelTeam
        case "vertex-ai-endpoint": self = .vertexAiEndpoint
        case "vertex-gemini-model": self = .vertexGeminiModel
        case "vocabulary": self = .vocabulary
        case "voice": self = .voice
        case "volume": self = .volume
        case "vpc": self = .vpc
        case "vpc-network": self = .vpcNetwork
        case "waf-web-acl": self = .wafWebAcl
        case "waiting-room": self = .waitingRoom
        case "webhook-endpoint": self = .webhookEndpoint
        case "worker": self = .worker
        case "worker-route": self = .workerRoute
        case "workers-ai-model": self = .workersAiModel
        case "workflow": self = .workflow
        case "workspace": self = .workspace
        case "zone": self = .zone
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .accessApplication: return "access-application"
        case .accessPolicy: return "access-policy"
        case .account: return "account"
        case .acmCertificate: return "acm-certificate"
        case .agentApiKey: return "agent-api-key"
        case .aiGateway: return "ai-gateway"
        case .aiSearch: return "ai-search"
        case .alb: return "alb"
        case .alertPolicy: return "alert-policy"
        case .alloydbCluster: return "alloydb-cluster"
        case .alloydbInstance: return "alloydb-instance"
        case .apiGateway: return "api-gateway"
        case .apiKey: return "api-key"
        case .app: return "app"
        case .appEngineService: return "app-engine-service"
        case .apprunnerService: return "apprunner-service"
        case .artifactRegistryRepo: return "artifact-registry-repo"
        case .auditEvent: return "audit-event"
        case .autoScalingGroup: return "auto-scaling-group"
        case .azureAksCluster: return "azure-aks-cluster"
        case .azureAppGateway: return "azure-app-gateway"
        case .azureAppRegistration: return "azure-app-registration"
        case .azureAppService: return "azure-app-service"
        case .azureAppServicePlan: return "azure-app-service-plan"
        case .azureContainerInstance: return "azure-container-instance"
        case .azureContainerRegistry: return "azure-container-registry"
        case .azureCosmosDb: return "azure-cosmos-db"
        case .azureDisk: return "azure-disk"
        case .azureDnsZone: return "azure-dns-zone"
        case .azureEventHub: return "azure-event-hub"
        case .azureFirewall: return "azure-firewall"
        case .azureFunctionApp: return "azure-function-app"
        case .azureKeyVault: return "azure-key-vault"
        case .azureLoadBalancer: return "azure-load-balancer"
        case .azureLogAnalytics: return "azure-log-analytics"
        case .azureManagedIdentity: return "azure-managed-identity"
        case .azureMysqlFlexible: return "azure-mysql-flexible"
        case .azureNatGateway: return "azure-nat-gateway"
        case .azureNsg: return "azure-nsg"
        case .azurePostgresFlexible: return "azure-postgres-flexible"
        case .azurePrivateDnsZone: return "azure-private-dns-zone"
        case .azurePublicIp: return "azure-public-ip"
        case .azureRedisCache: return "azure-redis-cache"
        case .azureResourceGroup: return "azure-resource-group"
        case .azureRouteTable: return "azure-route-table"
        case .azureServiceBus: return "azure-service-bus"
        case .azureSqlDatabase: return "azure-sql-database"
        case .azureStorageAccount: return "azure-storage-account"
        case .azureSubnet: return "azure-subnet"
        case .azureVm: return "azure-vm"
        case .azureVnet: return "azure-vnet"
        case .backendService: return "backend-service"
        case .backupVault: return "backup-vault"
        case .balance: return "balance"
        case .batch: return "batch"
        case .batchInferenceJob: return "batch-inference-job"
        case .batchJobQueue: return "batch-job-queue"
        case .bedrockModel: return "bedrock-model"
        case .bigqueryDataset: return "bigquery-dataset"
        case .bigqueryTable: return "bigquery-table"
        case .bigtableInstance: return "bigtable-instance"
        case .blockVolume: return "block-volume"
        case .cacheRule: return "cache-rule"
        case .cachedContent: return "cached-content"
        case .certificate: return "certificate"
        case .chDatabase: return "ch-database"
        case .chService: return "ch-service"
        case .cloudArmorPolicy: return "cloud-armor-policy"
        case .cloudBuildTrigger: return "cloud-build-trigger"
        case .cloudDeployPipeline: return "cloud-deploy-pipeline"
        case .cloudDnsRecordSet: return "cloud-dns-record-set"
        case .cloudDnsZone: return "cloud-dns-zone"
        case .cloudFunction: return "cloud-function"
        case .cloudNat: return "cloud-nat"
        case .cloudRouter: return "cloud-router"
        case .cloudRunService: return "cloud-run-service"
        case .cloudSchedulerJob: return "cloud-scheduler-job"
        case .cloudTasksQueue: return "cloud-tasks-queue"
        case .cloudformationStack: return "cloudformation-stack"
        case .cloudfrontDistribution: return "cloudfront-distribution"
        case .cloudsqlInstance: return "cloudsql-instance"
        case .cloudtrailTrail: return "cloudtrail-trail"
        case .cloudwatchAlarm: return "cloudwatch-alarm"
        case .cloudwatchLogGroup: return "cloudwatch-log-group"
        case .codebuildProject: return "codebuild-project"
        case .codepipelinePipeline: return "codepipeline-pipeline"
        case .cognitoUserPool: return "cognito-user-pool"
        case .collection: return "collection"
        case .composerEnvironment: return "composer-environment"
        case .connection: return "connection"
        case .container: return "container"
        case .containerRegistry: return "container-registry"
        case .customHostname: return "custom-hostname"
        case .customVoice: return "custom-voice"
        case .d1Database: return "d1-database"
        case .databricksApp: return "databricks-app"
        case .databricksCatalog: return "databricks-catalog"
        case .databricksCluster: return "databricks-cluster"
        case .databricksClusterPolicy: return "databricks-cluster-policy"
        case .databricksDashboard: return "databricks-dashboard"
        case .databricksFunction: return "databricks-function"
        case .databricksJob: return "databricks-job"
        case .databricksModelVersion: return "databricks-model-version"
        case .databricksNodeType: return "databricks-node-type"
        case .databricksPipeline: return "databricks-pipeline"
        case .databricksRegisteredModel: return "databricks-registered-model"
        case .databricksRepo: return "databricks-repo"
        case .databricksSchema: return "databricks-schema"
        case .databricksSecretScope: return "databricks-secret-scope"
        case .databricksServingEndpoint: return "databricks-serving-endpoint"
        case .databricksSqlQuery: return "databricks-sql-query"
        case .databricksSqlWarehouse: return "databricks-sql-warehouse"
        case .databricksTable: return "databricks-table"
        case .databricksVectorSearchEndpoint: return "databricks-vector-search-endpoint"
        case .databricksVectorSearchIndex: return "databricks-vector-search-index"
        case .databricksVolume: return "databricks-volume"
        case .databricksWorkspaceObject: return "databricks-workspace-object"
        case .dataflowJob: return "dataflow-job"
        case .dataset: return "dataset"
        case .dbSubnetGroup: return "db-subnet-group"
        case .dbUser: return "db-user"
        case .dedicatedInference: return "dedicated-inference"
        case .deployedModel: return "deployed-model"
        case .deployment: return "deployment"
        case .directory: return "directory"
        case .directoryGroup: return "directory-group"
        case .directoryUser: return "directory-user"
        case .dnsRecord: return "dns-record"
        case .dockerContainer: return "docker-container"
        case .dockerImage: return "docker-image"
        case .dockerNetwork: return "docker-network"
        case .dockerVolume: return "docker-volume"
        case .documentdbCluster: return "documentdb-cluster"
        case .doksCluster: return "doks-cluster"
        case .domain: return "domain"
        case .droplet: return "droplet"
        case .durableObjectNamespace: return "durable-object-namespace"
        case .dynamodbTable: return "dynamodb-table"
        case .ebsVolume: return "ebs-volume"
        case .ec2Instance: return "ec2-instance"
        case .ecrRepository: return "ecr-repository"
        case .ecsService: return "ecs-service"
        case .efsFileSystem: return "efs-file-system"
        case .eksCluster: return "eks-cluster"
        case .elasticIp: return "elastic-ip"
        case .elasticacheCluster: return "elasticache-cluster"
        case .emailRoutingRule: return "email-routing-rule"
        case .embedJob: return "embed-job"
        case .endpoint: return "endpoint"
        case .eval: return "eval"
        case .evaluation: return "evaluation"
        case .eventbridgeRule: return "eventbridge-rule"
        case .file: return "file"
        case .fileSearchDocument: return "file-search-document"
        case .fileSearchStore: return "file-search-store"
        case .fineTune: return "fine-tune"
        case .fineTuningJob: return "fine-tuning-job"
        case .finetunedModel: return "finetuned-model"
        case .firestoreDatabase: return "firestore-database"
        case .firewall: return "firewall"
        case .firewallRule: return "firewall-rule"
        case .floatingIp: return "floating-ip"
        case .folder: return "folder"
        case .forwardingRule: return "forwarding-rule"
        case .gateway: return "gateway"
        case .gceDisk: return "gce-disk"
        case .gceInstance: return "gce-instance"
        case .gcpProject: return "gcp-project"
        case .gcpServiceAccount: return "gcp-service-account"
        case .gcsBucket: return "gcs-bucket"
        case .genAiAgent: return "gen-ai-agent"
        case .genAiKnowledgeBase: return "gen-ai-knowledge-base"
        case .genAiModelRouter: return "gen-ai-model-router"
        case .gkeCluster: return "gke-cluster"
        case .glueDatabase: return "glue-database"
        case .groqBatch: return "groq-batch"
        case .groqFile: return "groq-file"
        case .groqFineTuning: return "groq-fine-tuning"
        case .groqModel: return "groq-model"
        case .hardware: return "hardware"
        case .healthCheck: return "health-check"
        case .healthcheck: return "healthcheck"
        case .historyItem: return "history-item"
        case .hyperdrive: return "hyperdrive"
        case .iamRole: return "iam-role"
        case .iamUser: return "iam-user"
        case .image: return "image"
        case .inferenceBatch: return "inference-batch"
        case .instance: return "instance"
        case .instanceGroup: return "instance-group"
        case .instanceTemplate: return "instance-template"
        case .internetGateway: return "internet-gateway"
        case .invitation: return "invitation"
        case .invite: return "invite"
        case .ipAccessRule: return "ip-access-rule"
        case .ipAllocation: return "ip-allocation"
        case .job: return "job"
        case .k8sCluster: return "k8s-cluster"
        case .k8sConfigmap: return "k8s-configmap"
        case .k8sCronjob: return "k8s-cronjob"
        case .k8sDaemonset: return "k8s-daemonset"
        case .k8sDeployment: return "k8s-deployment"
        case .k8sIngress: return "k8s-ingress"
        case .k8sJob: return "k8s-job"
        case .k8sNamespace: return "k8s-namespace"
        case .k8sNode: return "k8s-node"
        case .k8sPod: return "k8s-pod"
        case .k8sSecret: return "k8s-secret"
        case .k8sService: return "k8s-service"
        case .k8sStatefulset: return "k8s-statefulset"
        case .kafkaCluster: return "kafka-cluster"
        case .kafkaConsumerGroup: return "kafka-consumer-group"
        case .kafkaTopic: return "kafka-topic"
        case .kapsuleCluster: return "kapsule-cluster"
        case .kinesisStream: return "kinesis-stream"
        case .kmsKey: return "kms-key"
        case .kmsKeyRing: return "kms-key-ring"
        case .kvNamespace: return "kv-namespace"
        case .lambdaFunction: return "lambda-function"
        case .loadBalancer: return "load-balancer"
        case .logSink: return "log-sink"
        case .logpushJob: return "logpush-job"
        case .machine: return "machine"
        case .managedDatabase: return "managed-database"
        case .managedDb: return "managed-db"
        case .managedEndpoint: return "managed-endpoint"
        case .managedKube: return "managed-kube"
        case .mediaAsset: return "media-asset"
        case .member: return "member"
        case .memcachedInstance: return "memcached-instance"
        case .memorystoreMemcached: return "memorystore-memcached"
        case .memorystoreRedis: return "memorystore-redis"
        case .messageBatch: return "message-batch"
        case .mistralApiKey: return "mistral-api-key"
        case .mistralBatchJob: return "mistral-batch-job"
        case .mistralFile: return "mistral-file"
        case .mistralFineTuningJob: return "mistral-fine-tuning-job"
        case .mistralModel: return "mistral-model"
        case .mistralVoice: return "mistral-voice"
        case .model: return "model"
        case .modelApiKey: return "model-api-key"
        case .modelEndpoint: return "model-endpoint"
        case .mongodbDatabase: return "mongodb-database"
        case .mqBroker: return "mq-broker"
        case .mskCluster: return "msk-cluster"
        case .mssqlDatabase: return "mssql-database"
        case .mysqlDatabase: return "mysql-database"
        case .natGateway: return "nat-gateway"
        case .neonAiGateway: return "neon-ai-gateway"
        case .neonAuth: return "neon-auth"
        case .neonAuthDomain: return "neon-auth-domain"
        case .neonAuthOauthProvider: return "neon-auth-oauth-provider"
        case .neonBranch: return "neon-branch"
        case .neonBucket: return "neon-bucket"
        case .neonCredential: return "neon-credential"
        case .neonDataApi: return "neon-data-api"
        case .neonDatabase: return "neon-database"
        case .neonEndpoint: return "neon-endpoint"
        case .neonFunction: return "neon-function"
        case .neonProject: return "neon-project"
        case .neonRole: return "neon-role"
        case .neonSnapshot: return "neon-snapshot"
        case .neptuneCluster: return "neptune-cluster"
        case .netlifyBuildHook: return "netlify-build-hook"
        case .netlifyDeploy: return "netlify-deploy"
        case .netlifyDnsRecord: return "netlify-dns-record"
        case .netlifyDnsZone: return "netlify-dns-zone"
        case .netlifyEnvVar: return "netlify-env-var"
        case .netlifyForm: return "netlify-form"
        case .netlifySite: return "netlify-site"
        case .network: return "network"
        case .nfsShare: return "nfs-share"
        case .notificationPolicy: return "notification-policy"
        case .objectStorageBucket: return "object-storage-bucket"
        case .opensearchCluster: return "opensearch-cluster"
        case .opensearchDomain: return "opensearch-domain"
        case .organization: return "organization"
        case .organizationMembership: return "organization-membership"
        case .organizationUser: return "organization-user"
        case .pageRule: return "page-rule"
        case .pgDatabase: return "pg-database"
        case .pgSchema: return "pg-schema"
        case .placementGroup: return "placement-group"
        case .prediction: return "prediction"
        case .primaryIp: return "primary-ip"
        case .privateNetwork: return "private-network"
        case .project: return "project"
        case .projectApiKey: return "project-api-key"
        case .pronunciationDict: return "pronunciation-dict"
        case .pronunciationDictionary: return "pronunciation-dictionary"
        case .provider: return "provider"
        case .psBackup: return "ps-backup"
        case .psBranch: return "ps-branch"
        case .psDatabase: return "ps-database"
        case .psDeployRequest: return "ps-deploy-request"
        case .psPassword: return "ps-password"
        case .pubsubSubscription: return "pubsub-subscription"
        case .pubsubTopic: return "pubsub-topic"
        case .queue: return "queue"
        case .quota: return "quota"
        case .r2Bucket: return "r2-bucket"
        case .rateLimitRule: return "rate-limit-rule"
        case .rdbInstance: return "rdb-instance"
        case .rdsCluster: return "rds-cluster"
        case .rdsInstance: return "rds-instance"
        case .redirectRule: return "redirect-rule"
        case .redisInstance: return "redis-instance"
        case .redshiftCluster: return "redshift-cluster"
        case .reservedIp: return "reserved-ip"
        case .role: return "role"
        case .routeTable: return "route-table"
        case .route53HealthCheck: return "route53-health-check"
        case .route53HostedZone: return "route53-hosted-zone"
        case .route53RecordSet: return "route53-record-set"
        case .s3Bucket: return "s3-bucket"
        case .sagemakerEndpoint: return "sagemaker-endpoint"
        case .secret: return "secret"
        case .secretManagerSecret: return "secret-manager-secret"
        case .secretsManagerSecret: return "secrets-manager-secret"
        case .securityGroup: return "security-group"
        case .server: return "server"
        case .snapshot: return "snapshot"
        case .snsTopic: return "sns-topic"
        case .spacesBucket: return "spaces-bucket"
        case .spannerBackup: return "spanner-backup"
        case .spannerDatabase: return "spanner-database"
        case .spannerInstance: return "spanner-instance"
        case .spectrumApplication: return "spectrum-application"
        case .sqsQueue: return "sqs-queue"
        case .sshKey: return "ssh-key"
        case .sshTarget: return "ssh-target"
        case .sslCertificate: return "ssl-certificate"
        case .ssmParameter: return "ssm-parameter"
        case .staticIp: return "static-ip"
        case .stepFunction: return "step-function"
        case .subnet: return "subnet"
        case .supervisedFineTuningJob: return "supervised-fine-tuning-job"
        case .targetGroup: return "target-group"
        case .training: return "training"
        case .transcript: return "transcript"
        case .transcription: return "transcription"
        case .transformation: return "transformation"
        case .tunedModel: return "tuned-model"
        case .tunnel: return "tunnel"
        case .turnstileWidget: return "turnstile-widget"
        case .tursoApiToken: return "turso-api-token"
        case .tursoDatabase: return "turso-database"
        case .tursoDatabaseInstance: return "turso-database-instance"
        case .tursoGroup: return "turso-group"
        case .tursoLocation: return "turso-location"
        case .tursoOrganizationInvite: return "turso-organization-invite"
        case .tursoOrganizationMember: return "turso-organization-member"
        case .uploadPreset: return "upload-preset"
        case .user: return "user"
        case .vectorStore: return "vector-store"
        case .vectorizeIndex: return "vectorize-index"
        case .vercelDeployment: return "vercel-deployment"
        case .vercelDomain: return "vercel-domain"
        case .vercelEnvVar: return "vercel-env-var"
        case .vercelProject: return "vercel-project"
        case .vercelTeam: return "vercel-team"
        case .vertexAiEndpoint: return "vertex-ai-endpoint"
        case .vertexGeminiModel: return "vertex-gemini-model"
        case .vocabulary: return "vocabulary"
        case .voice: return "voice"
        case .volume: return "volume"
        case .vpc: return "vpc"
        case .vpcNetwork: return "vpc-network"
        case .wafWebAcl: return "waf-web-acl"
        case .waitingRoom: return "waiting-room"
        case .webhookEndpoint: return "webhook-endpoint"
        case .worker: return "worker"
        case .workerRoute: return "worker-route"
        case .workersAiModel: return "workers-ai-model"
        case .workflow: return "workflow"
        case .workspace: return "workspace"
        case .zone: return "zone"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [ResourceTypeId] = [
        .accessApplication,
        .accessPolicy,
        .account,
        .acmCertificate,
        .agentApiKey,
        .aiGateway,
        .aiSearch,
        .alb,
        .alertPolicy,
        .alloydbCluster,
        .alloydbInstance,
        .apiGateway,
        .apiKey,
        .app,
        .appEngineService,
        .apprunnerService,
        .artifactRegistryRepo,
        .auditEvent,
        .autoScalingGroup,
        .azureAksCluster,
        .azureAppGateway,
        .azureAppRegistration,
        .azureAppService,
        .azureAppServicePlan,
        .azureContainerInstance,
        .azureContainerRegistry,
        .azureCosmosDb,
        .azureDisk,
        .azureDnsZone,
        .azureEventHub,
        .azureFirewall,
        .azureFunctionApp,
        .azureKeyVault,
        .azureLoadBalancer,
        .azureLogAnalytics,
        .azureManagedIdentity,
        .azureMysqlFlexible,
        .azureNatGateway,
        .azureNsg,
        .azurePostgresFlexible,
        .azurePrivateDnsZone,
        .azurePublicIp,
        .azureRedisCache,
        .azureResourceGroup,
        .azureRouteTable,
        .azureServiceBus,
        .azureSqlDatabase,
        .azureStorageAccount,
        .azureSubnet,
        .azureVm,
        .azureVnet,
        .backendService,
        .backupVault,
        .balance,
        .batch,
        .batchInferenceJob,
        .batchJobQueue,
        .bedrockModel,
        .bigqueryDataset,
        .bigqueryTable,
        .bigtableInstance,
        .blockVolume,
        .cacheRule,
        .cachedContent,
        .certificate,
        .chDatabase,
        .chService,
        .cloudArmorPolicy,
        .cloudBuildTrigger,
        .cloudDeployPipeline,
        .cloudDnsRecordSet,
        .cloudDnsZone,
        .cloudFunction,
        .cloudNat,
        .cloudRouter,
        .cloudRunService,
        .cloudSchedulerJob,
        .cloudTasksQueue,
        .cloudformationStack,
        .cloudfrontDistribution,
        .cloudsqlInstance,
        .cloudtrailTrail,
        .cloudwatchAlarm,
        .cloudwatchLogGroup,
        .codebuildProject,
        .codepipelinePipeline,
        .cognitoUserPool,
        .collection,
        .composerEnvironment,
        .connection,
        .container,
        .containerRegistry,
        .customHostname,
        .customVoice,
        .d1Database,
        .databricksApp,
        .databricksCatalog,
        .databricksCluster,
        .databricksClusterPolicy,
        .databricksDashboard,
        .databricksFunction,
        .databricksJob,
        .databricksModelVersion,
        .databricksNodeType,
        .databricksPipeline,
        .databricksRegisteredModel,
        .databricksRepo,
        .databricksSchema,
        .databricksSecretScope,
        .databricksServingEndpoint,
        .databricksSqlQuery,
        .databricksSqlWarehouse,
        .databricksTable,
        .databricksVectorSearchEndpoint,
        .databricksVectorSearchIndex,
        .databricksVolume,
        .databricksWorkspaceObject,
        .dataflowJob,
        .dataset,
        .dbSubnetGroup,
        .dbUser,
        .dedicatedInference,
        .deployedModel,
        .deployment,
        .directory,
        .directoryGroup,
        .directoryUser,
        .dnsRecord,
        .dockerContainer,
        .dockerImage,
        .dockerNetwork,
        .dockerVolume,
        .documentdbCluster,
        .doksCluster,
        .domain,
        .droplet,
        .durableObjectNamespace,
        .dynamodbTable,
        .ebsVolume,
        .ec2Instance,
        .ecrRepository,
        .ecsService,
        .efsFileSystem,
        .eksCluster,
        .elasticIp,
        .elasticacheCluster,
        .emailRoutingRule,
        .embedJob,
        .endpoint,
        .eval,
        .evaluation,
        .eventbridgeRule,
        .file,
        .fileSearchDocument,
        .fileSearchStore,
        .fineTune,
        .fineTuningJob,
        .finetunedModel,
        .firestoreDatabase,
        .firewall,
        .firewallRule,
        .floatingIp,
        .folder,
        .forwardingRule,
        .gateway,
        .gceDisk,
        .gceInstance,
        .gcpProject,
        .gcpServiceAccount,
        .gcsBucket,
        .genAiAgent,
        .genAiKnowledgeBase,
        .genAiModelRouter,
        .gkeCluster,
        .glueDatabase,
        .groqBatch,
        .groqFile,
        .groqFineTuning,
        .groqModel,
        .hardware,
        .healthCheck,
        .healthcheck,
        .historyItem,
        .hyperdrive,
        .iamRole,
        .iamUser,
        .image,
        .inferenceBatch,
        .instance,
        .instanceGroup,
        .instanceTemplate,
        .internetGateway,
        .invitation,
        .invite,
        .ipAccessRule,
        .ipAllocation,
        .job,
        .k8sCluster,
        .k8sConfigmap,
        .k8sCronjob,
        .k8sDaemonset,
        .k8sDeployment,
        .k8sIngress,
        .k8sJob,
        .k8sNamespace,
        .k8sNode,
        .k8sPod,
        .k8sSecret,
        .k8sService,
        .k8sStatefulset,
        .kafkaCluster,
        .kafkaConsumerGroup,
        .kafkaTopic,
        .kapsuleCluster,
        .kinesisStream,
        .kmsKey,
        .kmsKeyRing,
        .kvNamespace,
        .lambdaFunction,
        .loadBalancer,
        .logSink,
        .logpushJob,
        .machine,
        .managedDatabase,
        .managedDb,
        .managedEndpoint,
        .managedKube,
        .mediaAsset,
        .member,
        .memcachedInstance,
        .memorystoreMemcached,
        .memorystoreRedis,
        .messageBatch,
        .mistralApiKey,
        .mistralBatchJob,
        .mistralFile,
        .mistralFineTuningJob,
        .mistralModel,
        .mistralVoice,
        .model,
        .modelApiKey,
        .modelEndpoint,
        .mongodbDatabase,
        .mqBroker,
        .mskCluster,
        .mssqlDatabase,
        .mysqlDatabase,
        .natGateway,
        .neonAiGateway,
        .neonAuth,
        .neonAuthDomain,
        .neonAuthOauthProvider,
        .neonBranch,
        .neonBucket,
        .neonCredential,
        .neonDataApi,
        .neonDatabase,
        .neonEndpoint,
        .neonFunction,
        .neonProject,
        .neonRole,
        .neonSnapshot,
        .neptuneCluster,
        .netlifyBuildHook,
        .netlifyDeploy,
        .netlifyDnsRecord,
        .netlifyDnsZone,
        .netlifyEnvVar,
        .netlifyForm,
        .netlifySite,
        .network,
        .nfsShare,
        .notificationPolicy,
        .objectStorageBucket,
        .opensearchCluster,
        .opensearchDomain,
        .organization,
        .organizationMembership,
        .organizationUser,
        .pageRule,
        .pgDatabase,
        .pgSchema,
        .placementGroup,
        .prediction,
        .primaryIp,
        .privateNetwork,
        .project,
        .projectApiKey,
        .pronunciationDict,
        .pronunciationDictionary,
        .provider,
        .psBackup,
        .psBranch,
        .psDatabase,
        .psDeployRequest,
        .psPassword,
        .pubsubSubscription,
        .pubsubTopic,
        .queue,
        .quota,
        .r2Bucket,
        .rateLimitRule,
        .rdbInstance,
        .rdsCluster,
        .rdsInstance,
        .redirectRule,
        .redisInstance,
        .redshiftCluster,
        .reservedIp,
        .role,
        .routeTable,
        .route53HealthCheck,
        .route53HostedZone,
        .route53RecordSet,
        .s3Bucket,
        .sagemakerEndpoint,
        .secret,
        .secretManagerSecret,
        .secretsManagerSecret,
        .securityGroup,
        .server,
        .snapshot,
        .snsTopic,
        .spacesBucket,
        .spannerBackup,
        .spannerDatabase,
        .spannerInstance,
        .spectrumApplication,
        .sqsQueue,
        .sshKey,
        .sshTarget,
        .sslCertificate,
        .ssmParameter,
        .staticIp,
        .stepFunction,
        .subnet,
        .supervisedFineTuningJob,
        .targetGroup,
        .training,
        .transcript,
        .transcription,
        .transformation,
        .tunedModel,
        .tunnel,
        .turnstileWidget,
        .tursoApiToken,
        .tursoDatabase,
        .tursoDatabaseInstance,
        .tursoGroup,
        .tursoLocation,
        .tursoOrganizationInvite,
        .tursoOrganizationMember,
        .uploadPreset,
        .user,
        .vectorStore,
        .vectorizeIndex,
        .vercelDeployment,
        .vercelDomain,
        .vercelEnvVar,
        .vercelProject,
        .vercelTeam,
        .vertexAiEndpoint,
        .vertexGeminiModel,
        .vocabulary,
        .voice,
        .volume,
        .vpc,
        .vpcNetwork,
        .wafWebAcl,
        .waitingRoom,
        .webhookEndpoint,
        .worker,
        .workerRoute,
        .workersAiModel,
        .workflow,
        .workspace,
        .zone,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
