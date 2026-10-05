/*
 * InfrawrenchSDK v1.54.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.54.0).
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
    case accessKey
    case accessPolicy
    case accessPolicyToken
    case account
    case acmCertificate
    case actionsCache
    case adminApiKey
    case agent
    case agentApiKey
    case agentConfig
    case agentSession
    case agentVariable
    case aiGateway
    case aiSearch
    case alb
    case alert
    case alertCondition
    case alertConfiguration
    case alertPolicy
    case alertRule
    case alignmentJob
    case alloydbCluster
    case alloydbInstance
    case analyticsEngineDataset
    case apiGateway
    case apiKey
    case apiToken
    case apmApplication
    case app
    case appEngineService
    case appSecret
    case applicationKey
    case apprunnerService
    case artifactRegistryRepo
    case auditEvent
    case autoScalingGroup
    case automation
    case autonomousDatabase
    case autoscalePool
    case azureAiServices
    case azureAksCluster
    case azureAppGateway
    case azureAppRegistration
    case azureAppService
    case azureAppServicePlan
    case azureContainerApp
    case azureContainerAppEnvironment
    case azureContainerAppJob
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
    case azureManagedRedis
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
    case backend
    case backendService
    case backupPolicy
    case backupSnapshot
    case backupVault
    case balance
    case basinCatalog
    case basinPipeline
    case basinSink
    case basinStream
    case basinTable
    case batch
    case batchInferenceJob
    case batchJobQueue
    case bedrockModel
    case bigqueryDataset
    case bigqueryTable
    case bigtableInstance
    case billingAccount
    case billingGroup
    case blockVolume
    case bootVolume
    case browserApplication
    case bucket
    case budget
    case budgetAlertRule
    case byokCredential
    case cacheRule
    case cachedContent
    case cdnEndpoint
    case certificate
    case chApiKey
    case chBackup
    case chClickpipe
    case chDatabase
    case chMember
    case chPostgres
    case chService
    case chain
    case cksCluster
    case clientKey
    case cloud
    case cloudArmorPolicy
    case cloudBuildTrigger
    case cloudDeployPipeline
    case cloudDnsRecordSet
    case cloudDnsZone
    case cloudFunction
    case cloudNat
    case cloudRouter
    case cloudRunJob
    case cloudRunService
    case cloudSchedulerJob
    case cloudTasksQueue
    case cloudformationStack
    case cloudfrontDistribution
    case cloudsqlInstance
    case cloudtrailTrail
    case cloudwatchAlarm
    case cloudwatchLogGroup
    case cluster
    case codebuildProject
    case codepipelinePipeline
    case codespace
    case cognitoUserPool
    case collection
    case collectionDocument
    case compartment
    case composerEnvironment
    case computeConfig
    case configStore
    case connection
    case connectivityRule
    case connector
    case contactPoint
    case container
    case containerRegistry
    case context
    case contextVariable
    case copilotSeat
    case costCenter
    case cronMonitor
    case customEnrichment
    case customHostname
    case customVoice
    case d1Database
    case dashboard
    case database
    case databaseUser
    case databricksApp
    case databricksCatalog
    case databricksCluster
    case databricksClusterPolicy
    case databricksDashboard
    case databricksFunction
    case databricksJob
    case databricksLakebaseBranch
    case databricksLakebaseProject
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
    case datasource
    case dbSubnetGroup
    case dbUser
    case dedicatedInference
    case deployedModel
    case deployment
    case depotActionsRepo
    case depotBuild
    case depotProject
    case depotRegistryImage
    case depotToken
    case depotTrustPolicy
    case device
    case dict
    case dictionary
    case directory
    case directoryGroup
    case directoryUser
    case disk
    case distributionCredential
    case dnsRecord
    case dnsZone
    case dockerContainer
    case dockerImage
    case dockerNetwork
    case dockerVolume
    case documentdbCluster
    case doksCluster
    case domain
    case domainRecord
    case downtime
    case dpoJob
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
    case elasticacheServerlessCache
    case emailRoutingRule
    case embedJob
    case encryptionKey
    case endpoint
    case enrichment
    case environment
    case eval
    case evaluation
    case evaluationJob
    case evaluator
    case eventbridgeRule
    case events2metrics
    case exportSink
    case `extension`
    case featureFlag
    case file
    case fileSearchDocument
    case fileSearchStore
    case fineTune
    case fineTuningJob
    case finetunedModel
    case firestoreDatabase
    case firewall
    case firewallRule
    case flexCluster
    case flexibleIp
    case flinkComputePool
    case floatingIp
    case folder
    case forwardingRule
    case function
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
    case gpuCluster
    case groqBatch
    case groqFile
    case groqFineTuning
    case groqModel
    case group
    case guardrail
    case hardware
    case healthCheck
    case healthcheck
    case historyItem
    case host
    case hostedRunner
    case hyperdrive
    case iamRole
    case iamUser
    case image
    case inferenceBatch
    case instance
    case instanceGroup
    case instanceTemplate
    case instanceType
    case internetGateway
    case invitation
    case invite
    case invoice
    case ipAccessEntry
    case ipAccessRule
    case ipAllocation
    case issue
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
    case key
    case kinesisStream
    case kmsKey
    case kmsKeyRing
    case knowledgeBaseDocument
    case knowledgeNote
    case ksqldbCluster
    case kubernetesCluster
    case kvNamespace
    case kvStore
    case lambdaFunction
    case languageIdJob
    case linode
    case liveSession
    case lkeCluster
    case lkeNodePool
    case llmModel
    case loadBalancer
    case logSink
    case loggingEndpoint
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
    case memorystoreValkey
    case messageBatch
    case messagingService
    case mistralAgent
    case mistralApiKey
    case mistralBatchJob
    case mistralFile
    case mistralFineTuningJob
    case mistralLibrary
    case mistralModel
    case mistralVoice
    case model
    case modelApi
    case modelApiKey
    case modelEndpoint
    case modelVersion
    case mongodbDatabase
    case monitor
    case mqBroker
    case mskCluster
    case mssqlDatabase
    case mysqlDatabase
    case namespace
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
    case netlifyDatabase
    case netlifyDeploy
    case netlifyDnsRecord
    case netlifyDnsZone
    case netlifyEnvVar
    case netlifyForm
    case netlifyNotificationHook
    case netlifySite
    case netlifySnippet
    case network
    case networkConnection
    case nexusEndpoint
    case nfsShare
    case nodePool
    case nodebalancer
    case notificationPolicy
    case objectStorageBucket
    case octaviaLoadBalancer
    case okeCluster
    case onlineArchive
    case opensearchCluster
    case opensearchDomain
    case organization
    case organizationApiKey
    case organizationDomain
    case organizationMembership
    case organizationRole
    case organizationUser
    case outgoingWebhook
    case pageRule
    case parsingRuleGroup
    case permission
    case pgDatabase
    case pgSchema
    case phoneNumber
    case pipeline
    case placementGroup
    case playbook
    case postgresCluster
    case postureIntegration
    case prediction
    case primaryIp
    case privateEndpointService
    case privateNetwork
    case productEnvironment
    case project
    case projectApiKey
    case projectRateLimit
    case projectServiceAccount
    case projectUser
    case projectVariable
    case pronunciationDict
    case pronunciationDictionary
    case provider
    case psBackup
    case psBranch
    case psDatabase
    case psDeployRequest
    case psPassword
    case psRole
    case psWebhook
    case pubsubSubscription
    case pubsubTopic
    case purchase
    case queue
    case quota
    case quotaRule
    case r2Bucket
    case rateLimit
    case rateLimitRule
    case rcAccount
    case rcAclRole
    case rcAclRule
    case rcAclUser
    case rcCloudAccount
    case rcDatabase
    case rcPscEndpoint
    case rcSubscription
    case rcTransitGateway
    case rcVpcPeering
    case rdbInstance
    case rdsCluster
    case rdsInstance
    case redirectRule
    case redisInstance
    case redshiftCluster
    case registryNamespace
    case reinforcementFineTuningJob
    case release
    case repoBlocklist
    case reservation
    case reservedIp
    case role
    case routeTable
    case route53HealthCheck
    case route53HostedZone
    case route53RecordSet
    case router
    case runner
    case runnerResourceClass
    case s3Bucket
    case sagemakerEndpoint
    case schedule
    case scheduledFunction
    case schemaRegistry
    case searchIndex
    case secret
    case secretManagerSecret
    case secretStore
    case secretsManagerSecret
    case secretsStoreSecret
    case securityGroup
    case securityList
    case sentimentJob
    case server
    case serverlessContainer
    case serverlessFunction
    case serverlessInstance
    case serverlessTrafficFilter
    case service
    case serviceAccount
    case serviceVersion
    case session
    case sharedVolume
    case skill
    case slo
    case snapshot
    case snowflakeAccount
    case snowflakeDatabase
    case snowflakeDynamicTable
    case snowflakePipe
    case snowflakeResourceMonitor
    case snowflakeRole
    case snowflakeSchema
    case snowflakeTask
    case snowflakeUser
    case snowflakeWarehouse
    case snsTopic
    case spacesBucket
    case spannerBackup
    case spannerDatabase
    case spannerInstance
    case spectrumApplication
    case spendAlert
    case spendLimit
    case spendingLimit
    case sqsQueue
    case sshKey
    case sshTarget
    case sslCertificate
    case ssmParameter
    case stack
    case stackPlugin
    case stackscript
    case staticIp
    case stepFunction
    case storageBox
    case subaccount
    case subnet
    case supervisedFineTuningJob
    case syntheticCheck
    case syntheticMonitor
    case syntheticsTest
    case tailnet
    case targetGroup
    case tcoPolicy
    case team
    case teamMember
    case tenancy
    case tlsCertificate
    case tlsSubscription
    case topicJob
    case trafficFilter
    case training
    case trainingJob
    case trainingProject
    case transcript
    case transcription
    case transformation
    case trigger
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
    case twimlApp
    case uploadMapping
    case uploadPreset
    case uptimeCheck
    case uptimeMonitor
    case usageTrigger
    case user
    case userInvite
    case utApp
    case utFile
    case vcn
    case vectorStore
    case vectorizeIndex
    case vercelDeployment
    case vercelDnsRecord
    case vercelDomain
    case vercelEnvVar
    case vercelProject
    case vercelTeam
    case vercelWebhook
    case verifyService
    case vertexAiEndpoint
    case vertexGeminiModel
    case vm
    case vocabulary
    case voice
    case voiceAgent
    case volume
    case volumeSnapshot
    case vpc
    case vpcNatGateway
    case vpcNetwork
    case vpcPeering
    case vpcSubnet
    case wafWebAcl
    case waitingRoom
    case webhook
    case webhookEndpoint
    case webhookSubscription
    case worker
    case workerRoute
    case workersAiModel
    case workflow
    case workload
    case workspace
    case workspaceMember
    case zone
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "access-application": self = .accessApplication
        case "access-key": self = .accessKey
        case "access-policy": self = .accessPolicy
        case "access-policy-token": self = .accessPolicyToken
        case "account": self = .account
        case "acm-certificate": self = .acmCertificate
        case "actions-cache": self = .actionsCache
        case "admin-api-key": self = .adminApiKey
        case "agent": self = .agent
        case "agent-api-key": self = .agentApiKey
        case "agent-config": self = .agentConfig
        case "agent-session": self = .agentSession
        case "agent-variable": self = .agentVariable
        case "ai-gateway": self = .aiGateway
        case "ai-search": self = .aiSearch
        case "alb": self = .alb
        case "alert": self = .alert
        case "alert-condition": self = .alertCondition
        case "alert-configuration": self = .alertConfiguration
        case "alert-policy": self = .alertPolicy
        case "alert-rule": self = .alertRule
        case "alignment-job": self = .alignmentJob
        case "alloydb-cluster": self = .alloydbCluster
        case "alloydb-instance": self = .alloydbInstance
        case "analytics-engine-dataset": self = .analyticsEngineDataset
        case "api-gateway": self = .apiGateway
        case "api-key": self = .apiKey
        case "api-token": self = .apiToken
        case "apm-application": self = .apmApplication
        case "app": self = .app
        case "app-engine-service": self = .appEngineService
        case "app-secret": self = .appSecret
        case "application-key": self = .applicationKey
        case "apprunner-service": self = .apprunnerService
        case "artifact-registry-repo": self = .artifactRegistryRepo
        case "audit-event": self = .auditEvent
        case "auto-scaling-group": self = .autoScalingGroup
        case "automation": self = .automation
        case "autonomous-database": self = .autonomousDatabase
        case "autoscale-pool": self = .autoscalePool
        case "azure-ai-services": self = .azureAiServices
        case "azure-aks-cluster": self = .azureAksCluster
        case "azure-app-gateway": self = .azureAppGateway
        case "azure-app-registration": self = .azureAppRegistration
        case "azure-app-service": self = .azureAppService
        case "azure-app-service-plan": self = .azureAppServicePlan
        case "azure-container-app": self = .azureContainerApp
        case "azure-container-app-environment": self = .azureContainerAppEnvironment
        case "azure-container-app-job": self = .azureContainerAppJob
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
        case "azure-managed-redis": self = .azureManagedRedis
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
        case "backend": self = .backend
        case "backend-service": self = .backendService
        case "backup-policy": self = .backupPolicy
        case "backup-snapshot": self = .backupSnapshot
        case "backup-vault": self = .backupVault
        case "balance": self = .balance
        case "basin-catalog": self = .basinCatalog
        case "basin-pipeline": self = .basinPipeline
        case "basin-sink": self = .basinSink
        case "basin-stream": self = .basinStream
        case "basin-table": self = .basinTable
        case "batch": self = .batch
        case "batch-inference-job": self = .batchInferenceJob
        case "batch-job-queue": self = .batchJobQueue
        case "bedrock-model": self = .bedrockModel
        case "bigquery-dataset": self = .bigqueryDataset
        case "bigquery-table": self = .bigqueryTable
        case "bigtable-instance": self = .bigtableInstance
        case "billing-account": self = .billingAccount
        case "billing-group": self = .billingGroup
        case "block-volume": self = .blockVolume
        case "boot-volume": self = .bootVolume
        case "browser-application": self = .browserApplication
        case "bucket": self = .bucket
        case "budget": self = .budget
        case "budget-alert-rule": self = .budgetAlertRule
        case "byok-credential": self = .byokCredential
        case "cache-rule": self = .cacheRule
        case "cached-content": self = .cachedContent
        case "cdn-endpoint": self = .cdnEndpoint
        case "certificate": self = .certificate
        case "ch-api-key": self = .chApiKey
        case "ch-backup": self = .chBackup
        case "ch-clickpipe": self = .chClickpipe
        case "ch-database": self = .chDatabase
        case "ch-member": self = .chMember
        case "ch-postgres": self = .chPostgres
        case "ch-service": self = .chService
        case "chain": self = .chain
        case "cks-cluster": self = .cksCluster
        case "client-key": self = .clientKey
        case "cloud": self = .cloud
        case "cloud-armor-policy": self = .cloudArmorPolicy
        case "cloud-build-trigger": self = .cloudBuildTrigger
        case "cloud-deploy-pipeline": self = .cloudDeployPipeline
        case "cloud-dns-record-set": self = .cloudDnsRecordSet
        case "cloud-dns-zone": self = .cloudDnsZone
        case "cloud-function": self = .cloudFunction
        case "cloud-nat": self = .cloudNat
        case "cloud-router": self = .cloudRouter
        case "cloud-run-job": self = .cloudRunJob
        case "cloud-run-service": self = .cloudRunService
        case "cloud-scheduler-job": self = .cloudSchedulerJob
        case "cloud-tasks-queue": self = .cloudTasksQueue
        case "cloudformation-stack": self = .cloudformationStack
        case "cloudfront-distribution": self = .cloudfrontDistribution
        case "cloudsql-instance": self = .cloudsqlInstance
        case "cloudtrail-trail": self = .cloudtrailTrail
        case "cloudwatch-alarm": self = .cloudwatchAlarm
        case "cloudwatch-log-group": self = .cloudwatchLogGroup
        case "cluster": self = .cluster
        case "codebuild-project": self = .codebuildProject
        case "codepipeline-pipeline": self = .codepipelinePipeline
        case "codespace": self = .codespace
        case "cognito-user-pool": self = .cognitoUserPool
        case "collection": self = .collection
        case "collection-document": self = .collectionDocument
        case "compartment": self = .compartment
        case "composer-environment": self = .composerEnvironment
        case "compute-config": self = .computeConfig
        case "config-store": self = .configStore
        case "connection": self = .connection
        case "connectivity-rule": self = .connectivityRule
        case "connector": self = .connector
        case "contact-point": self = .contactPoint
        case "container": self = .container
        case "container-registry": self = .containerRegistry
        case "context": self = .context
        case "context-variable": self = .contextVariable
        case "copilot-seat": self = .copilotSeat
        case "cost-center": self = .costCenter
        case "cron-monitor": self = .cronMonitor
        case "custom-enrichment": self = .customEnrichment
        case "custom-hostname": self = .customHostname
        case "custom-voice": self = .customVoice
        case "d1-database": self = .d1Database
        case "dashboard": self = .dashboard
        case "database": self = .database
        case "database-user": self = .databaseUser
        case "databricks-app": self = .databricksApp
        case "databricks-catalog": self = .databricksCatalog
        case "databricks-cluster": self = .databricksCluster
        case "databricks-cluster-policy": self = .databricksClusterPolicy
        case "databricks-dashboard": self = .databricksDashboard
        case "databricks-function": self = .databricksFunction
        case "databricks-job": self = .databricksJob
        case "databricks-lakebase-branch": self = .databricksLakebaseBranch
        case "databricks-lakebase-project": self = .databricksLakebaseProject
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
        case "datasource": self = .datasource
        case "db-subnet-group": self = .dbSubnetGroup
        case "db-user": self = .dbUser
        case "dedicated-inference": self = .dedicatedInference
        case "deployed-model": self = .deployedModel
        case "deployment": self = .deployment
        case "depot-actions-repo": self = .depotActionsRepo
        case "depot-build": self = .depotBuild
        case "depot-project": self = .depotProject
        case "depot-registry-image": self = .depotRegistryImage
        case "depot-token": self = .depotToken
        case "depot-trust-policy": self = .depotTrustPolicy
        case "device": self = .device
        case "dict": self = .dict
        case "dictionary": self = .dictionary
        case "directory": self = .directory
        case "directory-group": self = .directoryGroup
        case "directory-user": self = .directoryUser
        case "disk": self = .disk
        case "distribution-credential": self = .distributionCredential
        case "dns-record": self = .dnsRecord
        case "dns-zone": self = .dnsZone
        case "docker-container": self = .dockerContainer
        case "docker-image": self = .dockerImage
        case "docker-network": self = .dockerNetwork
        case "docker-volume": self = .dockerVolume
        case "documentdb-cluster": self = .documentdbCluster
        case "doks-cluster": self = .doksCluster
        case "domain": self = .domain
        case "domain-record": self = .domainRecord
        case "downtime": self = .downtime
        case "dpo-job": self = .dpoJob
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
        case "elasticache-serverless-cache": self = .elasticacheServerlessCache
        case "email-routing-rule": self = .emailRoutingRule
        case "embed-job": self = .embedJob
        case "encryption-key": self = .encryptionKey
        case "endpoint": self = .endpoint
        case "enrichment": self = .enrichment
        case "environment": self = .environment
        case "eval": self = .eval
        case "evaluation": self = .evaluation
        case "evaluation-job": self = .evaluationJob
        case "evaluator": self = .evaluator
        case "eventbridge-rule": self = .eventbridgeRule
        case "events2metrics": self = .events2metrics
        case "export-sink": self = .exportSink
        case "extension": self = .`extension`
        case "feature-flag": self = .featureFlag
        case "file": self = .file
        case "file-search-document": self = .fileSearchDocument
        case "file-search-store": self = .fileSearchStore
        case "fine-tune": self = .fineTune
        case "fine-tuning-job": self = .fineTuningJob
        case "finetuned-model": self = .finetunedModel
        case "firestore-database": self = .firestoreDatabase
        case "firewall": self = .firewall
        case "firewall-rule": self = .firewallRule
        case "flex-cluster": self = .flexCluster
        case "flexible-ip": self = .flexibleIp
        case "flink-compute-pool": self = .flinkComputePool
        case "floating-ip": self = .floatingIp
        case "folder": self = .folder
        case "forwarding-rule": self = .forwardingRule
        case "function": self = .function
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
        case "gpu-cluster": self = .gpuCluster
        case "groq-batch": self = .groqBatch
        case "groq-file": self = .groqFile
        case "groq-fine-tuning": self = .groqFineTuning
        case "groq-model": self = .groqModel
        case "group": self = .group
        case "guardrail": self = .guardrail
        case "hardware": self = .hardware
        case "health-check": self = .healthCheck
        case "healthcheck": self = .healthcheck
        case "history-item": self = .historyItem
        case "host": self = .host
        case "hosted-runner": self = .hostedRunner
        case "hyperdrive": self = .hyperdrive
        case "iam-role": self = .iamRole
        case "iam-user": self = .iamUser
        case "image": self = .image
        case "inference-batch": self = .inferenceBatch
        case "instance": self = .instance
        case "instance-group": self = .instanceGroup
        case "instance-template": self = .instanceTemplate
        case "instance-type": self = .instanceType
        case "internet-gateway": self = .internetGateway
        case "invitation": self = .invitation
        case "invite": self = .invite
        case "invoice": self = .invoice
        case "ip-access-entry": self = .ipAccessEntry
        case "ip-access-rule": self = .ipAccessRule
        case "ip-allocation": self = .ipAllocation
        case "issue": self = .issue
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
        case "key": self = .key
        case "kinesis-stream": self = .kinesisStream
        case "kms-key": self = .kmsKey
        case "kms-key-ring": self = .kmsKeyRing
        case "knowledge-base-document": self = .knowledgeBaseDocument
        case "knowledge-note": self = .knowledgeNote
        case "ksqldb-cluster": self = .ksqldbCluster
        case "kubernetes-cluster": self = .kubernetesCluster
        case "kv-namespace": self = .kvNamespace
        case "kv-store": self = .kvStore
        case "lambda-function": self = .lambdaFunction
        case "language-id-job": self = .languageIdJob
        case "linode": self = .linode
        case "live-session": self = .liveSession
        case "lke-cluster": self = .lkeCluster
        case "lke-node-pool": self = .lkeNodePool
        case "llm-model": self = .llmModel
        case "load-balancer": self = .loadBalancer
        case "log-sink": self = .logSink
        case "logging-endpoint": self = .loggingEndpoint
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
        case "memorystore-valkey": self = .memorystoreValkey
        case "message-batch": self = .messageBatch
        case "messaging-service": self = .messagingService
        case "mistral-agent": self = .mistralAgent
        case "mistral-api-key": self = .mistralApiKey
        case "mistral-batch-job": self = .mistralBatchJob
        case "mistral-file": self = .mistralFile
        case "mistral-fine-tuning-job": self = .mistralFineTuningJob
        case "mistral-library": self = .mistralLibrary
        case "mistral-model": self = .mistralModel
        case "mistral-voice": self = .mistralVoice
        case "model": self = .model
        case "model-api": self = .modelApi
        case "model-api-key": self = .modelApiKey
        case "model-endpoint": self = .modelEndpoint
        case "model-version": self = .modelVersion
        case "mongodb-database": self = .mongodbDatabase
        case "monitor": self = .monitor
        case "mq-broker": self = .mqBroker
        case "msk-cluster": self = .mskCluster
        case "mssql-database": self = .mssqlDatabase
        case "mysql-database": self = .mysqlDatabase
        case "namespace": self = .namespace
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
        case "netlify-database": self = .netlifyDatabase
        case "netlify-deploy": self = .netlifyDeploy
        case "netlify-dns-record": self = .netlifyDnsRecord
        case "netlify-dns-zone": self = .netlifyDnsZone
        case "netlify-env-var": self = .netlifyEnvVar
        case "netlify-form": self = .netlifyForm
        case "netlify-notification-hook": self = .netlifyNotificationHook
        case "netlify-site": self = .netlifySite
        case "netlify-snippet": self = .netlifySnippet
        case "network": self = .network
        case "network-connection": self = .networkConnection
        case "nexus-endpoint": self = .nexusEndpoint
        case "nfs-share": self = .nfsShare
        case "node-pool": self = .nodePool
        case "nodebalancer": self = .nodebalancer
        case "notification-policy": self = .notificationPolicy
        case "object-storage-bucket": self = .objectStorageBucket
        case "octavia-load-balancer": self = .octaviaLoadBalancer
        case "oke-cluster": self = .okeCluster
        case "online-archive": self = .onlineArchive
        case "opensearch-cluster": self = .opensearchCluster
        case "opensearch-domain": self = .opensearchDomain
        case "organization": self = .organization
        case "organization-api-key": self = .organizationApiKey
        case "organization-domain": self = .organizationDomain
        case "organization-membership": self = .organizationMembership
        case "organization-role": self = .organizationRole
        case "organization-user": self = .organizationUser
        case "outgoing-webhook": self = .outgoingWebhook
        case "page-rule": self = .pageRule
        case "parsing-rule-group": self = .parsingRuleGroup
        case "permission": self = .permission
        case "pg-database": self = .pgDatabase
        case "pg-schema": self = .pgSchema
        case "phone-number": self = .phoneNumber
        case "pipeline": self = .pipeline
        case "placement-group": self = .placementGroup
        case "playbook": self = .playbook
        case "postgres-cluster": self = .postgresCluster
        case "posture-integration": self = .postureIntegration
        case "prediction": self = .prediction
        case "primary-ip": self = .primaryIp
        case "private-endpoint-service": self = .privateEndpointService
        case "private-network": self = .privateNetwork
        case "product-environment": self = .productEnvironment
        case "project": self = .project
        case "project-api-key": self = .projectApiKey
        case "project-rate-limit": self = .projectRateLimit
        case "project-service-account": self = .projectServiceAccount
        case "project-user": self = .projectUser
        case "project-variable": self = .projectVariable
        case "pronunciation-dict": self = .pronunciationDict
        case "pronunciation-dictionary": self = .pronunciationDictionary
        case "provider": self = .provider
        case "ps-backup": self = .psBackup
        case "ps-branch": self = .psBranch
        case "ps-database": self = .psDatabase
        case "ps-deploy-request": self = .psDeployRequest
        case "ps-password": self = .psPassword
        case "ps-role": self = .psRole
        case "ps-webhook": self = .psWebhook
        case "pubsub-subscription": self = .pubsubSubscription
        case "pubsub-topic": self = .pubsubTopic
        case "purchase": self = .purchase
        case "queue": self = .queue
        case "quota": self = .quota
        case "quota-rule": self = .quotaRule
        case "r2-bucket": self = .r2Bucket
        case "rate-limit": self = .rateLimit
        case "rate-limit-rule": self = .rateLimitRule
        case "rc-account": self = .rcAccount
        case "rc-acl-role": self = .rcAclRole
        case "rc-acl-rule": self = .rcAclRule
        case "rc-acl-user": self = .rcAclUser
        case "rc-cloud-account": self = .rcCloudAccount
        case "rc-database": self = .rcDatabase
        case "rc-psc-endpoint": self = .rcPscEndpoint
        case "rc-subscription": self = .rcSubscription
        case "rc-transit-gateway": self = .rcTransitGateway
        case "rc-vpc-peering": self = .rcVpcPeering
        case "rdb-instance": self = .rdbInstance
        case "rds-cluster": self = .rdsCluster
        case "rds-instance": self = .rdsInstance
        case "redirect-rule": self = .redirectRule
        case "redis-instance": self = .redisInstance
        case "redshift-cluster": self = .redshiftCluster
        case "registry-namespace": self = .registryNamespace
        case "reinforcement-fine-tuning-job": self = .reinforcementFineTuningJob
        case "release": self = .release
        case "repo-blocklist": self = .repoBlocklist
        case "reservation": self = .reservation
        case "reserved-ip": self = .reservedIp
        case "role": self = .role
        case "route-table": self = .routeTable
        case "route53-health-check": self = .route53HealthCheck
        case "route53-hosted-zone": self = .route53HostedZone
        case "route53-record-set": self = .route53RecordSet
        case "router": self = .router
        case "runner": self = .runner
        case "runner-resource-class": self = .runnerResourceClass
        case "s3-bucket": self = .s3Bucket
        case "sagemaker-endpoint": self = .sagemakerEndpoint
        case "schedule": self = .schedule
        case "scheduled-function": self = .scheduledFunction
        case "schema-registry": self = .schemaRegistry
        case "search-index": self = .searchIndex
        case "secret": self = .secret
        case "secret-manager-secret": self = .secretManagerSecret
        case "secret-store": self = .secretStore
        case "secrets-manager-secret": self = .secretsManagerSecret
        case "secrets-store-secret": self = .secretsStoreSecret
        case "security-group": self = .securityGroup
        case "security-list": self = .securityList
        case "sentiment-job": self = .sentimentJob
        case "server": self = .server
        case "serverless-container": self = .serverlessContainer
        case "serverless-function": self = .serverlessFunction
        case "serverless-instance": self = .serverlessInstance
        case "serverless-traffic-filter": self = .serverlessTrafficFilter
        case "service": self = .service
        case "service-account": self = .serviceAccount
        case "service-version": self = .serviceVersion
        case "session": self = .session
        case "shared-volume": self = .sharedVolume
        case "skill": self = .skill
        case "slo": self = .slo
        case "snapshot": self = .snapshot
        case "snowflake-account": self = .snowflakeAccount
        case "snowflake-database": self = .snowflakeDatabase
        case "snowflake-dynamic-table": self = .snowflakeDynamicTable
        case "snowflake-pipe": self = .snowflakePipe
        case "snowflake-resource-monitor": self = .snowflakeResourceMonitor
        case "snowflake-role": self = .snowflakeRole
        case "snowflake-schema": self = .snowflakeSchema
        case "snowflake-task": self = .snowflakeTask
        case "snowflake-user": self = .snowflakeUser
        case "snowflake-warehouse": self = .snowflakeWarehouse
        case "sns-topic": self = .snsTopic
        case "spaces-bucket": self = .spacesBucket
        case "spanner-backup": self = .spannerBackup
        case "spanner-database": self = .spannerDatabase
        case "spanner-instance": self = .spannerInstance
        case "spectrum-application": self = .spectrumApplication
        case "spend-alert": self = .spendAlert
        case "spend-limit": self = .spendLimit
        case "spending-limit": self = .spendingLimit
        case "sqs-queue": self = .sqsQueue
        case "ssh-key": self = .sshKey
        case "ssh-target": self = .sshTarget
        case "ssl-certificate": self = .sslCertificate
        case "ssm-parameter": self = .ssmParameter
        case "stack": self = .stack
        case "stack-plugin": self = .stackPlugin
        case "stackscript": self = .stackscript
        case "static-ip": self = .staticIp
        case "step-function": self = .stepFunction
        case "storage-box": self = .storageBox
        case "subaccount": self = .subaccount
        case "subnet": self = .subnet
        case "supervised-fine-tuning-job": self = .supervisedFineTuningJob
        case "synthetic-check": self = .syntheticCheck
        case "synthetic-monitor": self = .syntheticMonitor
        case "synthetics-test": self = .syntheticsTest
        case "tailnet": self = .tailnet
        case "target-group": self = .targetGroup
        case "tco-policy": self = .tcoPolicy
        case "team": self = .team
        case "team-member": self = .teamMember
        case "tenancy": self = .tenancy
        case "tls-certificate": self = .tlsCertificate
        case "tls-subscription": self = .tlsSubscription
        case "topic-job": self = .topicJob
        case "traffic-filter": self = .trafficFilter
        case "training": self = .training
        case "training-job": self = .trainingJob
        case "training-project": self = .trainingProject
        case "transcript": self = .transcript
        case "transcription": self = .transcription
        case "transformation": self = .transformation
        case "trigger": self = .trigger
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
        case "twiml-app": self = .twimlApp
        case "upload-mapping": self = .uploadMapping
        case "upload-preset": self = .uploadPreset
        case "uptime-check": self = .uptimeCheck
        case "uptime-monitor": self = .uptimeMonitor
        case "usage-trigger": self = .usageTrigger
        case "user": self = .user
        case "user-invite": self = .userInvite
        case "ut-app": self = .utApp
        case "ut-file": self = .utFile
        case "vcn": self = .vcn
        case "vector-store": self = .vectorStore
        case "vectorize-index": self = .vectorizeIndex
        case "vercel-deployment": self = .vercelDeployment
        case "vercel-dns-record": self = .vercelDnsRecord
        case "vercel-domain": self = .vercelDomain
        case "vercel-env-var": self = .vercelEnvVar
        case "vercel-project": self = .vercelProject
        case "vercel-team": self = .vercelTeam
        case "vercel-webhook": self = .vercelWebhook
        case "verify-service": self = .verifyService
        case "vertex-ai-endpoint": self = .vertexAiEndpoint
        case "vertex-gemini-model": self = .vertexGeminiModel
        case "vm": self = .vm
        case "vocabulary": self = .vocabulary
        case "voice": self = .voice
        case "voice-agent": self = .voiceAgent
        case "volume": self = .volume
        case "volume-snapshot": self = .volumeSnapshot
        case "vpc": self = .vpc
        case "vpc-nat-gateway": self = .vpcNatGateway
        case "vpc-network": self = .vpcNetwork
        case "vpc-peering": self = .vpcPeering
        case "vpc-subnet": self = .vpcSubnet
        case "waf-web-acl": self = .wafWebAcl
        case "waiting-room": self = .waitingRoom
        case "webhook": self = .webhook
        case "webhook-endpoint": self = .webhookEndpoint
        case "webhook-subscription": self = .webhookSubscription
        case "worker": self = .worker
        case "worker-route": self = .workerRoute
        case "workers-ai-model": self = .workersAiModel
        case "workflow": self = .workflow
        case "workload": self = .workload
        case "workspace": self = .workspace
        case "workspace-member": self = .workspaceMember
        case "zone": self = .zone
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .accessApplication: return "access-application"
        case .accessKey: return "access-key"
        case .accessPolicy: return "access-policy"
        case .accessPolicyToken: return "access-policy-token"
        case .account: return "account"
        case .acmCertificate: return "acm-certificate"
        case .actionsCache: return "actions-cache"
        case .adminApiKey: return "admin-api-key"
        case .agent: return "agent"
        case .agentApiKey: return "agent-api-key"
        case .agentConfig: return "agent-config"
        case .agentSession: return "agent-session"
        case .agentVariable: return "agent-variable"
        case .aiGateway: return "ai-gateway"
        case .aiSearch: return "ai-search"
        case .alb: return "alb"
        case .alert: return "alert"
        case .alertCondition: return "alert-condition"
        case .alertConfiguration: return "alert-configuration"
        case .alertPolicy: return "alert-policy"
        case .alertRule: return "alert-rule"
        case .alignmentJob: return "alignment-job"
        case .alloydbCluster: return "alloydb-cluster"
        case .alloydbInstance: return "alloydb-instance"
        case .analyticsEngineDataset: return "analytics-engine-dataset"
        case .apiGateway: return "api-gateway"
        case .apiKey: return "api-key"
        case .apiToken: return "api-token"
        case .apmApplication: return "apm-application"
        case .app: return "app"
        case .appEngineService: return "app-engine-service"
        case .appSecret: return "app-secret"
        case .applicationKey: return "application-key"
        case .apprunnerService: return "apprunner-service"
        case .artifactRegistryRepo: return "artifact-registry-repo"
        case .auditEvent: return "audit-event"
        case .autoScalingGroup: return "auto-scaling-group"
        case .automation: return "automation"
        case .autonomousDatabase: return "autonomous-database"
        case .autoscalePool: return "autoscale-pool"
        case .azureAiServices: return "azure-ai-services"
        case .azureAksCluster: return "azure-aks-cluster"
        case .azureAppGateway: return "azure-app-gateway"
        case .azureAppRegistration: return "azure-app-registration"
        case .azureAppService: return "azure-app-service"
        case .azureAppServicePlan: return "azure-app-service-plan"
        case .azureContainerApp: return "azure-container-app"
        case .azureContainerAppEnvironment: return "azure-container-app-environment"
        case .azureContainerAppJob: return "azure-container-app-job"
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
        case .azureManagedRedis: return "azure-managed-redis"
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
        case .backend: return "backend"
        case .backendService: return "backend-service"
        case .backupPolicy: return "backup-policy"
        case .backupSnapshot: return "backup-snapshot"
        case .backupVault: return "backup-vault"
        case .balance: return "balance"
        case .basinCatalog: return "basin-catalog"
        case .basinPipeline: return "basin-pipeline"
        case .basinSink: return "basin-sink"
        case .basinStream: return "basin-stream"
        case .basinTable: return "basin-table"
        case .batch: return "batch"
        case .batchInferenceJob: return "batch-inference-job"
        case .batchJobQueue: return "batch-job-queue"
        case .bedrockModel: return "bedrock-model"
        case .bigqueryDataset: return "bigquery-dataset"
        case .bigqueryTable: return "bigquery-table"
        case .bigtableInstance: return "bigtable-instance"
        case .billingAccount: return "billing-account"
        case .billingGroup: return "billing-group"
        case .blockVolume: return "block-volume"
        case .bootVolume: return "boot-volume"
        case .browserApplication: return "browser-application"
        case .bucket: return "bucket"
        case .budget: return "budget"
        case .budgetAlertRule: return "budget-alert-rule"
        case .byokCredential: return "byok-credential"
        case .cacheRule: return "cache-rule"
        case .cachedContent: return "cached-content"
        case .cdnEndpoint: return "cdn-endpoint"
        case .certificate: return "certificate"
        case .chApiKey: return "ch-api-key"
        case .chBackup: return "ch-backup"
        case .chClickpipe: return "ch-clickpipe"
        case .chDatabase: return "ch-database"
        case .chMember: return "ch-member"
        case .chPostgres: return "ch-postgres"
        case .chService: return "ch-service"
        case .chain: return "chain"
        case .cksCluster: return "cks-cluster"
        case .clientKey: return "client-key"
        case .cloud: return "cloud"
        case .cloudArmorPolicy: return "cloud-armor-policy"
        case .cloudBuildTrigger: return "cloud-build-trigger"
        case .cloudDeployPipeline: return "cloud-deploy-pipeline"
        case .cloudDnsRecordSet: return "cloud-dns-record-set"
        case .cloudDnsZone: return "cloud-dns-zone"
        case .cloudFunction: return "cloud-function"
        case .cloudNat: return "cloud-nat"
        case .cloudRouter: return "cloud-router"
        case .cloudRunJob: return "cloud-run-job"
        case .cloudRunService: return "cloud-run-service"
        case .cloudSchedulerJob: return "cloud-scheduler-job"
        case .cloudTasksQueue: return "cloud-tasks-queue"
        case .cloudformationStack: return "cloudformation-stack"
        case .cloudfrontDistribution: return "cloudfront-distribution"
        case .cloudsqlInstance: return "cloudsql-instance"
        case .cloudtrailTrail: return "cloudtrail-trail"
        case .cloudwatchAlarm: return "cloudwatch-alarm"
        case .cloudwatchLogGroup: return "cloudwatch-log-group"
        case .cluster: return "cluster"
        case .codebuildProject: return "codebuild-project"
        case .codepipelinePipeline: return "codepipeline-pipeline"
        case .codespace: return "codespace"
        case .cognitoUserPool: return "cognito-user-pool"
        case .collection: return "collection"
        case .collectionDocument: return "collection-document"
        case .compartment: return "compartment"
        case .composerEnvironment: return "composer-environment"
        case .computeConfig: return "compute-config"
        case .configStore: return "config-store"
        case .connection: return "connection"
        case .connectivityRule: return "connectivity-rule"
        case .connector: return "connector"
        case .contactPoint: return "contact-point"
        case .container: return "container"
        case .containerRegistry: return "container-registry"
        case .context: return "context"
        case .contextVariable: return "context-variable"
        case .copilotSeat: return "copilot-seat"
        case .costCenter: return "cost-center"
        case .cronMonitor: return "cron-monitor"
        case .customEnrichment: return "custom-enrichment"
        case .customHostname: return "custom-hostname"
        case .customVoice: return "custom-voice"
        case .d1Database: return "d1-database"
        case .dashboard: return "dashboard"
        case .database: return "database"
        case .databaseUser: return "database-user"
        case .databricksApp: return "databricks-app"
        case .databricksCatalog: return "databricks-catalog"
        case .databricksCluster: return "databricks-cluster"
        case .databricksClusterPolicy: return "databricks-cluster-policy"
        case .databricksDashboard: return "databricks-dashboard"
        case .databricksFunction: return "databricks-function"
        case .databricksJob: return "databricks-job"
        case .databricksLakebaseBranch: return "databricks-lakebase-branch"
        case .databricksLakebaseProject: return "databricks-lakebase-project"
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
        case .datasource: return "datasource"
        case .dbSubnetGroup: return "db-subnet-group"
        case .dbUser: return "db-user"
        case .dedicatedInference: return "dedicated-inference"
        case .deployedModel: return "deployed-model"
        case .deployment: return "deployment"
        case .depotActionsRepo: return "depot-actions-repo"
        case .depotBuild: return "depot-build"
        case .depotProject: return "depot-project"
        case .depotRegistryImage: return "depot-registry-image"
        case .depotToken: return "depot-token"
        case .depotTrustPolicy: return "depot-trust-policy"
        case .device: return "device"
        case .dict: return "dict"
        case .dictionary: return "dictionary"
        case .directory: return "directory"
        case .directoryGroup: return "directory-group"
        case .directoryUser: return "directory-user"
        case .disk: return "disk"
        case .distributionCredential: return "distribution-credential"
        case .dnsRecord: return "dns-record"
        case .dnsZone: return "dns-zone"
        case .dockerContainer: return "docker-container"
        case .dockerImage: return "docker-image"
        case .dockerNetwork: return "docker-network"
        case .dockerVolume: return "docker-volume"
        case .documentdbCluster: return "documentdb-cluster"
        case .doksCluster: return "doks-cluster"
        case .domain: return "domain"
        case .domainRecord: return "domain-record"
        case .downtime: return "downtime"
        case .dpoJob: return "dpo-job"
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
        case .elasticacheServerlessCache: return "elasticache-serverless-cache"
        case .emailRoutingRule: return "email-routing-rule"
        case .embedJob: return "embed-job"
        case .encryptionKey: return "encryption-key"
        case .endpoint: return "endpoint"
        case .enrichment: return "enrichment"
        case .environment: return "environment"
        case .eval: return "eval"
        case .evaluation: return "evaluation"
        case .evaluationJob: return "evaluation-job"
        case .evaluator: return "evaluator"
        case .eventbridgeRule: return "eventbridge-rule"
        case .events2metrics: return "events2metrics"
        case .exportSink: return "export-sink"
        case .`extension`: return "extension"
        case .featureFlag: return "feature-flag"
        case .file: return "file"
        case .fileSearchDocument: return "file-search-document"
        case .fileSearchStore: return "file-search-store"
        case .fineTune: return "fine-tune"
        case .fineTuningJob: return "fine-tuning-job"
        case .finetunedModel: return "finetuned-model"
        case .firestoreDatabase: return "firestore-database"
        case .firewall: return "firewall"
        case .firewallRule: return "firewall-rule"
        case .flexCluster: return "flex-cluster"
        case .flexibleIp: return "flexible-ip"
        case .flinkComputePool: return "flink-compute-pool"
        case .floatingIp: return "floating-ip"
        case .folder: return "folder"
        case .forwardingRule: return "forwarding-rule"
        case .function: return "function"
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
        case .gpuCluster: return "gpu-cluster"
        case .groqBatch: return "groq-batch"
        case .groqFile: return "groq-file"
        case .groqFineTuning: return "groq-fine-tuning"
        case .groqModel: return "groq-model"
        case .group: return "group"
        case .guardrail: return "guardrail"
        case .hardware: return "hardware"
        case .healthCheck: return "health-check"
        case .healthcheck: return "healthcheck"
        case .historyItem: return "history-item"
        case .host: return "host"
        case .hostedRunner: return "hosted-runner"
        case .hyperdrive: return "hyperdrive"
        case .iamRole: return "iam-role"
        case .iamUser: return "iam-user"
        case .image: return "image"
        case .inferenceBatch: return "inference-batch"
        case .instance: return "instance"
        case .instanceGroup: return "instance-group"
        case .instanceTemplate: return "instance-template"
        case .instanceType: return "instance-type"
        case .internetGateway: return "internet-gateway"
        case .invitation: return "invitation"
        case .invite: return "invite"
        case .invoice: return "invoice"
        case .ipAccessEntry: return "ip-access-entry"
        case .ipAccessRule: return "ip-access-rule"
        case .ipAllocation: return "ip-allocation"
        case .issue: return "issue"
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
        case .key: return "key"
        case .kinesisStream: return "kinesis-stream"
        case .kmsKey: return "kms-key"
        case .kmsKeyRing: return "kms-key-ring"
        case .knowledgeBaseDocument: return "knowledge-base-document"
        case .knowledgeNote: return "knowledge-note"
        case .ksqldbCluster: return "ksqldb-cluster"
        case .kubernetesCluster: return "kubernetes-cluster"
        case .kvNamespace: return "kv-namespace"
        case .kvStore: return "kv-store"
        case .lambdaFunction: return "lambda-function"
        case .languageIdJob: return "language-id-job"
        case .linode: return "linode"
        case .liveSession: return "live-session"
        case .lkeCluster: return "lke-cluster"
        case .lkeNodePool: return "lke-node-pool"
        case .llmModel: return "llm-model"
        case .loadBalancer: return "load-balancer"
        case .logSink: return "log-sink"
        case .loggingEndpoint: return "logging-endpoint"
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
        case .memorystoreValkey: return "memorystore-valkey"
        case .messageBatch: return "message-batch"
        case .messagingService: return "messaging-service"
        case .mistralAgent: return "mistral-agent"
        case .mistralApiKey: return "mistral-api-key"
        case .mistralBatchJob: return "mistral-batch-job"
        case .mistralFile: return "mistral-file"
        case .mistralFineTuningJob: return "mistral-fine-tuning-job"
        case .mistralLibrary: return "mistral-library"
        case .mistralModel: return "mistral-model"
        case .mistralVoice: return "mistral-voice"
        case .model: return "model"
        case .modelApi: return "model-api"
        case .modelApiKey: return "model-api-key"
        case .modelEndpoint: return "model-endpoint"
        case .modelVersion: return "model-version"
        case .mongodbDatabase: return "mongodb-database"
        case .monitor: return "monitor"
        case .mqBroker: return "mq-broker"
        case .mskCluster: return "msk-cluster"
        case .mssqlDatabase: return "mssql-database"
        case .mysqlDatabase: return "mysql-database"
        case .namespace: return "namespace"
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
        case .netlifyDatabase: return "netlify-database"
        case .netlifyDeploy: return "netlify-deploy"
        case .netlifyDnsRecord: return "netlify-dns-record"
        case .netlifyDnsZone: return "netlify-dns-zone"
        case .netlifyEnvVar: return "netlify-env-var"
        case .netlifyForm: return "netlify-form"
        case .netlifyNotificationHook: return "netlify-notification-hook"
        case .netlifySite: return "netlify-site"
        case .netlifySnippet: return "netlify-snippet"
        case .network: return "network"
        case .networkConnection: return "network-connection"
        case .nexusEndpoint: return "nexus-endpoint"
        case .nfsShare: return "nfs-share"
        case .nodePool: return "node-pool"
        case .nodebalancer: return "nodebalancer"
        case .notificationPolicy: return "notification-policy"
        case .objectStorageBucket: return "object-storage-bucket"
        case .octaviaLoadBalancer: return "octavia-load-balancer"
        case .okeCluster: return "oke-cluster"
        case .onlineArchive: return "online-archive"
        case .opensearchCluster: return "opensearch-cluster"
        case .opensearchDomain: return "opensearch-domain"
        case .organization: return "organization"
        case .organizationApiKey: return "organization-api-key"
        case .organizationDomain: return "organization-domain"
        case .organizationMembership: return "organization-membership"
        case .organizationRole: return "organization-role"
        case .organizationUser: return "organization-user"
        case .outgoingWebhook: return "outgoing-webhook"
        case .pageRule: return "page-rule"
        case .parsingRuleGroup: return "parsing-rule-group"
        case .permission: return "permission"
        case .pgDatabase: return "pg-database"
        case .pgSchema: return "pg-schema"
        case .phoneNumber: return "phone-number"
        case .pipeline: return "pipeline"
        case .placementGroup: return "placement-group"
        case .playbook: return "playbook"
        case .postgresCluster: return "postgres-cluster"
        case .postureIntegration: return "posture-integration"
        case .prediction: return "prediction"
        case .primaryIp: return "primary-ip"
        case .privateEndpointService: return "private-endpoint-service"
        case .privateNetwork: return "private-network"
        case .productEnvironment: return "product-environment"
        case .project: return "project"
        case .projectApiKey: return "project-api-key"
        case .projectRateLimit: return "project-rate-limit"
        case .projectServiceAccount: return "project-service-account"
        case .projectUser: return "project-user"
        case .projectVariable: return "project-variable"
        case .pronunciationDict: return "pronunciation-dict"
        case .pronunciationDictionary: return "pronunciation-dictionary"
        case .provider: return "provider"
        case .psBackup: return "ps-backup"
        case .psBranch: return "ps-branch"
        case .psDatabase: return "ps-database"
        case .psDeployRequest: return "ps-deploy-request"
        case .psPassword: return "ps-password"
        case .psRole: return "ps-role"
        case .psWebhook: return "ps-webhook"
        case .pubsubSubscription: return "pubsub-subscription"
        case .pubsubTopic: return "pubsub-topic"
        case .purchase: return "purchase"
        case .queue: return "queue"
        case .quota: return "quota"
        case .quotaRule: return "quota-rule"
        case .r2Bucket: return "r2-bucket"
        case .rateLimit: return "rate-limit"
        case .rateLimitRule: return "rate-limit-rule"
        case .rcAccount: return "rc-account"
        case .rcAclRole: return "rc-acl-role"
        case .rcAclRule: return "rc-acl-rule"
        case .rcAclUser: return "rc-acl-user"
        case .rcCloudAccount: return "rc-cloud-account"
        case .rcDatabase: return "rc-database"
        case .rcPscEndpoint: return "rc-psc-endpoint"
        case .rcSubscription: return "rc-subscription"
        case .rcTransitGateway: return "rc-transit-gateway"
        case .rcVpcPeering: return "rc-vpc-peering"
        case .rdbInstance: return "rdb-instance"
        case .rdsCluster: return "rds-cluster"
        case .rdsInstance: return "rds-instance"
        case .redirectRule: return "redirect-rule"
        case .redisInstance: return "redis-instance"
        case .redshiftCluster: return "redshift-cluster"
        case .registryNamespace: return "registry-namespace"
        case .reinforcementFineTuningJob: return "reinforcement-fine-tuning-job"
        case .release: return "release"
        case .repoBlocklist: return "repo-blocklist"
        case .reservation: return "reservation"
        case .reservedIp: return "reserved-ip"
        case .role: return "role"
        case .routeTable: return "route-table"
        case .route53HealthCheck: return "route53-health-check"
        case .route53HostedZone: return "route53-hosted-zone"
        case .route53RecordSet: return "route53-record-set"
        case .router: return "router"
        case .runner: return "runner"
        case .runnerResourceClass: return "runner-resource-class"
        case .s3Bucket: return "s3-bucket"
        case .sagemakerEndpoint: return "sagemaker-endpoint"
        case .schedule: return "schedule"
        case .scheduledFunction: return "scheduled-function"
        case .schemaRegistry: return "schema-registry"
        case .searchIndex: return "search-index"
        case .secret: return "secret"
        case .secretManagerSecret: return "secret-manager-secret"
        case .secretStore: return "secret-store"
        case .secretsManagerSecret: return "secrets-manager-secret"
        case .secretsStoreSecret: return "secrets-store-secret"
        case .securityGroup: return "security-group"
        case .securityList: return "security-list"
        case .sentimentJob: return "sentiment-job"
        case .server: return "server"
        case .serverlessContainer: return "serverless-container"
        case .serverlessFunction: return "serverless-function"
        case .serverlessInstance: return "serverless-instance"
        case .serverlessTrafficFilter: return "serverless-traffic-filter"
        case .service: return "service"
        case .serviceAccount: return "service-account"
        case .serviceVersion: return "service-version"
        case .session: return "session"
        case .sharedVolume: return "shared-volume"
        case .skill: return "skill"
        case .slo: return "slo"
        case .snapshot: return "snapshot"
        case .snowflakeAccount: return "snowflake-account"
        case .snowflakeDatabase: return "snowflake-database"
        case .snowflakeDynamicTable: return "snowflake-dynamic-table"
        case .snowflakePipe: return "snowflake-pipe"
        case .snowflakeResourceMonitor: return "snowflake-resource-monitor"
        case .snowflakeRole: return "snowflake-role"
        case .snowflakeSchema: return "snowflake-schema"
        case .snowflakeTask: return "snowflake-task"
        case .snowflakeUser: return "snowflake-user"
        case .snowflakeWarehouse: return "snowflake-warehouse"
        case .snsTopic: return "sns-topic"
        case .spacesBucket: return "spaces-bucket"
        case .spannerBackup: return "spanner-backup"
        case .spannerDatabase: return "spanner-database"
        case .spannerInstance: return "spanner-instance"
        case .spectrumApplication: return "spectrum-application"
        case .spendAlert: return "spend-alert"
        case .spendLimit: return "spend-limit"
        case .spendingLimit: return "spending-limit"
        case .sqsQueue: return "sqs-queue"
        case .sshKey: return "ssh-key"
        case .sshTarget: return "ssh-target"
        case .sslCertificate: return "ssl-certificate"
        case .ssmParameter: return "ssm-parameter"
        case .stack: return "stack"
        case .stackPlugin: return "stack-plugin"
        case .stackscript: return "stackscript"
        case .staticIp: return "static-ip"
        case .stepFunction: return "step-function"
        case .storageBox: return "storage-box"
        case .subaccount: return "subaccount"
        case .subnet: return "subnet"
        case .supervisedFineTuningJob: return "supervised-fine-tuning-job"
        case .syntheticCheck: return "synthetic-check"
        case .syntheticMonitor: return "synthetic-monitor"
        case .syntheticsTest: return "synthetics-test"
        case .tailnet: return "tailnet"
        case .targetGroup: return "target-group"
        case .tcoPolicy: return "tco-policy"
        case .team: return "team"
        case .teamMember: return "team-member"
        case .tenancy: return "tenancy"
        case .tlsCertificate: return "tls-certificate"
        case .tlsSubscription: return "tls-subscription"
        case .topicJob: return "topic-job"
        case .trafficFilter: return "traffic-filter"
        case .training: return "training"
        case .trainingJob: return "training-job"
        case .trainingProject: return "training-project"
        case .transcript: return "transcript"
        case .transcription: return "transcription"
        case .transformation: return "transformation"
        case .trigger: return "trigger"
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
        case .twimlApp: return "twiml-app"
        case .uploadMapping: return "upload-mapping"
        case .uploadPreset: return "upload-preset"
        case .uptimeCheck: return "uptime-check"
        case .uptimeMonitor: return "uptime-monitor"
        case .usageTrigger: return "usage-trigger"
        case .user: return "user"
        case .userInvite: return "user-invite"
        case .utApp: return "ut-app"
        case .utFile: return "ut-file"
        case .vcn: return "vcn"
        case .vectorStore: return "vector-store"
        case .vectorizeIndex: return "vectorize-index"
        case .vercelDeployment: return "vercel-deployment"
        case .vercelDnsRecord: return "vercel-dns-record"
        case .vercelDomain: return "vercel-domain"
        case .vercelEnvVar: return "vercel-env-var"
        case .vercelProject: return "vercel-project"
        case .vercelTeam: return "vercel-team"
        case .vercelWebhook: return "vercel-webhook"
        case .verifyService: return "verify-service"
        case .vertexAiEndpoint: return "vertex-ai-endpoint"
        case .vertexGeminiModel: return "vertex-gemini-model"
        case .vm: return "vm"
        case .vocabulary: return "vocabulary"
        case .voice: return "voice"
        case .voiceAgent: return "voice-agent"
        case .volume: return "volume"
        case .volumeSnapshot: return "volume-snapshot"
        case .vpc: return "vpc"
        case .vpcNatGateway: return "vpc-nat-gateway"
        case .vpcNetwork: return "vpc-network"
        case .vpcPeering: return "vpc-peering"
        case .vpcSubnet: return "vpc-subnet"
        case .wafWebAcl: return "waf-web-acl"
        case .waitingRoom: return "waiting-room"
        case .webhook: return "webhook"
        case .webhookEndpoint: return "webhook-endpoint"
        case .webhookSubscription: return "webhook-subscription"
        case .worker: return "worker"
        case .workerRoute: return "worker-route"
        case .workersAiModel: return "workers-ai-model"
        case .workflow: return "workflow"
        case .workload: return "workload"
        case .workspace: return "workspace"
        case .workspaceMember: return "workspace-member"
        case .zone: return "zone"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [ResourceTypeId] = [
        .accessApplication,
        .accessKey,
        .accessPolicy,
        .accessPolicyToken,
        .account,
        .acmCertificate,
        .actionsCache,
        .adminApiKey,
        .agent,
        .agentApiKey,
        .agentConfig,
        .agentSession,
        .agentVariable,
        .aiGateway,
        .aiSearch,
        .alb,
        .alert,
        .alertCondition,
        .alertConfiguration,
        .alertPolicy,
        .alertRule,
        .alignmentJob,
        .alloydbCluster,
        .alloydbInstance,
        .analyticsEngineDataset,
        .apiGateway,
        .apiKey,
        .apiToken,
        .apmApplication,
        .app,
        .appEngineService,
        .appSecret,
        .applicationKey,
        .apprunnerService,
        .artifactRegistryRepo,
        .auditEvent,
        .autoScalingGroup,
        .automation,
        .autonomousDatabase,
        .autoscalePool,
        .azureAiServices,
        .azureAksCluster,
        .azureAppGateway,
        .azureAppRegistration,
        .azureAppService,
        .azureAppServicePlan,
        .azureContainerApp,
        .azureContainerAppEnvironment,
        .azureContainerAppJob,
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
        .azureManagedRedis,
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
        .backend,
        .backendService,
        .backupPolicy,
        .backupSnapshot,
        .backupVault,
        .balance,
        .basinCatalog,
        .basinPipeline,
        .basinSink,
        .basinStream,
        .basinTable,
        .batch,
        .batchInferenceJob,
        .batchJobQueue,
        .bedrockModel,
        .bigqueryDataset,
        .bigqueryTable,
        .bigtableInstance,
        .billingAccount,
        .billingGroup,
        .blockVolume,
        .bootVolume,
        .browserApplication,
        .bucket,
        .budget,
        .budgetAlertRule,
        .byokCredential,
        .cacheRule,
        .cachedContent,
        .cdnEndpoint,
        .certificate,
        .chApiKey,
        .chBackup,
        .chClickpipe,
        .chDatabase,
        .chMember,
        .chPostgres,
        .chService,
        .chain,
        .cksCluster,
        .clientKey,
        .cloud,
        .cloudArmorPolicy,
        .cloudBuildTrigger,
        .cloudDeployPipeline,
        .cloudDnsRecordSet,
        .cloudDnsZone,
        .cloudFunction,
        .cloudNat,
        .cloudRouter,
        .cloudRunJob,
        .cloudRunService,
        .cloudSchedulerJob,
        .cloudTasksQueue,
        .cloudformationStack,
        .cloudfrontDistribution,
        .cloudsqlInstance,
        .cloudtrailTrail,
        .cloudwatchAlarm,
        .cloudwatchLogGroup,
        .cluster,
        .codebuildProject,
        .codepipelinePipeline,
        .codespace,
        .cognitoUserPool,
        .collection,
        .collectionDocument,
        .compartment,
        .composerEnvironment,
        .computeConfig,
        .configStore,
        .connection,
        .connectivityRule,
        .connector,
        .contactPoint,
        .container,
        .containerRegistry,
        .context,
        .contextVariable,
        .copilotSeat,
        .costCenter,
        .cronMonitor,
        .customEnrichment,
        .customHostname,
        .customVoice,
        .d1Database,
        .dashboard,
        .database,
        .databaseUser,
        .databricksApp,
        .databricksCatalog,
        .databricksCluster,
        .databricksClusterPolicy,
        .databricksDashboard,
        .databricksFunction,
        .databricksJob,
        .databricksLakebaseBranch,
        .databricksLakebaseProject,
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
        .datasource,
        .dbSubnetGroup,
        .dbUser,
        .dedicatedInference,
        .deployedModel,
        .deployment,
        .depotActionsRepo,
        .depotBuild,
        .depotProject,
        .depotRegistryImage,
        .depotToken,
        .depotTrustPolicy,
        .device,
        .dict,
        .dictionary,
        .directory,
        .directoryGroup,
        .directoryUser,
        .disk,
        .distributionCredential,
        .dnsRecord,
        .dnsZone,
        .dockerContainer,
        .dockerImage,
        .dockerNetwork,
        .dockerVolume,
        .documentdbCluster,
        .doksCluster,
        .domain,
        .domainRecord,
        .downtime,
        .dpoJob,
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
        .elasticacheServerlessCache,
        .emailRoutingRule,
        .embedJob,
        .encryptionKey,
        .endpoint,
        .enrichment,
        .environment,
        .eval,
        .evaluation,
        .evaluationJob,
        .evaluator,
        .eventbridgeRule,
        .events2metrics,
        .exportSink,
        .`extension`,
        .featureFlag,
        .file,
        .fileSearchDocument,
        .fileSearchStore,
        .fineTune,
        .fineTuningJob,
        .finetunedModel,
        .firestoreDatabase,
        .firewall,
        .firewallRule,
        .flexCluster,
        .flexibleIp,
        .flinkComputePool,
        .floatingIp,
        .folder,
        .forwardingRule,
        .function,
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
        .gpuCluster,
        .groqBatch,
        .groqFile,
        .groqFineTuning,
        .groqModel,
        .group,
        .guardrail,
        .hardware,
        .healthCheck,
        .healthcheck,
        .historyItem,
        .host,
        .hostedRunner,
        .hyperdrive,
        .iamRole,
        .iamUser,
        .image,
        .inferenceBatch,
        .instance,
        .instanceGroup,
        .instanceTemplate,
        .instanceType,
        .internetGateway,
        .invitation,
        .invite,
        .invoice,
        .ipAccessEntry,
        .ipAccessRule,
        .ipAllocation,
        .issue,
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
        .key,
        .kinesisStream,
        .kmsKey,
        .kmsKeyRing,
        .knowledgeBaseDocument,
        .knowledgeNote,
        .ksqldbCluster,
        .kubernetesCluster,
        .kvNamespace,
        .kvStore,
        .lambdaFunction,
        .languageIdJob,
        .linode,
        .liveSession,
        .lkeCluster,
        .lkeNodePool,
        .llmModel,
        .loadBalancer,
        .logSink,
        .loggingEndpoint,
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
        .memorystoreValkey,
        .messageBatch,
        .messagingService,
        .mistralAgent,
        .mistralApiKey,
        .mistralBatchJob,
        .mistralFile,
        .mistralFineTuningJob,
        .mistralLibrary,
        .mistralModel,
        .mistralVoice,
        .model,
        .modelApi,
        .modelApiKey,
        .modelEndpoint,
        .modelVersion,
        .mongodbDatabase,
        .monitor,
        .mqBroker,
        .mskCluster,
        .mssqlDatabase,
        .mysqlDatabase,
        .namespace,
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
        .netlifyDatabase,
        .netlifyDeploy,
        .netlifyDnsRecord,
        .netlifyDnsZone,
        .netlifyEnvVar,
        .netlifyForm,
        .netlifyNotificationHook,
        .netlifySite,
        .netlifySnippet,
        .network,
        .networkConnection,
        .nexusEndpoint,
        .nfsShare,
        .nodePool,
        .nodebalancer,
        .notificationPolicy,
        .objectStorageBucket,
        .octaviaLoadBalancer,
        .okeCluster,
        .onlineArchive,
        .opensearchCluster,
        .opensearchDomain,
        .organization,
        .organizationApiKey,
        .organizationDomain,
        .organizationMembership,
        .organizationRole,
        .organizationUser,
        .outgoingWebhook,
        .pageRule,
        .parsingRuleGroup,
        .permission,
        .pgDatabase,
        .pgSchema,
        .phoneNumber,
        .pipeline,
        .placementGroup,
        .playbook,
        .postgresCluster,
        .postureIntegration,
        .prediction,
        .primaryIp,
        .privateEndpointService,
        .privateNetwork,
        .productEnvironment,
        .project,
        .projectApiKey,
        .projectRateLimit,
        .projectServiceAccount,
        .projectUser,
        .projectVariable,
        .pronunciationDict,
        .pronunciationDictionary,
        .provider,
        .psBackup,
        .psBranch,
        .psDatabase,
        .psDeployRequest,
        .psPassword,
        .psRole,
        .psWebhook,
        .pubsubSubscription,
        .pubsubTopic,
        .purchase,
        .queue,
        .quota,
        .quotaRule,
        .r2Bucket,
        .rateLimit,
        .rateLimitRule,
        .rcAccount,
        .rcAclRole,
        .rcAclRule,
        .rcAclUser,
        .rcCloudAccount,
        .rcDatabase,
        .rcPscEndpoint,
        .rcSubscription,
        .rcTransitGateway,
        .rcVpcPeering,
        .rdbInstance,
        .rdsCluster,
        .rdsInstance,
        .redirectRule,
        .redisInstance,
        .redshiftCluster,
        .registryNamespace,
        .reinforcementFineTuningJob,
        .release,
        .repoBlocklist,
        .reservation,
        .reservedIp,
        .role,
        .routeTable,
        .route53HealthCheck,
        .route53HostedZone,
        .route53RecordSet,
        .router,
        .runner,
        .runnerResourceClass,
        .s3Bucket,
        .sagemakerEndpoint,
        .schedule,
        .scheduledFunction,
        .schemaRegistry,
        .searchIndex,
        .secret,
        .secretManagerSecret,
        .secretStore,
        .secretsManagerSecret,
        .secretsStoreSecret,
        .securityGroup,
        .securityList,
        .sentimentJob,
        .server,
        .serverlessContainer,
        .serverlessFunction,
        .serverlessInstance,
        .serverlessTrafficFilter,
        .service,
        .serviceAccount,
        .serviceVersion,
        .session,
        .sharedVolume,
        .skill,
        .slo,
        .snapshot,
        .snowflakeAccount,
        .snowflakeDatabase,
        .snowflakeDynamicTable,
        .snowflakePipe,
        .snowflakeResourceMonitor,
        .snowflakeRole,
        .snowflakeSchema,
        .snowflakeTask,
        .snowflakeUser,
        .snowflakeWarehouse,
        .snsTopic,
        .spacesBucket,
        .spannerBackup,
        .spannerDatabase,
        .spannerInstance,
        .spectrumApplication,
        .spendAlert,
        .spendLimit,
        .spendingLimit,
        .sqsQueue,
        .sshKey,
        .sshTarget,
        .sslCertificate,
        .ssmParameter,
        .stack,
        .stackPlugin,
        .stackscript,
        .staticIp,
        .stepFunction,
        .storageBox,
        .subaccount,
        .subnet,
        .supervisedFineTuningJob,
        .syntheticCheck,
        .syntheticMonitor,
        .syntheticsTest,
        .tailnet,
        .targetGroup,
        .tcoPolicy,
        .team,
        .teamMember,
        .tenancy,
        .tlsCertificate,
        .tlsSubscription,
        .topicJob,
        .trafficFilter,
        .training,
        .trainingJob,
        .trainingProject,
        .transcript,
        .transcription,
        .transformation,
        .trigger,
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
        .twimlApp,
        .uploadMapping,
        .uploadPreset,
        .uptimeCheck,
        .uptimeMonitor,
        .usageTrigger,
        .user,
        .userInvite,
        .utApp,
        .utFile,
        .vcn,
        .vectorStore,
        .vectorizeIndex,
        .vercelDeployment,
        .vercelDnsRecord,
        .vercelDomain,
        .vercelEnvVar,
        .vercelProject,
        .vercelTeam,
        .vercelWebhook,
        .verifyService,
        .vertexAiEndpoint,
        .vertexGeminiModel,
        .vm,
        .vocabulary,
        .voice,
        .voiceAgent,
        .volume,
        .volumeSnapshot,
        .vpc,
        .vpcNatGateway,
        .vpcNetwork,
        .vpcPeering,
        .vpcSubnet,
        .wafWebAcl,
        .waitingRoom,
        .webhook,
        .webhookEndpoint,
        .webhookSubscription,
        .worker,
        .workerRoute,
        .workersAiModel,
        .workflow,
        .workload,
        .workspace,
        .workspaceMember,
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
