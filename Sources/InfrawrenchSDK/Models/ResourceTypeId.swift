/*
 * InfrawrenchSDK v1.79.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.79.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Resource type id. Note: not every plugin exposes every type; see the plugin's
/// `resourceTypes` for the valid (pluginId, typeId) pairs.
public enum ResourceTypeId: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case abTest
    case accessApplication
    case accessKey
    case accessPolicy
    case accessPolicyToken
    case accessToken
    case account
    case ackCluster
    case ackNodePool
    case acmCertificate
    case action
    case actionsCache
    case addOn
    case adminApiKey
    case agent
    case agentApiKey
    case agentConfig
    case agentPool
    case agentSession
    case agentToken
    case agentVariable
    case aiGateway
    case aiSearch
    case aivenBillingGroup
    case aivenConnectionPool
    case aivenDatabase
    case aivenIntegration
    case aivenKafkaAcl
    case aivenKafkaConnector
    case aivenKafkaTopic
    case aivenProject
    case aivenSchemaSubject
    case aivenService
    case aivenServiceUser
    case aivenVpc
    case aivenVpcPeering
    case alb
    case alert
    case alertChannel
    case alertCondition
    case alertConfiguration
    case alertPolicy
    case alertRule
    case alertingProfile
    case alias
    case alignmentJob
    case allowlistIdentifier
    case alloydbCluster
    case alloydbInstance
    case analyticsEngineDataset
    case annotation
    case antiAffinityGroup
    case api
    case apiGateway
    case apiKey
    case apiToken
    case apmApplication
    case app
    case appEngineService
    case appSecret
    case application
    case applicationKey
    case apprunnerService
    case artifactRegistryRepo
    case assistant
    case astraAccessEntry
    case astraCdc
    case astraCollection
    case astraDatabase
    case astraKeyspace
    case astraPcuGroup
    case astraPrivateEndpoint
    case astraRegion
    case astraRole
    case astraSnapshot
    case astraStreamingTenant
    case astraToken
    case astraUser
    case auditEvent
    case authorizationServer
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
    case backup
    case backupPolicy
    case backupRestore
    case backupSchedule
    case backupSnapshot
    case backupVault
    case balance
    case bareMetal
    case basinCatalog
    case basinPipeline
    case basinSink
    case basinStream
    case basinTable
    case batch
    case batchExport
    case batchInferenceJob
    case batchJobQueue
    case bedrockModel
    case bigqueryDataset
    case bigqueryTable
    case bigtableInstance
    case billableMetric
    case billingAccount
    case billingGroup
    case blockStorage
    case blockStorageSnapshot
    case blockVolume
    case blocklistIdentifier
    case blueprint
    case board
    case boardView
    case bootVolume
    case branchRestriction
    case browserApplication
    case bucket
    case budget
    case budgetAlertRule
    case build
    case burnAlert
    case byokCredential
    case cacheRule
    case cachedContent
    case capellaAllowedCidr
    case capellaApiKey
    case capellaAppService
    case capellaBackup
    case capellaBucket
    case capellaCluster
    case capellaCollection
    case capellaDbCredential
    case capellaNetworkPeer
    case capellaPrivateEndpoint
    case capellaProject
    case capellaReplication
    case capellaScope
    case capellaUser
    case cdnEndpoint
    case cerebrasBatch
    case cerebrasEndpoint
    case cerebrasFile
    case cerebrasModel
    case cerebrasModelVersion
    case certificate
    case certificateAuthority
    case chApiKey
    case chBackup
    case chClickpipe
    case chDatabase
    case chMember
    case chPostgres
    case chService
    case chain
    case chart
    case check
    case checkGroup
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
    case clusterSecret
    case codeEngineApp
    case codeEngineProject
    case codebuildProject
    case codepipelinePipeline
    case codespace
    case cognitoUserPool
    case cohort
    case collection
    case collectionDocument
    case column
    case compartment
    case composerEnvironment
    case computeConfig
    case configStore
    case configVar
    case connection
    case connectivityRule
    case connector
    case consulAclPolicy
    case consulAclRole
    case consulAclToken
    case consulCheck
    case consulCluster
    case consulConfigEntry
    case consulIntention
    case consulNamespace
    case consulNode
    case consulPartition
    case consulPeering
    case consulService
    case consulSession
    case contactPoint
    case container
    case containerApp
    case containerRegistry
    case containerRegistryAuth
    case containerRepository
    case context
    case contextVariable
    case convexAccessToken
    case convexCustomDomain
    case convexCustomRole
    case convexDefaultEnvVar
    case convexDeployKey
    case convexDeployment
    case convexEnvVar
    case convexInvite
    case convexLogStream
    case convexMember
    case convexPreviewDeployKey
    case convexProject
    case convexTeam
    case convexUsageLimit
    case copilotSeat
    case corsRule
    case cosBucket
    case costCenter
    case crawler
    case crdbAllowlistEntry
    case crdbApiKey
    case crdbBackup
    case crdbBlackoutWindow
    case crdbCluster
    case crdbDatabase
    case crdbEgressRule
    case crdbFolder
    case crdbLogExport
    case crdbMetricExport
    case crdbOrganization
    case crdbRestore
    case crdbServiceAccount
    case crdbSqlUser
    case cronMonitor
    case customDomain
    case customEnrichment
    case customHostname
    case customTemplate
    case customVoice
    case customer
    case d1Database
    case dashboard
    case dashboardGroup
    case database
    case databaseApiKey
    case databaseBackup
    case databaseDb
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
    case dbaas
    case dbaasDatabase
    case dbaasUser
    case dedicatedInference
    case deploy
    case deployKey
    case deployToken
    case deployedModel
    case deployment
    case deploymentVariable
    case depotActionsRepo
    case depotBuild
    case depotProject
    case depotRegistryImage
    case depotToken
    case depotTrustPolicy
    case derivedColumn
    case detector
    case device
    case dict
    case dictionary
    case directory
    case directoryGroup
    case directoryUser
    case disk
    case distributionCredential
    case dnsDomain
    case dnsRecord
    case dnsZone
    case dockerContainer
    case dockerImage
    case dockerNetwork
    case dockerVolume
    case dockerhubAccessToken
    case dockerhubInvite
    case dockerhubMember
    case dockerhubNamespace
    case dockerhubOrgAccessToken
    case dockerhubRepository
    case dockerhubTag
    case dockerhubTeam
    case documentdbCluster
    case doksCluster
    case domain
    case domainRecord
    case dopplerConfig
    case dopplerEnvironment
    case dopplerGroup
    case dopplerIntegration
    case dopplerProject
    case dopplerSecret
    case dopplerServiceAccount
    case dopplerServiceAccountToken
    case dopplerServiceToken
    case dopplerSync
    case dopplerUser
    case dopplerWebhook
    case dopplerWorkplace
    case downtime
    case dpoJob
    case dropRule
    case droplet
    case durableObjectNamespace
    case dynamicSecret
    case dynamodbTable
    case dyno
    case ebsVolume
    case ec2Instance
    case ecrRepository
    case ecsInstance
    case ecsService
    case edgeRule
    case edgeScript
    case efsFileSystem
    case eip
    case eksCluster
    case elasticIp
    case elasticacheCluster
    case elasticacheServerlessCache
    case emailRoutingRule
    case embedJob
    case encryptionKey
    case endpoint
    case enrichment
    case enterpriseConnection
    case envGroup
    case envGroupVar
    case envVar
    case environment
    case escalationPolicy
    case eval
    case evaluation
    case evaluationJob
    case evaluator
    case eventHook
    case eventbridgeRule
    case events2metrics
    case experiment
    case exportSink
    case `extension`
    case falApiKey
    case falApp
    case falComputeInstance
    case falModel
    case falWorkflow
    case fcFunction
    case featureFlag
    case field
    case file
    case fileSearchDocument
    case fileSearchStore
    case filesystem
    case fineTune
    case fineTuningJob
    case finetunedModel
    case firestoreDatabase
    case firewall
    case firewallGroup
    case firewallRule
    case firewallRuleset
    case flexCluster
    case flexibleIp
    case flinkComputePool
    case floatingIp
    case folder
    case formation
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
    case globalFirewall
    case glueDatabase
    case gpuCluster
    case groqBatch
    case groqFile
    case groqFineTuning
    case groqModel
    case group
    case groupDeployToken
    case groupMember
    case groupVariable
    case groupWebhook
    case guardrail
    case hardware
    case healthCheck
    case healthcheck
    case heartbeat
    case heartbeatGroup
    case hfDataset
    case hfInferenceEndpoint
    case hfJob
    case hfMemberToken
    case hfModel
    case hfProviderModel
    case hfScheduledJob
    case hfServiceAccount
    case hfSpace
    case hfWebhook
    case historyItem
    case hogFunction
    case host
    case hostedRunner
    case hostname
    case hybridEnvironment
    case hyperdrive
    case iamRole
    case iamUser
    case image
    case incident
    case incidentIoAlertRoute
    case incidentIoAlertSource
    case incidentIoCatalogType
    case incidentIoEscalation
    case incidentIoEscalationPath
    case incidentIoIncident
    case incidentIoMaintenanceWindow
    case incidentIoSchedule
    case incidentIoSeverity
    case incidentIoStatus
    case incidentIoStatusPage
    case incidentIoTeam
    case incidentIoUser
    case incidentIoWorkflow
    case index
    case inferenceBatch
    case influxBucket
    case influxCheck
    case influxDashboard
    case influxDedicatedDatabase
    case influxDedicatedToken
    case influxNotificationEndpoint
    case influxNotificationRule
    case influxOrg
    case influxTask
    case influxTelegraf
    case influxToken
    case insight
    case instance
    case instanceGroup
    case instancePool
    case instanceSnapshot
    case instanceTemplate
    case instanceType
    case integration
    case internetGateway
    case invitation
    case invite
    case invoice
    case ipAccessEntry
    case ipAccessRule
    case ipAllocation
    case issue
    case jfrogAccessToken
    case jfrogBuild
    case jfrogBuildRun
    case jfrogGroup
    case jfrogPermission
    case jfrogPlatform
    case jfrogRepository
    case jfrogUser
    case jfrogXrayPolicy
    case jfrogXrayViolation
    case jfrogXrayWatch
    case job
    case jwtTemplate
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
    case keyValue
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
    case lifecycleRule
    case linode
    case liveSession
    case lkeCluster
    case lkeNodePool
    case llmModel
    case loadBalancer
    case logDrain
    case logSink
    case logStream
    case loggingEndpoint
    case logpushJob
    case machine
    case machineIdentity
    case mailgunAccount
    case mailgunAccountWebhook
    case mailgunApiKey
    case mailgunDnsRecord
    case mailgunDomain
    case mailgunIp
    case mailgunIpPool
    case mailgunMailingList
    case mailgunRoute
    case mailgunSmtpCredential
    case mailgunSubaccount
    case mailgunTag
    case mailgunWebhook
    case maintenance
    case maintenanceWindow
    case managedDatabase
    case managedDb
    case managedEndpoint
    case managedKube
    case marker
    case markerSetting
    case mediaAsset
    case member
    case memcachedInstance
    case memorystoreMemcached
    case memorystoreRedis
    case memorystoreValkey
    case messageBatch
    case messagingService
    case minioServer
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
    case module
    case mongodbDatabase
    case monitor
    case monitorGroup
    case mqBroker
    case mskCluster
    case mssqlDatabase
    case mutingRule
    case mysqlDatabase
    case namespace
    case natGateway
    case natsAccount
    case natsConnection
    case natsConsumer
    case natsKvBucket
    case natsObjectStore
    case natsPeer
    case natsServer
    case natsStream
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
    case networkVolume
    case networkZone
    case nexusEndpoint
    case nfAccount
    case nfAddon
    case nfCluster
    case nfDomain
    case nfJob
    case nfPipeline
    case nfProject
    case nfSecretGroup
    case nfService
    case nfSubdomain
    case nfVolume
    case nfsShare
    case nlb
    case nodeGroup
    case nodePool
    case nodebalancer
    case nomadAclPolicy
    case nomadAclToken
    case nomadAllocation
    case nomadCluster
    case nomadCsiPlugin
    case nomadDeployment
    case nomadJob
    case nomadNamespace
    case nomadNode
    case nomadNodePool
    case nomadService
    case nomadVariable
    case nomadVolume
    case notificationPolicy
    case notificationRule
    case notifier
    case oauthApplication
    case objectStorage
    case objectStorageBucket
    case objectStorageUser
    case objectStore
    case objectStoreCredential
    case octaviaLoadBalancer
    case okeCluster
    case onCallCalendar
    case onlineArchive
    case opensearchCluster
    case opensearchDomain
    case org
    case orgToken
    case organization
    case organizationApiKey
    case organizationDomain
    case organizationMembership
    case organizationRole
    case organizationUser
    case osContainer
    case osDnsRecordset
    case osDnsZone
    case osFlavor
    case osFloatingIp
    case osImage
    case osKeypair
    case osLbListener
    case osLbPool
    case osLoadbalancer
    case osNetwork
    case osRouter
    case osSecurityGroup
    case osSecurityGroupRule
    case osServer
    case osStack
    case osSubnet
    case osVolume
    case osVolumeBackup
    case osVolumeSnapshot
    case ossBucket
    case outgoingWebhook
    case package
    case pageRule
    case pagerdutyBusinessService
    case pagerdutyEscalationPolicy
    case pagerdutyEventOrchestration
    case pagerdutyIncident
    case pagerdutyMaintenanceWindow
    case pagerdutySchedule
    case pagerdutyService
    case pagerdutyTeam
    case pagerdutyUser
    case parsingRuleGroup
    case permission
    case perplexityAgentModel
    case perplexityAsyncRequest
    case perplexityRouterModel
    case perplexitySkill
    case perplexitySonarModel
    case pgDatabase
    case pgSchema
    case phoneNumber
    case pipeline
    case pipelineCache
    case pipelineCoupling
    case pipelineSchedule
    case pipelineTemplate
    case placementGroup
    case playbook
    case pod
    case policy
    case policyGroup
    case policyPack
    case policySet
    case postgres
    case postgresCluster
    case postmarkDnsRecord
    case postmarkDomain
    case postmarkInboundRule
    case postmarkMessageStream
    case postmarkSenderSignature
    case postmarkServer
    case postmarkTemplate
    case postmarkWebhook
    case postureIntegration
    case prediction
    case primaryIp
    case privateEndpointService
    case privateLocation
    case privateNetwork
    case problem
    case processGroup
    case productEnvironment
    case project
    case projectApiKey
    case projectDeployKey
    case projectMember
    case projectRateLimit
    case projectServiceAccount
    case projectUser
    case projectVariable
    case projectWebhook
    case prometheusAlert
    case prometheusAlertmanager
    case prometheusAmAlert
    case prometheusReceiver
    case prometheusRule
    case prometheusRuleGroup
    case prometheusScrapePool
    case prometheusServer
    case prometheusSilence
    case prometheusTarget
    case pronunciationDict
    case pronunciationDictionary
    case protectedBranch
    case provider
    case psBackup
    case psBranch
    case psDatabase
    case psDeployRequest
    case psPassword
    case psRole
    case psWebhook
    case publicIp
    case pubsubSubscription
    case pubsubTopic
    case pullZone
    case purchase
    case pveBackup
    case pveBackupJob
    case pveCluster
    case pveCt
    case pveFirewallAlias
    case pveFirewallRule
    case pveHaResource
    case pveHaRule
    case pveIpset
    case pveNode
    case pvePool
    case pveSecurityGroup
    case pveStorage
    case pveVm
    case queue
    case quota
    case quotaRule
    case r2Bucket
    case rabbitmqBinding
    case rabbitmqChannel
    case rabbitmqCluster
    case rabbitmqConnection
    case rabbitmqExchange
    case rabbitmqFederationUpstream
    case rabbitmqNode
    case rabbitmqOperatorPolicy
    case rabbitmqPermission
    case rabbitmqPolicy
    case rabbitmqQueue
    case rabbitmqShovel
    case rabbitmqTopicPermission
    case rabbitmqUser
    case rabbitmqVhost
    case ramUser
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
    case recipient
    case recordingRule
    case redirectRule
    case redirectUrl
    case redisInstance
    case redshiftCluster
    case registryModule
    case registryNamespace
    case registryProvider
    case reinforcementFineTuningJob
    case release
    case replicationRule
    case repoBlocklist
    case repository
    case repositoryVariable
    case repositoryWebhook
    case resendAccount
    case resendApiKey
    case resendAutomation
    case resendBroadcast
    case resendContact
    case resendContactProperty
    case resendDnsRecord
    case resendDomain
    case resendEmail
    case resendOauthGrant
    case resendSegment
    case resendSuppression
    case resendTemplate
    case resendTopic
    case resendWebhook
    case reservation
    case reservedIp
    case resourceGroup
    case restoreJob
    case reviewApp
    case role
    case rollupRule
    case routeTable
    case route53HealthCheck
    case route53HostedZone
    case route53RecordSet
    case router
    case run
    case runTask
    case runner
    case runnerResourceClass
    case s3Bucket
    case sagemakerEndpoint
    case sambanovaModel
    case savedQuery
    case schedule
    case scheduledFunction
    case schemaRegistry
    case searchIndex
    case secret
    case secretManagerSecret
    case secretStore
    case secretSync
    case secretsManagerSecret
    case secretsStoreSecret
    case securityGroup
    case securityList
    case sendgridAccount
    case sendgridAlert
    case sendgridApiKey
    case sendgridDnsRecord
    case sendgridDomain
    case sendgridEventWebhook
    case sendgridInboundParse
    case sendgridIp
    case sendgridIpPool
    case sendgridLinkBranding
    case sendgridReverseDns
    case sendgridSubuser
    case sendgridTemplate
    case sendgridUnsubscribeGroup
    case sendgridVerifiedSender
    case sentimentJob
    case server
    case serverlessContainer
    case serverlessEndpoint
    case serverlessFunction
    case serverlessInstance
    case serverlessTrafficFilter
    case service
    case serviceAccount
    case serviceInstance
    case serviceVersion
    case session
    case sharedDrive
    case sharedVariable
    case sharedVolume
    case signal
    case skill
    case sksCluster
    case sksNodepool
    case slb
    case slo
    case snapshot
    case sniEndpoint
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
    case source
    case sourceGroup
    case space
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
    case stackOutput
    case stackPlugin
    case stackscript
    case starredQuery
    case startupScript
    case stateOutput
    case staticIp
    case statusPage
    case statusPageResource
    case statusPageSection
    case statusReport
    case stepFunction
    case storage
    case storageBox
    case storageZone
    case stripeAccount
    case stripeConnectedAccount
    case stripeEventDestination
    case stripeMeter
    case stripePayout
    case stripePrice
    case stripeProduct
    case stripeReportRun
    case stripeSigmaQueryRun
    case stripeWebhookEndpoint
    case subAccount
    case subaccount
    case subnet
    case supabaseApiKey
    case supabaseAuth
    case supabaseBackup
    case supabaseBranch
    case supabaseBucket
    case supabaseFunction
    case supabaseOrganization
    case supabaseProject
    case supabaseReadReplica
    case supabaseSecret
    case supabaseSigningKey
    case supabaseSsoProvider
    case supabaseThirdPartyAuth
    case supervisedFineTuningJob
    case syntheticCheck
    case syntheticMonitor
    case syntheticTest
    case syntheticsTest
    case tailnet
    case targetGroup
    case tcoPolicy
    case tcpProxy
    case team
    case teamMember
    case telemetryAlert
    case template
    case tenancy
    case tenant
    case test
    case testSuite
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
    case trustedOrigin
    case tsAllowList
    case tsBackup
    case tsExporter
    case tsProject
    case tsReadReplica
    case tsService
    case tsVpc
    case tsVpcPeering
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
    case upstashAccount
    case upstashQstash
    case upstashQstashQueue
    case upstashQstashSchedule
    case upstashQstashUrlGroup
    case upstashRedis
    case upstashSearch
    case upstashTeam
    case upstashVector
    case uptimeCheck
    case uptimeMonitor
    case usageTrigger
    case user
    case userInvite
    case utApp
    case utFile
    case variable
    case variableSet
    case varsetVariable
    case vaultAuditDevice
    case vaultAuthMethod
    case vaultCluster
    case vaultKvSecret
    case vaultLease
    case vaultMount
    case vaultPkiCert
    case vaultPkiRole
    case vaultPolicy
    case vaultToken
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
    case videoLibrary
    case view
    case virtualField
    case vm
    case vocabulary
    case voice
    case voiceAgent
    case volume
    case volumeSnapshot
    case voyageBatch
    case voyageFile
    case voyageModel
    case vpc
    case vpcNatGateway
    case vpcNetwork
    case vpcPeering
    case vpcSubnet
    case vsphereCluster
    case vsphereContentLibrary
    case vsphereCustomizationSpec
    case vsphereDatacenter
    case vsphereDatastore
    case vsphereFolder
    case vsphereHost
    case vsphereLibraryItem
    case vsphereNetwork
    case vsphereResourcePool
    case vsphereTag
    case vsphereTagCategory
    case vsphereVcenter
    case vsphereVm
    case vswitch
    case wafWebAcl
    case waitingRoom
    case webhook
    case webhookEndpoint
    case webhookSubscription
    case worker
    case workerPool
    case workerRoute
    case workergroup
    case workersAiModel
    case workflow
    case workload
    case workspace
    case workspaceMember
    case workspaceVariable
    case workspaceWebhook
    case xataApiKey
    case xataBackup
    case xataBranch
    case xataInvitation
    case xataMember
    case xataOrganization
    case xataProject
    case zone
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "ab-test": self = .abTest
        case "access-application": self = .accessApplication
        case "access-key": self = .accessKey
        case "access-policy": self = .accessPolicy
        case "access-policy-token": self = .accessPolicyToken
        case "access-token": self = .accessToken
        case "account": self = .account
        case "ack-cluster": self = .ackCluster
        case "ack-node-pool": self = .ackNodePool
        case "acm-certificate": self = .acmCertificate
        case "action": self = .action
        case "actions-cache": self = .actionsCache
        case "add-on": self = .addOn
        case "admin-api-key": self = .adminApiKey
        case "agent": self = .agent
        case "agent-api-key": self = .agentApiKey
        case "agent-config": self = .agentConfig
        case "agent-pool": self = .agentPool
        case "agent-session": self = .agentSession
        case "agent-token": self = .agentToken
        case "agent-variable": self = .agentVariable
        case "ai-gateway": self = .aiGateway
        case "ai-search": self = .aiSearch
        case "aiven-billing-group": self = .aivenBillingGroup
        case "aiven-connection-pool": self = .aivenConnectionPool
        case "aiven-database": self = .aivenDatabase
        case "aiven-integration": self = .aivenIntegration
        case "aiven-kafka-acl": self = .aivenKafkaAcl
        case "aiven-kafka-connector": self = .aivenKafkaConnector
        case "aiven-kafka-topic": self = .aivenKafkaTopic
        case "aiven-project": self = .aivenProject
        case "aiven-schema-subject": self = .aivenSchemaSubject
        case "aiven-service": self = .aivenService
        case "aiven-service-user": self = .aivenServiceUser
        case "aiven-vpc": self = .aivenVpc
        case "aiven-vpc-peering": self = .aivenVpcPeering
        case "alb": self = .alb
        case "alert": self = .alert
        case "alert-channel": self = .alertChannel
        case "alert-condition": self = .alertCondition
        case "alert-configuration": self = .alertConfiguration
        case "alert-policy": self = .alertPolicy
        case "alert-rule": self = .alertRule
        case "alerting-profile": self = .alertingProfile
        case "alias": self = .alias
        case "alignment-job": self = .alignmentJob
        case "allowlist-identifier": self = .allowlistIdentifier
        case "alloydb-cluster": self = .alloydbCluster
        case "alloydb-instance": self = .alloydbInstance
        case "analytics-engine-dataset": self = .analyticsEngineDataset
        case "annotation": self = .annotation
        case "anti-affinity-group": self = .antiAffinityGroup
        case "api": self = .api
        case "api-gateway": self = .apiGateway
        case "api-key": self = .apiKey
        case "api-token": self = .apiToken
        case "apm-application": self = .apmApplication
        case "app": self = .app
        case "app-engine-service": self = .appEngineService
        case "app-secret": self = .appSecret
        case "application": self = .application
        case "application-key": self = .applicationKey
        case "apprunner-service": self = .apprunnerService
        case "artifact-registry-repo": self = .artifactRegistryRepo
        case "assistant": self = .assistant
        case "astra-access-entry": self = .astraAccessEntry
        case "astra-cdc": self = .astraCdc
        case "astra-collection": self = .astraCollection
        case "astra-database": self = .astraDatabase
        case "astra-keyspace": self = .astraKeyspace
        case "astra-pcu-group": self = .astraPcuGroup
        case "astra-private-endpoint": self = .astraPrivateEndpoint
        case "astra-region": self = .astraRegion
        case "astra-role": self = .astraRole
        case "astra-snapshot": self = .astraSnapshot
        case "astra-streaming-tenant": self = .astraStreamingTenant
        case "astra-token": self = .astraToken
        case "astra-user": self = .astraUser
        case "audit-event": self = .auditEvent
        case "authorization-server": self = .authorizationServer
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
        case "backup": self = .backup
        case "backup-policy": self = .backupPolicy
        case "backup-restore": self = .backupRestore
        case "backup-schedule": self = .backupSchedule
        case "backup-snapshot": self = .backupSnapshot
        case "backup-vault": self = .backupVault
        case "balance": self = .balance
        case "bare-metal": self = .bareMetal
        case "basin-catalog": self = .basinCatalog
        case "basin-pipeline": self = .basinPipeline
        case "basin-sink": self = .basinSink
        case "basin-stream": self = .basinStream
        case "basin-table": self = .basinTable
        case "batch": self = .batch
        case "batch-export": self = .batchExport
        case "batch-inference-job": self = .batchInferenceJob
        case "batch-job-queue": self = .batchJobQueue
        case "bedrock-model": self = .bedrockModel
        case "bigquery-dataset": self = .bigqueryDataset
        case "bigquery-table": self = .bigqueryTable
        case "bigtable-instance": self = .bigtableInstance
        case "billable-metric": self = .billableMetric
        case "billing-account": self = .billingAccount
        case "billing-group": self = .billingGroup
        case "block-storage": self = .blockStorage
        case "block-storage-snapshot": self = .blockStorageSnapshot
        case "block-volume": self = .blockVolume
        case "blocklist-identifier": self = .blocklistIdentifier
        case "blueprint": self = .blueprint
        case "board": self = .board
        case "board-view": self = .boardView
        case "boot-volume": self = .bootVolume
        case "branch-restriction": self = .branchRestriction
        case "browser-application": self = .browserApplication
        case "bucket": self = .bucket
        case "budget": self = .budget
        case "budget-alert-rule": self = .budgetAlertRule
        case "build": self = .build
        case "burn-alert": self = .burnAlert
        case "byok-credential": self = .byokCredential
        case "cache-rule": self = .cacheRule
        case "cached-content": self = .cachedContent
        case "capella-allowed-cidr": self = .capellaAllowedCidr
        case "capella-api-key": self = .capellaApiKey
        case "capella-app-service": self = .capellaAppService
        case "capella-backup": self = .capellaBackup
        case "capella-bucket": self = .capellaBucket
        case "capella-cluster": self = .capellaCluster
        case "capella-collection": self = .capellaCollection
        case "capella-db-credential": self = .capellaDbCredential
        case "capella-network-peer": self = .capellaNetworkPeer
        case "capella-private-endpoint": self = .capellaPrivateEndpoint
        case "capella-project": self = .capellaProject
        case "capella-replication": self = .capellaReplication
        case "capella-scope": self = .capellaScope
        case "capella-user": self = .capellaUser
        case "cdn-endpoint": self = .cdnEndpoint
        case "cerebras-batch": self = .cerebrasBatch
        case "cerebras-endpoint": self = .cerebrasEndpoint
        case "cerebras-file": self = .cerebrasFile
        case "cerebras-model": self = .cerebrasModel
        case "cerebras-model-version": self = .cerebrasModelVersion
        case "certificate": self = .certificate
        case "certificate-authority": self = .certificateAuthority
        case "ch-api-key": self = .chApiKey
        case "ch-backup": self = .chBackup
        case "ch-clickpipe": self = .chClickpipe
        case "ch-database": self = .chDatabase
        case "ch-member": self = .chMember
        case "ch-postgres": self = .chPostgres
        case "ch-service": self = .chService
        case "chain": self = .chain
        case "chart": self = .chart
        case "check": self = .check
        case "check-group": self = .checkGroup
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
        case "cluster-secret": self = .clusterSecret
        case "code-engine-app": self = .codeEngineApp
        case "code-engine-project": self = .codeEngineProject
        case "codebuild-project": self = .codebuildProject
        case "codepipeline-pipeline": self = .codepipelinePipeline
        case "codespace": self = .codespace
        case "cognito-user-pool": self = .cognitoUserPool
        case "cohort": self = .cohort
        case "collection": self = .collection
        case "collection-document": self = .collectionDocument
        case "column": self = .column
        case "compartment": self = .compartment
        case "composer-environment": self = .composerEnvironment
        case "compute-config": self = .computeConfig
        case "config-store": self = .configStore
        case "config-var": self = .configVar
        case "connection": self = .connection
        case "connectivity-rule": self = .connectivityRule
        case "connector": self = .connector
        case "consul-acl-policy": self = .consulAclPolicy
        case "consul-acl-role": self = .consulAclRole
        case "consul-acl-token": self = .consulAclToken
        case "consul-check": self = .consulCheck
        case "consul-cluster": self = .consulCluster
        case "consul-config-entry": self = .consulConfigEntry
        case "consul-intention": self = .consulIntention
        case "consul-namespace": self = .consulNamespace
        case "consul-node": self = .consulNode
        case "consul-partition": self = .consulPartition
        case "consul-peering": self = .consulPeering
        case "consul-service": self = .consulService
        case "consul-session": self = .consulSession
        case "contact-point": self = .contactPoint
        case "container": self = .container
        case "container-app": self = .containerApp
        case "container-registry": self = .containerRegistry
        case "container-registry-auth": self = .containerRegistryAuth
        case "container-repository": self = .containerRepository
        case "context": self = .context
        case "context-variable": self = .contextVariable
        case "convex-access-token": self = .convexAccessToken
        case "convex-custom-domain": self = .convexCustomDomain
        case "convex-custom-role": self = .convexCustomRole
        case "convex-default-env-var": self = .convexDefaultEnvVar
        case "convex-deploy-key": self = .convexDeployKey
        case "convex-deployment": self = .convexDeployment
        case "convex-env-var": self = .convexEnvVar
        case "convex-invite": self = .convexInvite
        case "convex-log-stream": self = .convexLogStream
        case "convex-member": self = .convexMember
        case "convex-preview-deploy-key": self = .convexPreviewDeployKey
        case "convex-project": self = .convexProject
        case "convex-team": self = .convexTeam
        case "convex-usage-limit": self = .convexUsageLimit
        case "copilot-seat": self = .copilotSeat
        case "cors-rule": self = .corsRule
        case "cos-bucket": self = .cosBucket
        case "cost-center": self = .costCenter
        case "crawler": self = .crawler
        case "crdb-allowlist-entry": self = .crdbAllowlistEntry
        case "crdb-api-key": self = .crdbApiKey
        case "crdb-backup": self = .crdbBackup
        case "crdb-blackout-window": self = .crdbBlackoutWindow
        case "crdb-cluster": self = .crdbCluster
        case "crdb-database": self = .crdbDatabase
        case "crdb-egress-rule": self = .crdbEgressRule
        case "crdb-folder": self = .crdbFolder
        case "crdb-log-export": self = .crdbLogExport
        case "crdb-metric-export": self = .crdbMetricExport
        case "crdb-organization": self = .crdbOrganization
        case "crdb-restore": self = .crdbRestore
        case "crdb-service-account": self = .crdbServiceAccount
        case "crdb-sql-user": self = .crdbSqlUser
        case "cron-monitor": self = .cronMonitor
        case "custom-domain": self = .customDomain
        case "custom-enrichment": self = .customEnrichment
        case "custom-hostname": self = .customHostname
        case "custom-template": self = .customTemplate
        case "custom-voice": self = .customVoice
        case "customer": self = .customer
        case "d1-database": self = .d1Database
        case "dashboard": self = .dashboard
        case "dashboard-group": self = .dashboardGroup
        case "database": self = .database
        case "database-api-key": self = .databaseApiKey
        case "database-backup": self = .databaseBackup
        case "database-db": self = .databaseDb
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
        case "dbaas": self = .dbaas
        case "dbaas-database": self = .dbaasDatabase
        case "dbaas-user": self = .dbaasUser
        case "dedicated-inference": self = .dedicatedInference
        case "deploy": self = .deploy
        case "deploy-key": self = .deployKey
        case "deploy-token": self = .deployToken
        case "deployed-model": self = .deployedModel
        case "deployment": self = .deployment
        case "deployment-variable": self = .deploymentVariable
        case "depot-actions-repo": self = .depotActionsRepo
        case "depot-build": self = .depotBuild
        case "depot-project": self = .depotProject
        case "depot-registry-image": self = .depotRegistryImage
        case "depot-token": self = .depotToken
        case "depot-trust-policy": self = .depotTrustPolicy
        case "derived-column": self = .derivedColumn
        case "detector": self = .detector
        case "device": self = .device
        case "dict": self = .dict
        case "dictionary": self = .dictionary
        case "directory": self = .directory
        case "directory-group": self = .directoryGroup
        case "directory-user": self = .directoryUser
        case "disk": self = .disk
        case "distribution-credential": self = .distributionCredential
        case "dns-domain": self = .dnsDomain
        case "dns-record": self = .dnsRecord
        case "dns-zone": self = .dnsZone
        case "docker-container": self = .dockerContainer
        case "docker-image": self = .dockerImage
        case "docker-network": self = .dockerNetwork
        case "docker-volume": self = .dockerVolume
        case "dockerhub-access-token": self = .dockerhubAccessToken
        case "dockerhub-invite": self = .dockerhubInvite
        case "dockerhub-member": self = .dockerhubMember
        case "dockerhub-namespace": self = .dockerhubNamespace
        case "dockerhub-org-access-token": self = .dockerhubOrgAccessToken
        case "dockerhub-repository": self = .dockerhubRepository
        case "dockerhub-tag": self = .dockerhubTag
        case "dockerhub-team": self = .dockerhubTeam
        case "documentdb-cluster": self = .documentdbCluster
        case "doks-cluster": self = .doksCluster
        case "domain": self = .domain
        case "domain-record": self = .domainRecord
        case "doppler-config": self = .dopplerConfig
        case "doppler-environment": self = .dopplerEnvironment
        case "doppler-group": self = .dopplerGroup
        case "doppler-integration": self = .dopplerIntegration
        case "doppler-project": self = .dopplerProject
        case "doppler-secret": self = .dopplerSecret
        case "doppler-service-account": self = .dopplerServiceAccount
        case "doppler-service-account-token": self = .dopplerServiceAccountToken
        case "doppler-service-token": self = .dopplerServiceToken
        case "doppler-sync": self = .dopplerSync
        case "doppler-user": self = .dopplerUser
        case "doppler-webhook": self = .dopplerWebhook
        case "doppler-workplace": self = .dopplerWorkplace
        case "downtime": self = .downtime
        case "dpo-job": self = .dpoJob
        case "drop-rule": self = .dropRule
        case "droplet": self = .droplet
        case "durable-object-namespace": self = .durableObjectNamespace
        case "dynamic-secret": self = .dynamicSecret
        case "dynamodb-table": self = .dynamodbTable
        case "dyno": self = .dyno
        case "ebs-volume": self = .ebsVolume
        case "ec2-instance": self = .ec2Instance
        case "ecr-repository": self = .ecrRepository
        case "ecs-instance": self = .ecsInstance
        case "ecs-service": self = .ecsService
        case "edge-rule": self = .edgeRule
        case "edge-script": self = .edgeScript
        case "efs-file-system": self = .efsFileSystem
        case "eip": self = .eip
        case "eks-cluster": self = .eksCluster
        case "elastic-ip": self = .elasticIp
        case "elasticache-cluster": self = .elasticacheCluster
        case "elasticache-serverless-cache": self = .elasticacheServerlessCache
        case "email-routing-rule": self = .emailRoutingRule
        case "embed-job": self = .embedJob
        case "encryption-key": self = .encryptionKey
        case "endpoint": self = .endpoint
        case "enrichment": self = .enrichment
        case "enterprise-connection": self = .enterpriseConnection
        case "env-group": self = .envGroup
        case "env-group-var": self = .envGroupVar
        case "env-var": self = .envVar
        case "environment": self = .environment
        case "escalation-policy": self = .escalationPolicy
        case "eval": self = .eval
        case "evaluation": self = .evaluation
        case "evaluation-job": self = .evaluationJob
        case "evaluator": self = .evaluator
        case "event-hook": self = .eventHook
        case "eventbridge-rule": self = .eventbridgeRule
        case "events2metrics": self = .events2metrics
        case "experiment": self = .experiment
        case "export-sink": self = .exportSink
        case "extension": self = .`extension`
        case "fal-api-key": self = .falApiKey
        case "fal-app": self = .falApp
        case "fal-compute-instance": self = .falComputeInstance
        case "fal-model": self = .falModel
        case "fal-workflow": self = .falWorkflow
        case "fc-function": self = .fcFunction
        case "feature-flag": self = .featureFlag
        case "field": self = .field
        case "file": self = .file
        case "file-search-document": self = .fileSearchDocument
        case "file-search-store": self = .fileSearchStore
        case "filesystem": self = .filesystem
        case "fine-tune": self = .fineTune
        case "fine-tuning-job": self = .fineTuningJob
        case "finetuned-model": self = .finetunedModel
        case "firestore-database": self = .firestoreDatabase
        case "firewall": self = .firewall
        case "firewall-group": self = .firewallGroup
        case "firewall-rule": self = .firewallRule
        case "firewall-ruleset": self = .firewallRuleset
        case "flex-cluster": self = .flexCluster
        case "flexible-ip": self = .flexibleIp
        case "flink-compute-pool": self = .flinkComputePool
        case "floating-ip": self = .floatingIp
        case "folder": self = .folder
        case "formation": self = .formation
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
        case "global-firewall": self = .globalFirewall
        case "glue-database": self = .glueDatabase
        case "gpu-cluster": self = .gpuCluster
        case "groq-batch": self = .groqBatch
        case "groq-file": self = .groqFile
        case "groq-fine-tuning": self = .groqFineTuning
        case "groq-model": self = .groqModel
        case "group": self = .group
        case "group-deploy-token": self = .groupDeployToken
        case "group-member": self = .groupMember
        case "group-variable": self = .groupVariable
        case "group-webhook": self = .groupWebhook
        case "guardrail": self = .guardrail
        case "hardware": self = .hardware
        case "health-check": self = .healthCheck
        case "healthcheck": self = .healthcheck
        case "heartbeat": self = .heartbeat
        case "heartbeat-group": self = .heartbeatGroup
        case "hf-dataset": self = .hfDataset
        case "hf-inference-endpoint": self = .hfInferenceEndpoint
        case "hf-job": self = .hfJob
        case "hf-member-token": self = .hfMemberToken
        case "hf-model": self = .hfModel
        case "hf-provider-model": self = .hfProviderModel
        case "hf-scheduled-job": self = .hfScheduledJob
        case "hf-service-account": self = .hfServiceAccount
        case "hf-space": self = .hfSpace
        case "hf-webhook": self = .hfWebhook
        case "history-item": self = .historyItem
        case "hog-function": self = .hogFunction
        case "host": self = .host
        case "hosted-runner": self = .hostedRunner
        case "hostname": self = .hostname
        case "hybrid-environment": self = .hybridEnvironment
        case "hyperdrive": self = .hyperdrive
        case "iam-role": self = .iamRole
        case "iam-user": self = .iamUser
        case "image": self = .image
        case "incident": self = .incident
        case "incident-io-alert-route": self = .incidentIoAlertRoute
        case "incident-io-alert-source": self = .incidentIoAlertSource
        case "incident-io-catalog-type": self = .incidentIoCatalogType
        case "incident-io-escalation": self = .incidentIoEscalation
        case "incident-io-escalation-path": self = .incidentIoEscalationPath
        case "incident-io-incident": self = .incidentIoIncident
        case "incident-io-maintenance-window": self = .incidentIoMaintenanceWindow
        case "incident-io-schedule": self = .incidentIoSchedule
        case "incident-io-severity": self = .incidentIoSeverity
        case "incident-io-status": self = .incidentIoStatus
        case "incident-io-status-page": self = .incidentIoStatusPage
        case "incident-io-team": self = .incidentIoTeam
        case "incident-io-user": self = .incidentIoUser
        case "incident-io-workflow": self = .incidentIoWorkflow
        case "index": self = .index
        case "inference-batch": self = .inferenceBatch
        case "influx-bucket": self = .influxBucket
        case "influx-check": self = .influxCheck
        case "influx-dashboard": self = .influxDashboard
        case "influx-dedicated-database": self = .influxDedicatedDatabase
        case "influx-dedicated-token": self = .influxDedicatedToken
        case "influx-notification-endpoint": self = .influxNotificationEndpoint
        case "influx-notification-rule": self = .influxNotificationRule
        case "influx-org": self = .influxOrg
        case "influx-task": self = .influxTask
        case "influx-telegraf": self = .influxTelegraf
        case "influx-token": self = .influxToken
        case "insight": self = .insight
        case "instance": self = .instance
        case "instance-group": self = .instanceGroup
        case "instance-pool": self = .instancePool
        case "instance-snapshot": self = .instanceSnapshot
        case "instance-template": self = .instanceTemplate
        case "instance-type": self = .instanceType
        case "integration": self = .integration
        case "internet-gateway": self = .internetGateway
        case "invitation": self = .invitation
        case "invite": self = .invite
        case "invoice": self = .invoice
        case "ip-access-entry": self = .ipAccessEntry
        case "ip-access-rule": self = .ipAccessRule
        case "ip-allocation": self = .ipAllocation
        case "issue": self = .issue
        case "jfrog-access-token": self = .jfrogAccessToken
        case "jfrog-build": self = .jfrogBuild
        case "jfrog-build-run": self = .jfrogBuildRun
        case "jfrog-group": self = .jfrogGroup
        case "jfrog-permission": self = .jfrogPermission
        case "jfrog-platform": self = .jfrogPlatform
        case "jfrog-repository": self = .jfrogRepository
        case "jfrog-user": self = .jfrogUser
        case "jfrog-xray-policy": self = .jfrogXrayPolicy
        case "jfrog-xray-violation": self = .jfrogXrayViolation
        case "jfrog-xray-watch": self = .jfrogXrayWatch
        case "job": self = .job
        case "jwt-template": self = .jwtTemplate
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
        case "key-value": self = .keyValue
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
        case "lifecycle-rule": self = .lifecycleRule
        case "linode": self = .linode
        case "live-session": self = .liveSession
        case "lke-cluster": self = .lkeCluster
        case "lke-node-pool": self = .lkeNodePool
        case "llm-model": self = .llmModel
        case "load-balancer": self = .loadBalancer
        case "log-drain": self = .logDrain
        case "log-sink": self = .logSink
        case "log-stream": self = .logStream
        case "logging-endpoint": self = .loggingEndpoint
        case "logpush-job": self = .logpushJob
        case "machine": self = .machine
        case "machine-identity": self = .machineIdentity
        case "mailgun-account": self = .mailgunAccount
        case "mailgun-account-webhook": self = .mailgunAccountWebhook
        case "mailgun-api-key": self = .mailgunApiKey
        case "mailgun-dns-record": self = .mailgunDnsRecord
        case "mailgun-domain": self = .mailgunDomain
        case "mailgun-ip": self = .mailgunIp
        case "mailgun-ip-pool": self = .mailgunIpPool
        case "mailgun-mailing-list": self = .mailgunMailingList
        case "mailgun-route": self = .mailgunRoute
        case "mailgun-smtp-credential": self = .mailgunSmtpCredential
        case "mailgun-subaccount": self = .mailgunSubaccount
        case "mailgun-tag": self = .mailgunTag
        case "mailgun-webhook": self = .mailgunWebhook
        case "maintenance": self = .maintenance
        case "maintenance-window": self = .maintenanceWindow
        case "managed-database": self = .managedDatabase
        case "managed-db": self = .managedDb
        case "managed-endpoint": self = .managedEndpoint
        case "managed-kube": self = .managedKube
        case "marker": self = .marker
        case "marker-setting": self = .markerSetting
        case "media-asset": self = .mediaAsset
        case "member": self = .member
        case "memcached-instance": self = .memcachedInstance
        case "memorystore-memcached": self = .memorystoreMemcached
        case "memorystore-redis": self = .memorystoreRedis
        case "memorystore-valkey": self = .memorystoreValkey
        case "message-batch": self = .messageBatch
        case "messaging-service": self = .messagingService
        case "minio-server": self = .minioServer
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
        case "module": self = .module
        case "mongodb-database": self = .mongodbDatabase
        case "monitor": self = .monitor
        case "monitor-group": self = .monitorGroup
        case "mq-broker": self = .mqBroker
        case "msk-cluster": self = .mskCluster
        case "mssql-database": self = .mssqlDatabase
        case "muting-rule": self = .mutingRule
        case "mysql-database": self = .mysqlDatabase
        case "namespace": self = .namespace
        case "nat-gateway": self = .natGateway
        case "nats-account": self = .natsAccount
        case "nats-connection": self = .natsConnection
        case "nats-consumer": self = .natsConsumer
        case "nats-kv-bucket": self = .natsKvBucket
        case "nats-object-store": self = .natsObjectStore
        case "nats-peer": self = .natsPeer
        case "nats-server": self = .natsServer
        case "nats-stream": self = .natsStream
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
        case "network-volume": self = .networkVolume
        case "network-zone": self = .networkZone
        case "nexus-endpoint": self = .nexusEndpoint
        case "nf-account": self = .nfAccount
        case "nf-addon": self = .nfAddon
        case "nf-cluster": self = .nfCluster
        case "nf-domain": self = .nfDomain
        case "nf-job": self = .nfJob
        case "nf-pipeline": self = .nfPipeline
        case "nf-project": self = .nfProject
        case "nf-secret-group": self = .nfSecretGroup
        case "nf-service": self = .nfService
        case "nf-subdomain": self = .nfSubdomain
        case "nf-volume": self = .nfVolume
        case "nfs-share": self = .nfsShare
        case "nlb": self = .nlb
        case "node-group": self = .nodeGroup
        case "node-pool": self = .nodePool
        case "nodebalancer": self = .nodebalancer
        case "nomad-acl-policy": self = .nomadAclPolicy
        case "nomad-acl-token": self = .nomadAclToken
        case "nomad-allocation": self = .nomadAllocation
        case "nomad-cluster": self = .nomadCluster
        case "nomad-csi-plugin": self = .nomadCsiPlugin
        case "nomad-deployment": self = .nomadDeployment
        case "nomad-job": self = .nomadJob
        case "nomad-namespace": self = .nomadNamespace
        case "nomad-node": self = .nomadNode
        case "nomad-node-pool": self = .nomadNodePool
        case "nomad-service": self = .nomadService
        case "nomad-variable": self = .nomadVariable
        case "nomad-volume": self = .nomadVolume
        case "notification-policy": self = .notificationPolicy
        case "notification-rule": self = .notificationRule
        case "notifier": self = .notifier
        case "oauth-application": self = .oauthApplication
        case "object-storage": self = .objectStorage
        case "object-storage-bucket": self = .objectStorageBucket
        case "object-storage-user": self = .objectStorageUser
        case "object-store": self = .objectStore
        case "object-store-credential": self = .objectStoreCredential
        case "octavia-load-balancer": self = .octaviaLoadBalancer
        case "oke-cluster": self = .okeCluster
        case "on-call-calendar": self = .onCallCalendar
        case "online-archive": self = .onlineArchive
        case "opensearch-cluster": self = .opensearchCluster
        case "opensearch-domain": self = .opensearchDomain
        case "org": self = .org
        case "org-token": self = .orgToken
        case "organization": self = .organization
        case "organization-api-key": self = .organizationApiKey
        case "organization-domain": self = .organizationDomain
        case "organization-membership": self = .organizationMembership
        case "organization-role": self = .organizationRole
        case "organization-user": self = .organizationUser
        case "os-container": self = .osContainer
        case "os-dns-recordset": self = .osDnsRecordset
        case "os-dns-zone": self = .osDnsZone
        case "os-flavor": self = .osFlavor
        case "os-floating-ip": self = .osFloatingIp
        case "os-image": self = .osImage
        case "os-keypair": self = .osKeypair
        case "os-lb-listener": self = .osLbListener
        case "os-lb-pool": self = .osLbPool
        case "os-loadbalancer": self = .osLoadbalancer
        case "os-network": self = .osNetwork
        case "os-router": self = .osRouter
        case "os-security-group": self = .osSecurityGroup
        case "os-security-group-rule": self = .osSecurityGroupRule
        case "os-server": self = .osServer
        case "os-stack": self = .osStack
        case "os-subnet": self = .osSubnet
        case "os-volume": self = .osVolume
        case "os-volume-backup": self = .osVolumeBackup
        case "os-volume-snapshot": self = .osVolumeSnapshot
        case "oss-bucket": self = .ossBucket
        case "outgoing-webhook": self = .outgoingWebhook
        case "package": self = .package
        case "page-rule": self = .pageRule
        case "pagerduty-business-service": self = .pagerdutyBusinessService
        case "pagerduty-escalation-policy": self = .pagerdutyEscalationPolicy
        case "pagerduty-event-orchestration": self = .pagerdutyEventOrchestration
        case "pagerduty-incident": self = .pagerdutyIncident
        case "pagerduty-maintenance-window": self = .pagerdutyMaintenanceWindow
        case "pagerduty-schedule": self = .pagerdutySchedule
        case "pagerduty-service": self = .pagerdutyService
        case "pagerduty-team": self = .pagerdutyTeam
        case "pagerduty-user": self = .pagerdutyUser
        case "parsing-rule-group": self = .parsingRuleGroup
        case "permission": self = .permission
        case "perplexity-agent-model": self = .perplexityAgentModel
        case "perplexity-async-request": self = .perplexityAsyncRequest
        case "perplexity-router-model": self = .perplexityRouterModel
        case "perplexity-skill": self = .perplexitySkill
        case "perplexity-sonar-model": self = .perplexitySonarModel
        case "pg-database": self = .pgDatabase
        case "pg-schema": self = .pgSchema
        case "phone-number": self = .phoneNumber
        case "pipeline": self = .pipeline
        case "pipeline-cache": self = .pipelineCache
        case "pipeline-coupling": self = .pipelineCoupling
        case "pipeline-schedule": self = .pipelineSchedule
        case "pipeline-template": self = .pipelineTemplate
        case "placement-group": self = .placementGroup
        case "playbook": self = .playbook
        case "pod": self = .pod
        case "policy": self = .policy
        case "policy-group": self = .policyGroup
        case "policy-pack": self = .policyPack
        case "policy-set": self = .policySet
        case "postgres": self = .postgres
        case "postgres-cluster": self = .postgresCluster
        case "postmark-dns-record": self = .postmarkDnsRecord
        case "postmark-domain": self = .postmarkDomain
        case "postmark-inbound-rule": self = .postmarkInboundRule
        case "postmark-message-stream": self = .postmarkMessageStream
        case "postmark-sender-signature": self = .postmarkSenderSignature
        case "postmark-server": self = .postmarkServer
        case "postmark-template": self = .postmarkTemplate
        case "postmark-webhook": self = .postmarkWebhook
        case "posture-integration": self = .postureIntegration
        case "prediction": self = .prediction
        case "primary-ip": self = .primaryIp
        case "private-endpoint-service": self = .privateEndpointService
        case "private-location": self = .privateLocation
        case "private-network": self = .privateNetwork
        case "problem": self = .problem
        case "process-group": self = .processGroup
        case "product-environment": self = .productEnvironment
        case "project": self = .project
        case "project-api-key": self = .projectApiKey
        case "project-deploy-key": self = .projectDeployKey
        case "project-member": self = .projectMember
        case "project-rate-limit": self = .projectRateLimit
        case "project-service-account": self = .projectServiceAccount
        case "project-user": self = .projectUser
        case "project-variable": self = .projectVariable
        case "project-webhook": self = .projectWebhook
        case "prometheus-alert": self = .prometheusAlert
        case "prometheus-alertmanager": self = .prometheusAlertmanager
        case "prometheus-am-alert": self = .prometheusAmAlert
        case "prometheus-receiver": self = .prometheusReceiver
        case "prometheus-rule": self = .prometheusRule
        case "prometheus-rule-group": self = .prometheusRuleGroup
        case "prometheus-scrape-pool": self = .prometheusScrapePool
        case "prometheus-server": self = .prometheusServer
        case "prometheus-silence": self = .prometheusSilence
        case "prometheus-target": self = .prometheusTarget
        case "pronunciation-dict": self = .pronunciationDict
        case "pronunciation-dictionary": self = .pronunciationDictionary
        case "protected-branch": self = .protectedBranch
        case "provider": self = .provider
        case "ps-backup": self = .psBackup
        case "ps-branch": self = .psBranch
        case "ps-database": self = .psDatabase
        case "ps-deploy-request": self = .psDeployRequest
        case "ps-password": self = .psPassword
        case "ps-role": self = .psRole
        case "ps-webhook": self = .psWebhook
        case "public-ip": self = .publicIp
        case "pubsub-subscription": self = .pubsubSubscription
        case "pubsub-topic": self = .pubsubTopic
        case "pull-zone": self = .pullZone
        case "purchase": self = .purchase
        case "pve-backup": self = .pveBackup
        case "pve-backup-job": self = .pveBackupJob
        case "pve-cluster": self = .pveCluster
        case "pve-ct": self = .pveCt
        case "pve-firewall-alias": self = .pveFirewallAlias
        case "pve-firewall-rule": self = .pveFirewallRule
        case "pve-ha-resource": self = .pveHaResource
        case "pve-ha-rule": self = .pveHaRule
        case "pve-ipset": self = .pveIpset
        case "pve-node": self = .pveNode
        case "pve-pool": self = .pvePool
        case "pve-security-group": self = .pveSecurityGroup
        case "pve-storage": self = .pveStorage
        case "pve-vm": self = .pveVm
        case "queue": self = .queue
        case "quota": self = .quota
        case "quota-rule": self = .quotaRule
        case "r2-bucket": self = .r2Bucket
        case "rabbitmq-binding": self = .rabbitmqBinding
        case "rabbitmq-channel": self = .rabbitmqChannel
        case "rabbitmq-cluster": self = .rabbitmqCluster
        case "rabbitmq-connection": self = .rabbitmqConnection
        case "rabbitmq-exchange": self = .rabbitmqExchange
        case "rabbitmq-federation-upstream": self = .rabbitmqFederationUpstream
        case "rabbitmq-node": self = .rabbitmqNode
        case "rabbitmq-operator-policy": self = .rabbitmqOperatorPolicy
        case "rabbitmq-permission": self = .rabbitmqPermission
        case "rabbitmq-policy": self = .rabbitmqPolicy
        case "rabbitmq-queue": self = .rabbitmqQueue
        case "rabbitmq-shovel": self = .rabbitmqShovel
        case "rabbitmq-topic-permission": self = .rabbitmqTopicPermission
        case "rabbitmq-user": self = .rabbitmqUser
        case "rabbitmq-vhost": self = .rabbitmqVhost
        case "ram-user": self = .ramUser
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
        case "recipient": self = .recipient
        case "recording-rule": self = .recordingRule
        case "redirect-rule": self = .redirectRule
        case "redirect-url": self = .redirectUrl
        case "redis-instance": self = .redisInstance
        case "redshift-cluster": self = .redshiftCluster
        case "registry-module": self = .registryModule
        case "registry-namespace": self = .registryNamespace
        case "registry-provider": self = .registryProvider
        case "reinforcement-fine-tuning-job": self = .reinforcementFineTuningJob
        case "release": self = .release
        case "replication-rule": self = .replicationRule
        case "repo-blocklist": self = .repoBlocklist
        case "repository": self = .repository
        case "repository-variable": self = .repositoryVariable
        case "repository-webhook": self = .repositoryWebhook
        case "resend-account": self = .resendAccount
        case "resend-api-key": self = .resendApiKey
        case "resend-automation": self = .resendAutomation
        case "resend-broadcast": self = .resendBroadcast
        case "resend-contact": self = .resendContact
        case "resend-contact-property": self = .resendContactProperty
        case "resend-dns-record": self = .resendDnsRecord
        case "resend-domain": self = .resendDomain
        case "resend-email": self = .resendEmail
        case "resend-oauth-grant": self = .resendOauthGrant
        case "resend-segment": self = .resendSegment
        case "resend-suppression": self = .resendSuppression
        case "resend-template": self = .resendTemplate
        case "resend-topic": self = .resendTopic
        case "resend-webhook": self = .resendWebhook
        case "reservation": self = .reservation
        case "reserved-ip": self = .reservedIp
        case "resource-group": self = .resourceGroup
        case "restore-job": self = .restoreJob
        case "review-app": self = .reviewApp
        case "role": self = .role
        case "rollup-rule": self = .rollupRule
        case "route-table": self = .routeTable
        case "route53-health-check": self = .route53HealthCheck
        case "route53-hosted-zone": self = .route53HostedZone
        case "route53-record-set": self = .route53RecordSet
        case "router": self = .router
        case "run": self = .run
        case "run-task": self = .runTask
        case "runner": self = .runner
        case "runner-resource-class": self = .runnerResourceClass
        case "s3-bucket": self = .s3Bucket
        case "sagemaker-endpoint": self = .sagemakerEndpoint
        case "sambanova-model": self = .sambanovaModel
        case "saved-query": self = .savedQuery
        case "schedule": self = .schedule
        case "scheduled-function": self = .scheduledFunction
        case "schema-registry": self = .schemaRegistry
        case "search-index": self = .searchIndex
        case "secret": self = .secret
        case "secret-manager-secret": self = .secretManagerSecret
        case "secret-store": self = .secretStore
        case "secret-sync": self = .secretSync
        case "secrets-manager-secret": self = .secretsManagerSecret
        case "secrets-store-secret": self = .secretsStoreSecret
        case "security-group": self = .securityGroup
        case "security-list": self = .securityList
        case "sendgrid-account": self = .sendgridAccount
        case "sendgrid-alert": self = .sendgridAlert
        case "sendgrid-api-key": self = .sendgridApiKey
        case "sendgrid-dns-record": self = .sendgridDnsRecord
        case "sendgrid-domain": self = .sendgridDomain
        case "sendgrid-event-webhook": self = .sendgridEventWebhook
        case "sendgrid-inbound-parse": self = .sendgridInboundParse
        case "sendgrid-ip": self = .sendgridIp
        case "sendgrid-ip-pool": self = .sendgridIpPool
        case "sendgrid-link-branding": self = .sendgridLinkBranding
        case "sendgrid-reverse-dns": self = .sendgridReverseDns
        case "sendgrid-subuser": self = .sendgridSubuser
        case "sendgrid-template": self = .sendgridTemplate
        case "sendgrid-unsubscribe-group": self = .sendgridUnsubscribeGroup
        case "sendgrid-verified-sender": self = .sendgridVerifiedSender
        case "sentiment-job": self = .sentimentJob
        case "server": self = .server
        case "serverless-container": self = .serverlessContainer
        case "serverless-endpoint": self = .serverlessEndpoint
        case "serverless-function": self = .serverlessFunction
        case "serverless-instance": self = .serverlessInstance
        case "serverless-traffic-filter": self = .serverlessTrafficFilter
        case "service": self = .service
        case "service-account": self = .serviceAccount
        case "service-instance": self = .serviceInstance
        case "service-version": self = .serviceVersion
        case "session": self = .session
        case "shared-drive": self = .sharedDrive
        case "shared-variable": self = .sharedVariable
        case "shared-volume": self = .sharedVolume
        case "signal": self = .signal
        case "skill": self = .skill
        case "sks-cluster": self = .sksCluster
        case "sks-nodepool": self = .sksNodepool
        case "slb": self = .slb
        case "slo": self = .slo
        case "snapshot": self = .snapshot
        case "sni-endpoint": self = .sniEndpoint
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
        case "source": self = .source
        case "source-group": self = .sourceGroup
        case "space": self = .space
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
        case "stack-output": self = .stackOutput
        case "stack-plugin": self = .stackPlugin
        case "stackscript": self = .stackscript
        case "starred-query": self = .starredQuery
        case "startup-script": self = .startupScript
        case "state-output": self = .stateOutput
        case "static-ip": self = .staticIp
        case "status-page": self = .statusPage
        case "status-page-resource": self = .statusPageResource
        case "status-page-section": self = .statusPageSection
        case "status-report": self = .statusReport
        case "step-function": self = .stepFunction
        case "storage": self = .storage
        case "storage-box": self = .storageBox
        case "storage-zone": self = .storageZone
        case "stripe-account": self = .stripeAccount
        case "stripe-connected-account": self = .stripeConnectedAccount
        case "stripe-event-destination": self = .stripeEventDestination
        case "stripe-meter": self = .stripeMeter
        case "stripe-payout": self = .stripePayout
        case "stripe-price": self = .stripePrice
        case "stripe-product": self = .stripeProduct
        case "stripe-report-run": self = .stripeReportRun
        case "stripe-sigma-query-run": self = .stripeSigmaQueryRun
        case "stripe-webhook-endpoint": self = .stripeWebhookEndpoint
        case "sub-account": self = .subAccount
        case "subaccount": self = .subaccount
        case "subnet": self = .subnet
        case "supabase-api-key": self = .supabaseApiKey
        case "supabase-auth": self = .supabaseAuth
        case "supabase-backup": self = .supabaseBackup
        case "supabase-branch": self = .supabaseBranch
        case "supabase-bucket": self = .supabaseBucket
        case "supabase-function": self = .supabaseFunction
        case "supabase-organization": self = .supabaseOrganization
        case "supabase-project": self = .supabaseProject
        case "supabase-read-replica": self = .supabaseReadReplica
        case "supabase-secret": self = .supabaseSecret
        case "supabase-signing-key": self = .supabaseSigningKey
        case "supabase-sso-provider": self = .supabaseSsoProvider
        case "supabase-third-party-auth": self = .supabaseThirdPartyAuth
        case "supervised-fine-tuning-job": self = .supervisedFineTuningJob
        case "synthetic-check": self = .syntheticCheck
        case "synthetic-monitor": self = .syntheticMonitor
        case "synthetic-test": self = .syntheticTest
        case "synthetics-test": self = .syntheticsTest
        case "tailnet": self = .tailnet
        case "target-group": self = .targetGroup
        case "tco-policy": self = .tcoPolicy
        case "tcp-proxy": self = .tcpProxy
        case "team": self = .team
        case "team-member": self = .teamMember
        case "telemetry-alert": self = .telemetryAlert
        case "template": self = .template
        case "tenancy": self = .tenancy
        case "tenant": self = .tenant
        case "test": self = .test
        case "test-suite": self = .testSuite
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
        case "trusted-origin": self = .trustedOrigin
        case "ts-allow-list": self = .tsAllowList
        case "ts-backup": self = .tsBackup
        case "ts-exporter": self = .tsExporter
        case "ts-project": self = .tsProject
        case "ts-read-replica": self = .tsReadReplica
        case "ts-service": self = .tsService
        case "ts-vpc": self = .tsVpc
        case "ts-vpc-peering": self = .tsVpcPeering
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
        case "upstash-account": self = .upstashAccount
        case "upstash-qstash": self = .upstashQstash
        case "upstash-qstash-queue": self = .upstashQstashQueue
        case "upstash-qstash-schedule": self = .upstashQstashSchedule
        case "upstash-qstash-url-group": self = .upstashQstashUrlGroup
        case "upstash-redis": self = .upstashRedis
        case "upstash-search": self = .upstashSearch
        case "upstash-team": self = .upstashTeam
        case "upstash-vector": self = .upstashVector
        case "uptime-check": self = .uptimeCheck
        case "uptime-monitor": self = .uptimeMonitor
        case "usage-trigger": self = .usageTrigger
        case "user": self = .user
        case "user-invite": self = .userInvite
        case "ut-app": self = .utApp
        case "ut-file": self = .utFile
        case "variable": self = .variable
        case "variable-set": self = .variableSet
        case "varset-variable": self = .varsetVariable
        case "vault-audit-device": self = .vaultAuditDevice
        case "vault-auth-method": self = .vaultAuthMethod
        case "vault-cluster": self = .vaultCluster
        case "vault-kv-secret": self = .vaultKvSecret
        case "vault-lease": self = .vaultLease
        case "vault-mount": self = .vaultMount
        case "vault-pki-cert": self = .vaultPkiCert
        case "vault-pki-role": self = .vaultPkiRole
        case "vault-policy": self = .vaultPolicy
        case "vault-token": self = .vaultToken
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
        case "video-library": self = .videoLibrary
        case "view": self = .view
        case "virtual-field": self = .virtualField
        case "vm": self = .vm
        case "vocabulary": self = .vocabulary
        case "voice": self = .voice
        case "voice-agent": self = .voiceAgent
        case "volume": self = .volume
        case "volume-snapshot": self = .volumeSnapshot
        case "voyage-batch": self = .voyageBatch
        case "voyage-file": self = .voyageFile
        case "voyage-model": self = .voyageModel
        case "vpc": self = .vpc
        case "vpc-nat-gateway": self = .vpcNatGateway
        case "vpc-network": self = .vpcNetwork
        case "vpc-peering": self = .vpcPeering
        case "vpc-subnet": self = .vpcSubnet
        case "vsphere-cluster": self = .vsphereCluster
        case "vsphere-content-library": self = .vsphereContentLibrary
        case "vsphere-customization-spec": self = .vsphereCustomizationSpec
        case "vsphere-datacenter": self = .vsphereDatacenter
        case "vsphere-datastore": self = .vsphereDatastore
        case "vsphere-folder": self = .vsphereFolder
        case "vsphere-host": self = .vsphereHost
        case "vsphere-library-item": self = .vsphereLibraryItem
        case "vsphere-network": self = .vsphereNetwork
        case "vsphere-resource-pool": self = .vsphereResourcePool
        case "vsphere-tag": self = .vsphereTag
        case "vsphere-tag-category": self = .vsphereTagCategory
        case "vsphere-vcenter": self = .vsphereVcenter
        case "vsphere-vm": self = .vsphereVm
        case "vswitch": self = .vswitch
        case "waf-web-acl": self = .wafWebAcl
        case "waiting-room": self = .waitingRoom
        case "webhook": self = .webhook
        case "webhook-endpoint": self = .webhookEndpoint
        case "webhook-subscription": self = .webhookSubscription
        case "worker": self = .worker
        case "worker-pool": self = .workerPool
        case "worker-route": self = .workerRoute
        case "workergroup": self = .workergroup
        case "workers-ai-model": self = .workersAiModel
        case "workflow": self = .workflow
        case "workload": self = .workload
        case "workspace": self = .workspace
        case "workspace-member": self = .workspaceMember
        case "workspace-variable": self = .workspaceVariable
        case "workspace-webhook": self = .workspaceWebhook
        case "xata-api-key": self = .xataApiKey
        case "xata-backup": self = .xataBackup
        case "xata-branch": self = .xataBranch
        case "xata-invitation": self = .xataInvitation
        case "xata-member": self = .xataMember
        case "xata-organization": self = .xataOrganization
        case "xata-project": self = .xataProject
        case "zone": self = .zone
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .abTest: return "ab-test"
        case .accessApplication: return "access-application"
        case .accessKey: return "access-key"
        case .accessPolicy: return "access-policy"
        case .accessPolicyToken: return "access-policy-token"
        case .accessToken: return "access-token"
        case .account: return "account"
        case .ackCluster: return "ack-cluster"
        case .ackNodePool: return "ack-node-pool"
        case .acmCertificate: return "acm-certificate"
        case .action: return "action"
        case .actionsCache: return "actions-cache"
        case .addOn: return "add-on"
        case .adminApiKey: return "admin-api-key"
        case .agent: return "agent"
        case .agentApiKey: return "agent-api-key"
        case .agentConfig: return "agent-config"
        case .agentPool: return "agent-pool"
        case .agentSession: return "agent-session"
        case .agentToken: return "agent-token"
        case .agentVariable: return "agent-variable"
        case .aiGateway: return "ai-gateway"
        case .aiSearch: return "ai-search"
        case .aivenBillingGroup: return "aiven-billing-group"
        case .aivenConnectionPool: return "aiven-connection-pool"
        case .aivenDatabase: return "aiven-database"
        case .aivenIntegration: return "aiven-integration"
        case .aivenKafkaAcl: return "aiven-kafka-acl"
        case .aivenKafkaConnector: return "aiven-kafka-connector"
        case .aivenKafkaTopic: return "aiven-kafka-topic"
        case .aivenProject: return "aiven-project"
        case .aivenSchemaSubject: return "aiven-schema-subject"
        case .aivenService: return "aiven-service"
        case .aivenServiceUser: return "aiven-service-user"
        case .aivenVpc: return "aiven-vpc"
        case .aivenVpcPeering: return "aiven-vpc-peering"
        case .alb: return "alb"
        case .alert: return "alert"
        case .alertChannel: return "alert-channel"
        case .alertCondition: return "alert-condition"
        case .alertConfiguration: return "alert-configuration"
        case .alertPolicy: return "alert-policy"
        case .alertRule: return "alert-rule"
        case .alertingProfile: return "alerting-profile"
        case .alias: return "alias"
        case .alignmentJob: return "alignment-job"
        case .allowlistIdentifier: return "allowlist-identifier"
        case .alloydbCluster: return "alloydb-cluster"
        case .alloydbInstance: return "alloydb-instance"
        case .analyticsEngineDataset: return "analytics-engine-dataset"
        case .annotation: return "annotation"
        case .antiAffinityGroup: return "anti-affinity-group"
        case .api: return "api"
        case .apiGateway: return "api-gateway"
        case .apiKey: return "api-key"
        case .apiToken: return "api-token"
        case .apmApplication: return "apm-application"
        case .app: return "app"
        case .appEngineService: return "app-engine-service"
        case .appSecret: return "app-secret"
        case .application: return "application"
        case .applicationKey: return "application-key"
        case .apprunnerService: return "apprunner-service"
        case .artifactRegistryRepo: return "artifact-registry-repo"
        case .assistant: return "assistant"
        case .astraAccessEntry: return "astra-access-entry"
        case .astraCdc: return "astra-cdc"
        case .astraCollection: return "astra-collection"
        case .astraDatabase: return "astra-database"
        case .astraKeyspace: return "astra-keyspace"
        case .astraPcuGroup: return "astra-pcu-group"
        case .astraPrivateEndpoint: return "astra-private-endpoint"
        case .astraRegion: return "astra-region"
        case .astraRole: return "astra-role"
        case .astraSnapshot: return "astra-snapshot"
        case .astraStreamingTenant: return "astra-streaming-tenant"
        case .astraToken: return "astra-token"
        case .astraUser: return "astra-user"
        case .auditEvent: return "audit-event"
        case .authorizationServer: return "authorization-server"
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
        case .backup: return "backup"
        case .backupPolicy: return "backup-policy"
        case .backupRestore: return "backup-restore"
        case .backupSchedule: return "backup-schedule"
        case .backupSnapshot: return "backup-snapshot"
        case .backupVault: return "backup-vault"
        case .balance: return "balance"
        case .bareMetal: return "bare-metal"
        case .basinCatalog: return "basin-catalog"
        case .basinPipeline: return "basin-pipeline"
        case .basinSink: return "basin-sink"
        case .basinStream: return "basin-stream"
        case .basinTable: return "basin-table"
        case .batch: return "batch"
        case .batchExport: return "batch-export"
        case .batchInferenceJob: return "batch-inference-job"
        case .batchJobQueue: return "batch-job-queue"
        case .bedrockModel: return "bedrock-model"
        case .bigqueryDataset: return "bigquery-dataset"
        case .bigqueryTable: return "bigquery-table"
        case .bigtableInstance: return "bigtable-instance"
        case .billableMetric: return "billable-metric"
        case .billingAccount: return "billing-account"
        case .billingGroup: return "billing-group"
        case .blockStorage: return "block-storage"
        case .blockStorageSnapshot: return "block-storage-snapshot"
        case .blockVolume: return "block-volume"
        case .blocklistIdentifier: return "blocklist-identifier"
        case .blueprint: return "blueprint"
        case .board: return "board"
        case .boardView: return "board-view"
        case .bootVolume: return "boot-volume"
        case .branchRestriction: return "branch-restriction"
        case .browserApplication: return "browser-application"
        case .bucket: return "bucket"
        case .budget: return "budget"
        case .budgetAlertRule: return "budget-alert-rule"
        case .build: return "build"
        case .burnAlert: return "burn-alert"
        case .byokCredential: return "byok-credential"
        case .cacheRule: return "cache-rule"
        case .cachedContent: return "cached-content"
        case .capellaAllowedCidr: return "capella-allowed-cidr"
        case .capellaApiKey: return "capella-api-key"
        case .capellaAppService: return "capella-app-service"
        case .capellaBackup: return "capella-backup"
        case .capellaBucket: return "capella-bucket"
        case .capellaCluster: return "capella-cluster"
        case .capellaCollection: return "capella-collection"
        case .capellaDbCredential: return "capella-db-credential"
        case .capellaNetworkPeer: return "capella-network-peer"
        case .capellaPrivateEndpoint: return "capella-private-endpoint"
        case .capellaProject: return "capella-project"
        case .capellaReplication: return "capella-replication"
        case .capellaScope: return "capella-scope"
        case .capellaUser: return "capella-user"
        case .cdnEndpoint: return "cdn-endpoint"
        case .cerebrasBatch: return "cerebras-batch"
        case .cerebrasEndpoint: return "cerebras-endpoint"
        case .cerebrasFile: return "cerebras-file"
        case .cerebrasModel: return "cerebras-model"
        case .cerebrasModelVersion: return "cerebras-model-version"
        case .certificate: return "certificate"
        case .certificateAuthority: return "certificate-authority"
        case .chApiKey: return "ch-api-key"
        case .chBackup: return "ch-backup"
        case .chClickpipe: return "ch-clickpipe"
        case .chDatabase: return "ch-database"
        case .chMember: return "ch-member"
        case .chPostgres: return "ch-postgres"
        case .chService: return "ch-service"
        case .chain: return "chain"
        case .chart: return "chart"
        case .check: return "check"
        case .checkGroup: return "check-group"
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
        case .clusterSecret: return "cluster-secret"
        case .codeEngineApp: return "code-engine-app"
        case .codeEngineProject: return "code-engine-project"
        case .codebuildProject: return "codebuild-project"
        case .codepipelinePipeline: return "codepipeline-pipeline"
        case .codespace: return "codespace"
        case .cognitoUserPool: return "cognito-user-pool"
        case .cohort: return "cohort"
        case .collection: return "collection"
        case .collectionDocument: return "collection-document"
        case .column: return "column"
        case .compartment: return "compartment"
        case .composerEnvironment: return "composer-environment"
        case .computeConfig: return "compute-config"
        case .configStore: return "config-store"
        case .configVar: return "config-var"
        case .connection: return "connection"
        case .connectivityRule: return "connectivity-rule"
        case .connector: return "connector"
        case .consulAclPolicy: return "consul-acl-policy"
        case .consulAclRole: return "consul-acl-role"
        case .consulAclToken: return "consul-acl-token"
        case .consulCheck: return "consul-check"
        case .consulCluster: return "consul-cluster"
        case .consulConfigEntry: return "consul-config-entry"
        case .consulIntention: return "consul-intention"
        case .consulNamespace: return "consul-namespace"
        case .consulNode: return "consul-node"
        case .consulPartition: return "consul-partition"
        case .consulPeering: return "consul-peering"
        case .consulService: return "consul-service"
        case .consulSession: return "consul-session"
        case .contactPoint: return "contact-point"
        case .container: return "container"
        case .containerApp: return "container-app"
        case .containerRegistry: return "container-registry"
        case .containerRegistryAuth: return "container-registry-auth"
        case .containerRepository: return "container-repository"
        case .context: return "context"
        case .contextVariable: return "context-variable"
        case .convexAccessToken: return "convex-access-token"
        case .convexCustomDomain: return "convex-custom-domain"
        case .convexCustomRole: return "convex-custom-role"
        case .convexDefaultEnvVar: return "convex-default-env-var"
        case .convexDeployKey: return "convex-deploy-key"
        case .convexDeployment: return "convex-deployment"
        case .convexEnvVar: return "convex-env-var"
        case .convexInvite: return "convex-invite"
        case .convexLogStream: return "convex-log-stream"
        case .convexMember: return "convex-member"
        case .convexPreviewDeployKey: return "convex-preview-deploy-key"
        case .convexProject: return "convex-project"
        case .convexTeam: return "convex-team"
        case .convexUsageLimit: return "convex-usage-limit"
        case .copilotSeat: return "copilot-seat"
        case .corsRule: return "cors-rule"
        case .cosBucket: return "cos-bucket"
        case .costCenter: return "cost-center"
        case .crawler: return "crawler"
        case .crdbAllowlistEntry: return "crdb-allowlist-entry"
        case .crdbApiKey: return "crdb-api-key"
        case .crdbBackup: return "crdb-backup"
        case .crdbBlackoutWindow: return "crdb-blackout-window"
        case .crdbCluster: return "crdb-cluster"
        case .crdbDatabase: return "crdb-database"
        case .crdbEgressRule: return "crdb-egress-rule"
        case .crdbFolder: return "crdb-folder"
        case .crdbLogExport: return "crdb-log-export"
        case .crdbMetricExport: return "crdb-metric-export"
        case .crdbOrganization: return "crdb-organization"
        case .crdbRestore: return "crdb-restore"
        case .crdbServiceAccount: return "crdb-service-account"
        case .crdbSqlUser: return "crdb-sql-user"
        case .cronMonitor: return "cron-monitor"
        case .customDomain: return "custom-domain"
        case .customEnrichment: return "custom-enrichment"
        case .customHostname: return "custom-hostname"
        case .customTemplate: return "custom-template"
        case .customVoice: return "custom-voice"
        case .customer: return "customer"
        case .d1Database: return "d1-database"
        case .dashboard: return "dashboard"
        case .dashboardGroup: return "dashboard-group"
        case .database: return "database"
        case .databaseApiKey: return "database-api-key"
        case .databaseBackup: return "database-backup"
        case .databaseDb: return "database-db"
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
        case .dbaas: return "dbaas"
        case .dbaasDatabase: return "dbaas-database"
        case .dbaasUser: return "dbaas-user"
        case .dedicatedInference: return "dedicated-inference"
        case .deploy: return "deploy"
        case .deployKey: return "deploy-key"
        case .deployToken: return "deploy-token"
        case .deployedModel: return "deployed-model"
        case .deployment: return "deployment"
        case .deploymentVariable: return "deployment-variable"
        case .depotActionsRepo: return "depot-actions-repo"
        case .depotBuild: return "depot-build"
        case .depotProject: return "depot-project"
        case .depotRegistryImage: return "depot-registry-image"
        case .depotToken: return "depot-token"
        case .depotTrustPolicy: return "depot-trust-policy"
        case .derivedColumn: return "derived-column"
        case .detector: return "detector"
        case .device: return "device"
        case .dict: return "dict"
        case .dictionary: return "dictionary"
        case .directory: return "directory"
        case .directoryGroup: return "directory-group"
        case .directoryUser: return "directory-user"
        case .disk: return "disk"
        case .distributionCredential: return "distribution-credential"
        case .dnsDomain: return "dns-domain"
        case .dnsRecord: return "dns-record"
        case .dnsZone: return "dns-zone"
        case .dockerContainer: return "docker-container"
        case .dockerImage: return "docker-image"
        case .dockerNetwork: return "docker-network"
        case .dockerVolume: return "docker-volume"
        case .dockerhubAccessToken: return "dockerhub-access-token"
        case .dockerhubInvite: return "dockerhub-invite"
        case .dockerhubMember: return "dockerhub-member"
        case .dockerhubNamespace: return "dockerhub-namespace"
        case .dockerhubOrgAccessToken: return "dockerhub-org-access-token"
        case .dockerhubRepository: return "dockerhub-repository"
        case .dockerhubTag: return "dockerhub-tag"
        case .dockerhubTeam: return "dockerhub-team"
        case .documentdbCluster: return "documentdb-cluster"
        case .doksCluster: return "doks-cluster"
        case .domain: return "domain"
        case .domainRecord: return "domain-record"
        case .dopplerConfig: return "doppler-config"
        case .dopplerEnvironment: return "doppler-environment"
        case .dopplerGroup: return "doppler-group"
        case .dopplerIntegration: return "doppler-integration"
        case .dopplerProject: return "doppler-project"
        case .dopplerSecret: return "doppler-secret"
        case .dopplerServiceAccount: return "doppler-service-account"
        case .dopplerServiceAccountToken: return "doppler-service-account-token"
        case .dopplerServiceToken: return "doppler-service-token"
        case .dopplerSync: return "doppler-sync"
        case .dopplerUser: return "doppler-user"
        case .dopplerWebhook: return "doppler-webhook"
        case .dopplerWorkplace: return "doppler-workplace"
        case .downtime: return "downtime"
        case .dpoJob: return "dpo-job"
        case .dropRule: return "drop-rule"
        case .droplet: return "droplet"
        case .durableObjectNamespace: return "durable-object-namespace"
        case .dynamicSecret: return "dynamic-secret"
        case .dynamodbTable: return "dynamodb-table"
        case .dyno: return "dyno"
        case .ebsVolume: return "ebs-volume"
        case .ec2Instance: return "ec2-instance"
        case .ecrRepository: return "ecr-repository"
        case .ecsInstance: return "ecs-instance"
        case .ecsService: return "ecs-service"
        case .edgeRule: return "edge-rule"
        case .edgeScript: return "edge-script"
        case .efsFileSystem: return "efs-file-system"
        case .eip: return "eip"
        case .eksCluster: return "eks-cluster"
        case .elasticIp: return "elastic-ip"
        case .elasticacheCluster: return "elasticache-cluster"
        case .elasticacheServerlessCache: return "elasticache-serverless-cache"
        case .emailRoutingRule: return "email-routing-rule"
        case .embedJob: return "embed-job"
        case .encryptionKey: return "encryption-key"
        case .endpoint: return "endpoint"
        case .enrichment: return "enrichment"
        case .enterpriseConnection: return "enterprise-connection"
        case .envGroup: return "env-group"
        case .envGroupVar: return "env-group-var"
        case .envVar: return "env-var"
        case .environment: return "environment"
        case .escalationPolicy: return "escalation-policy"
        case .eval: return "eval"
        case .evaluation: return "evaluation"
        case .evaluationJob: return "evaluation-job"
        case .evaluator: return "evaluator"
        case .eventHook: return "event-hook"
        case .eventbridgeRule: return "eventbridge-rule"
        case .events2metrics: return "events2metrics"
        case .experiment: return "experiment"
        case .exportSink: return "export-sink"
        case .`extension`: return "extension"
        case .falApiKey: return "fal-api-key"
        case .falApp: return "fal-app"
        case .falComputeInstance: return "fal-compute-instance"
        case .falModel: return "fal-model"
        case .falWorkflow: return "fal-workflow"
        case .fcFunction: return "fc-function"
        case .featureFlag: return "feature-flag"
        case .field: return "field"
        case .file: return "file"
        case .fileSearchDocument: return "file-search-document"
        case .fileSearchStore: return "file-search-store"
        case .filesystem: return "filesystem"
        case .fineTune: return "fine-tune"
        case .fineTuningJob: return "fine-tuning-job"
        case .finetunedModel: return "finetuned-model"
        case .firestoreDatabase: return "firestore-database"
        case .firewall: return "firewall"
        case .firewallGroup: return "firewall-group"
        case .firewallRule: return "firewall-rule"
        case .firewallRuleset: return "firewall-ruleset"
        case .flexCluster: return "flex-cluster"
        case .flexibleIp: return "flexible-ip"
        case .flinkComputePool: return "flink-compute-pool"
        case .floatingIp: return "floating-ip"
        case .folder: return "folder"
        case .formation: return "formation"
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
        case .globalFirewall: return "global-firewall"
        case .glueDatabase: return "glue-database"
        case .gpuCluster: return "gpu-cluster"
        case .groqBatch: return "groq-batch"
        case .groqFile: return "groq-file"
        case .groqFineTuning: return "groq-fine-tuning"
        case .groqModel: return "groq-model"
        case .group: return "group"
        case .groupDeployToken: return "group-deploy-token"
        case .groupMember: return "group-member"
        case .groupVariable: return "group-variable"
        case .groupWebhook: return "group-webhook"
        case .guardrail: return "guardrail"
        case .hardware: return "hardware"
        case .healthCheck: return "health-check"
        case .healthcheck: return "healthcheck"
        case .heartbeat: return "heartbeat"
        case .heartbeatGroup: return "heartbeat-group"
        case .hfDataset: return "hf-dataset"
        case .hfInferenceEndpoint: return "hf-inference-endpoint"
        case .hfJob: return "hf-job"
        case .hfMemberToken: return "hf-member-token"
        case .hfModel: return "hf-model"
        case .hfProviderModel: return "hf-provider-model"
        case .hfScheduledJob: return "hf-scheduled-job"
        case .hfServiceAccount: return "hf-service-account"
        case .hfSpace: return "hf-space"
        case .hfWebhook: return "hf-webhook"
        case .historyItem: return "history-item"
        case .hogFunction: return "hog-function"
        case .host: return "host"
        case .hostedRunner: return "hosted-runner"
        case .hostname: return "hostname"
        case .hybridEnvironment: return "hybrid-environment"
        case .hyperdrive: return "hyperdrive"
        case .iamRole: return "iam-role"
        case .iamUser: return "iam-user"
        case .image: return "image"
        case .incident: return "incident"
        case .incidentIoAlertRoute: return "incident-io-alert-route"
        case .incidentIoAlertSource: return "incident-io-alert-source"
        case .incidentIoCatalogType: return "incident-io-catalog-type"
        case .incidentIoEscalation: return "incident-io-escalation"
        case .incidentIoEscalationPath: return "incident-io-escalation-path"
        case .incidentIoIncident: return "incident-io-incident"
        case .incidentIoMaintenanceWindow: return "incident-io-maintenance-window"
        case .incidentIoSchedule: return "incident-io-schedule"
        case .incidentIoSeverity: return "incident-io-severity"
        case .incidentIoStatus: return "incident-io-status"
        case .incidentIoStatusPage: return "incident-io-status-page"
        case .incidentIoTeam: return "incident-io-team"
        case .incidentIoUser: return "incident-io-user"
        case .incidentIoWorkflow: return "incident-io-workflow"
        case .index: return "index"
        case .inferenceBatch: return "inference-batch"
        case .influxBucket: return "influx-bucket"
        case .influxCheck: return "influx-check"
        case .influxDashboard: return "influx-dashboard"
        case .influxDedicatedDatabase: return "influx-dedicated-database"
        case .influxDedicatedToken: return "influx-dedicated-token"
        case .influxNotificationEndpoint: return "influx-notification-endpoint"
        case .influxNotificationRule: return "influx-notification-rule"
        case .influxOrg: return "influx-org"
        case .influxTask: return "influx-task"
        case .influxTelegraf: return "influx-telegraf"
        case .influxToken: return "influx-token"
        case .insight: return "insight"
        case .instance: return "instance"
        case .instanceGroup: return "instance-group"
        case .instancePool: return "instance-pool"
        case .instanceSnapshot: return "instance-snapshot"
        case .instanceTemplate: return "instance-template"
        case .instanceType: return "instance-type"
        case .integration: return "integration"
        case .internetGateway: return "internet-gateway"
        case .invitation: return "invitation"
        case .invite: return "invite"
        case .invoice: return "invoice"
        case .ipAccessEntry: return "ip-access-entry"
        case .ipAccessRule: return "ip-access-rule"
        case .ipAllocation: return "ip-allocation"
        case .issue: return "issue"
        case .jfrogAccessToken: return "jfrog-access-token"
        case .jfrogBuild: return "jfrog-build"
        case .jfrogBuildRun: return "jfrog-build-run"
        case .jfrogGroup: return "jfrog-group"
        case .jfrogPermission: return "jfrog-permission"
        case .jfrogPlatform: return "jfrog-platform"
        case .jfrogRepository: return "jfrog-repository"
        case .jfrogUser: return "jfrog-user"
        case .jfrogXrayPolicy: return "jfrog-xray-policy"
        case .jfrogXrayViolation: return "jfrog-xray-violation"
        case .jfrogXrayWatch: return "jfrog-xray-watch"
        case .job: return "job"
        case .jwtTemplate: return "jwt-template"
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
        case .keyValue: return "key-value"
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
        case .lifecycleRule: return "lifecycle-rule"
        case .linode: return "linode"
        case .liveSession: return "live-session"
        case .lkeCluster: return "lke-cluster"
        case .lkeNodePool: return "lke-node-pool"
        case .llmModel: return "llm-model"
        case .loadBalancer: return "load-balancer"
        case .logDrain: return "log-drain"
        case .logSink: return "log-sink"
        case .logStream: return "log-stream"
        case .loggingEndpoint: return "logging-endpoint"
        case .logpushJob: return "logpush-job"
        case .machine: return "machine"
        case .machineIdentity: return "machine-identity"
        case .mailgunAccount: return "mailgun-account"
        case .mailgunAccountWebhook: return "mailgun-account-webhook"
        case .mailgunApiKey: return "mailgun-api-key"
        case .mailgunDnsRecord: return "mailgun-dns-record"
        case .mailgunDomain: return "mailgun-domain"
        case .mailgunIp: return "mailgun-ip"
        case .mailgunIpPool: return "mailgun-ip-pool"
        case .mailgunMailingList: return "mailgun-mailing-list"
        case .mailgunRoute: return "mailgun-route"
        case .mailgunSmtpCredential: return "mailgun-smtp-credential"
        case .mailgunSubaccount: return "mailgun-subaccount"
        case .mailgunTag: return "mailgun-tag"
        case .mailgunWebhook: return "mailgun-webhook"
        case .maintenance: return "maintenance"
        case .maintenanceWindow: return "maintenance-window"
        case .managedDatabase: return "managed-database"
        case .managedDb: return "managed-db"
        case .managedEndpoint: return "managed-endpoint"
        case .managedKube: return "managed-kube"
        case .marker: return "marker"
        case .markerSetting: return "marker-setting"
        case .mediaAsset: return "media-asset"
        case .member: return "member"
        case .memcachedInstance: return "memcached-instance"
        case .memorystoreMemcached: return "memorystore-memcached"
        case .memorystoreRedis: return "memorystore-redis"
        case .memorystoreValkey: return "memorystore-valkey"
        case .messageBatch: return "message-batch"
        case .messagingService: return "messaging-service"
        case .minioServer: return "minio-server"
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
        case .module: return "module"
        case .mongodbDatabase: return "mongodb-database"
        case .monitor: return "monitor"
        case .monitorGroup: return "monitor-group"
        case .mqBroker: return "mq-broker"
        case .mskCluster: return "msk-cluster"
        case .mssqlDatabase: return "mssql-database"
        case .mutingRule: return "muting-rule"
        case .mysqlDatabase: return "mysql-database"
        case .namespace: return "namespace"
        case .natGateway: return "nat-gateway"
        case .natsAccount: return "nats-account"
        case .natsConnection: return "nats-connection"
        case .natsConsumer: return "nats-consumer"
        case .natsKvBucket: return "nats-kv-bucket"
        case .natsObjectStore: return "nats-object-store"
        case .natsPeer: return "nats-peer"
        case .natsServer: return "nats-server"
        case .natsStream: return "nats-stream"
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
        case .networkVolume: return "network-volume"
        case .networkZone: return "network-zone"
        case .nexusEndpoint: return "nexus-endpoint"
        case .nfAccount: return "nf-account"
        case .nfAddon: return "nf-addon"
        case .nfCluster: return "nf-cluster"
        case .nfDomain: return "nf-domain"
        case .nfJob: return "nf-job"
        case .nfPipeline: return "nf-pipeline"
        case .nfProject: return "nf-project"
        case .nfSecretGroup: return "nf-secret-group"
        case .nfService: return "nf-service"
        case .nfSubdomain: return "nf-subdomain"
        case .nfVolume: return "nf-volume"
        case .nfsShare: return "nfs-share"
        case .nlb: return "nlb"
        case .nodeGroup: return "node-group"
        case .nodePool: return "node-pool"
        case .nodebalancer: return "nodebalancer"
        case .nomadAclPolicy: return "nomad-acl-policy"
        case .nomadAclToken: return "nomad-acl-token"
        case .nomadAllocation: return "nomad-allocation"
        case .nomadCluster: return "nomad-cluster"
        case .nomadCsiPlugin: return "nomad-csi-plugin"
        case .nomadDeployment: return "nomad-deployment"
        case .nomadJob: return "nomad-job"
        case .nomadNamespace: return "nomad-namespace"
        case .nomadNode: return "nomad-node"
        case .nomadNodePool: return "nomad-node-pool"
        case .nomadService: return "nomad-service"
        case .nomadVariable: return "nomad-variable"
        case .nomadVolume: return "nomad-volume"
        case .notificationPolicy: return "notification-policy"
        case .notificationRule: return "notification-rule"
        case .notifier: return "notifier"
        case .oauthApplication: return "oauth-application"
        case .objectStorage: return "object-storage"
        case .objectStorageBucket: return "object-storage-bucket"
        case .objectStorageUser: return "object-storage-user"
        case .objectStore: return "object-store"
        case .objectStoreCredential: return "object-store-credential"
        case .octaviaLoadBalancer: return "octavia-load-balancer"
        case .okeCluster: return "oke-cluster"
        case .onCallCalendar: return "on-call-calendar"
        case .onlineArchive: return "online-archive"
        case .opensearchCluster: return "opensearch-cluster"
        case .opensearchDomain: return "opensearch-domain"
        case .org: return "org"
        case .orgToken: return "org-token"
        case .organization: return "organization"
        case .organizationApiKey: return "organization-api-key"
        case .organizationDomain: return "organization-domain"
        case .organizationMembership: return "organization-membership"
        case .organizationRole: return "organization-role"
        case .organizationUser: return "organization-user"
        case .osContainer: return "os-container"
        case .osDnsRecordset: return "os-dns-recordset"
        case .osDnsZone: return "os-dns-zone"
        case .osFlavor: return "os-flavor"
        case .osFloatingIp: return "os-floating-ip"
        case .osImage: return "os-image"
        case .osKeypair: return "os-keypair"
        case .osLbListener: return "os-lb-listener"
        case .osLbPool: return "os-lb-pool"
        case .osLoadbalancer: return "os-loadbalancer"
        case .osNetwork: return "os-network"
        case .osRouter: return "os-router"
        case .osSecurityGroup: return "os-security-group"
        case .osSecurityGroupRule: return "os-security-group-rule"
        case .osServer: return "os-server"
        case .osStack: return "os-stack"
        case .osSubnet: return "os-subnet"
        case .osVolume: return "os-volume"
        case .osVolumeBackup: return "os-volume-backup"
        case .osVolumeSnapshot: return "os-volume-snapshot"
        case .ossBucket: return "oss-bucket"
        case .outgoingWebhook: return "outgoing-webhook"
        case .package: return "package"
        case .pageRule: return "page-rule"
        case .pagerdutyBusinessService: return "pagerduty-business-service"
        case .pagerdutyEscalationPolicy: return "pagerduty-escalation-policy"
        case .pagerdutyEventOrchestration: return "pagerduty-event-orchestration"
        case .pagerdutyIncident: return "pagerduty-incident"
        case .pagerdutyMaintenanceWindow: return "pagerduty-maintenance-window"
        case .pagerdutySchedule: return "pagerduty-schedule"
        case .pagerdutyService: return "pagerduty-service"
        case .pagerdutyTeam: return "pagerduty-team"
        case .pagerdutyUser: return "pagerduty-user"
        case .parsingRuleGroup: return "parsing-rule-group"
        case .permission: return "permission"
        case .perplexityAgentModel: return "perplexity-agent-model"
        case .perplexityAsyncRequest: return "perplexity-async-request"
        case .perplexityRouterModel: return "perplexity-router-model"
        case .perplexitySkill: return "perplexity-skill"
        case .perplexitySonarModel: return "perplexity-sonar-model"
        case .pgDatabase: return "pg-database"
        case .pgSchema: return "pg-schema"
        case .phoneNumber: return "phone-number"
        case .pipeline: return "pipeline"
        case .pipelineCache: return "pipeline-cache"
        case .pipelineCoupling: return "pipeline-coupling"
        case .pipelineSchedule: return "pipeline-schedule"
        case .pipelineTemplate: return "pipeline-template"
        case .placementGroup: return "placement-group"
        case .playbook: return "playbook"
        case .pod: return "pod"
        case .policy: return "policy"
        case .policyGroup: return "policy-group"
        case .policyPack: return "policy-pack"
        case .policySet: return "policy-set"
        case .postgres: return "postgres"
        case .postgresCluster: return "postgres-cluster"
        case .postmarkDnsRecord: return "postmark-dns-record"
        case .postmarkDomain: return "postmark-domain"
        case .postmarkInboundRule: return "postmark-inbound-rule"
        case .postmarkMessageStream: return "postmark-message-stream"
        case .postmarkSenderSignature: return "postmark-sender-signature"
        case .postmarkServer: return "postmark-server"
        case .postmarkTemplate: return "postmark-template"
        case .postmarkWebhook: return "postmark-webhook"
        case .postureIntegration: return "posture-integration"
        case .prediction: return "prediction"
        case .primaryIp: return "primary-ip"
        case .privateEndpointService: return "private-endpoint-service"
        case .privateLocation: return "private-location"
        case .privateNetwork: return "private-network"
        case .problem: return "problem"
        case .processGroup: return "process-group"
        case .productEnvironment: return "product-environment"
        case .project: return "project"
        case .projectApiKey: return "project-api-key"
        case .projectDeployKey: return "project-deploy-key"
        case .projectMember: return "project-member"
        case .projectRateLimit: return "project-rate-limit"
        case .projectServiceAccount: return "project-service-account"
        case .projectUser: return "project-user"
        case .projectVariable: return "project-variable"
        case .projectWebhook: return "project-webhook"
        case .prometheusAlert: return "prometheus-alert"
        case .prometheusAlertmanager: return "prometheus-alertmanager"
        case .prometheusAmAlert: return "prometheus-am-alert"
        case .prometheusReceiver: return "prometheus-receiver"
        case .prometheusRule: return "prometheus-rule"
        case .prometheusRuleGroup: return "prometheus-rule-group"
        case .prometheusScrapePool: return "prometheus-scrape-pool"
        case .prometheusServer: return "prometheus-server"
        case .prometheusSilence: return "prometheus-silence"
        case .prometheusTarget: return "prometheus-target"
        case .pronunciationDict: return "pronunciation-dict"
        case .pronunciationDictionary: return "pronunciation-dictionary"
        case .protectedBranch: return "protected-branch"
        case .provider: return "provider"
        case .psBackup: return "ps-backup"
        case .psBranch: return "ps-branch"
        case .psDatabase: return "ps-database"
        case .psDeployRequest: return "ps-deploy-request"
        case .psPassword: return "ps-password"
        case .psRole: return "ps-role"
        case .psWebhook: return "ps-webhook"
        case .publicIp: return "public-ip"
        case .pubsubSubscription: return "pubsub-subscription"
        case .pubsubTopic: return "pubsub-topic"
        case .pullZone: return "pull-zone"
        case .purchase: return "purchase"
        case .pveBackup: return "pve-backup"
        case .pveBackupJob: return "pve-backup-job"
        case .pveCluster: return "pve-cluster"
        case .pveCt: return "pve-ct"
        case .pveFirewallAlias: return "pve-firewall-alias"
        case .pveFirewallRule: return "pve-firewall-rule"
        case .pveHaResource: return "pve-ha-resource"
        case .pveHaRule: return "pve-ha-rule"
        case .pveIpset: return "pve-ipset"
        case .pveNode: return "pve-node"
        case .pvePool: return "pve-pool"
        case .pveSecurityGroup: return "pve-security-group"
        case .pveStorage: return "pve-storage"
        case .pveVm: return "pve-vm"
        case .queue: return "queue"
        case .quota: return "quota"
        case .quotaRule: return "quota-rule"
        case .r2Bucket: return "r2-bucket"
        case .rabbitmqBinding: return "rabbitmq-binding"
        case .rabbitmqChannel: return "rabbitmq-channel"
        case .rabbitmqCluster: return "rabbitmq-cluster"
        case .rabbitmqConnection: return "rabbitmq-connection"
        case .rabbitmqExchange: return "rabbitmq-exchange"
        case .rabbitmqFederationUpstream: return "rabbitmq-federation-upstream"
        case .rabbitmqNode: return "rabbitmq-node"
        case .rabbitmqOperatorPolicy: return "rabbitmq-operator-policy"
        case .rabbitmqPermission: return "rabbitmq-permission"
        case .rabbitmqPolicy: return "rabbitmq-policy"
        case .rabbitmqQueue: return "rabbitmq-queue"
        case .rabbitmqShovel: return "rabbitmq-shovel"
        case .rabbitmqTopicPermission: return "rabbitmq-topic-permission"
        case .rabbitmqUser: return "rabbitmq-user"
        case .rabbitmqVhost: return "rabbitmq-vhost"
        case .ramUser: return "ram-user"
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
        case .recipient: return "recipient"
        case .recordingRule: return "recording-rule"
        case .redirectRule: return "redirect-rule"
        case .redirectUrl: return "redirect-url"
        case .redisInstance: return "redis-instance"
        case .redshiftCluster: return "redshift-cluster"
        case .registryModule: return "registry-module"
        case .registryNamespace: return "registry-namespace"
        case .registryProvider: return "registry-provider"
        case .reinforcementFineTuningJob: return "reinforcement-fine-tuning-job"
        case .release: return "release"
        case .replicationRule: return "replication-rule"
        case .repoBlocklist: return "repo-blocklist"
        case .repository: return "repository"
        case .repositoryVariable: return "repository-variable"
        case .repositoryWebhook: return "repository-webhook"
        case .resendAccount: return "resend-account"
        case .resendApiKey: return "resend-api-key"
        case .resendAutomation: return "resend-automation"
        case .resendBroadcast: return "resend-broadcast"
        case .resendContact: return "resend-contact"
        case .resendContactProperty: return "resend-contact-property"
        case .resendDnsRecord: return "resend-dns-record"
        case .resendDomain: return "resend-domain"
        case .resendEmail: return "resend-email"
        case .resendOauthGrant: return "resend-oauth-grant"
        case .resendSegment: return "resend-segment"
        case .resendSuppression: return "resend-suppression"
        case .resendTemplate: return "resend-template"
        case .resendTopic: return "resend-topic"
        case .resendWebhook: return "resend-webhook"
        case .reservation: return "reservation"
        case .reservedIp: return "reserved-ip"
        case .resourceGroup: return "resource-group"
        case .restoreJob: return "restore-job"
        case .reviewApp: return "review-app"
        case .role: return "role"
        case .rollupRule: return "rollup-rule"
        case .routeTable: return "route-table"
        case .route53HealthCheck: return "route53-health-check"
        case .route53HostedZone: return "route53-hosted-zone"
        case .route53RecordSet: return "route53-record-set"
        case .router: return "router"
        case .run: return "run"
        case .runTask: return "run-task"
        case .runner: return "runner"
        case .runnerResourceClass: return "runner-resource-class"
        case .s3Bucket: return "s3-bucket"
        case .sagemakerEndpoint: return "sagemaker-endpoint"
        case .sambanovaModel: return "sambanova-model"
        case .savedQuery: return "saved-query"
        case .schedule: return "schedule"
        case .scheduledFunction: return "scheduled-function"
        case .schemaRegistry: return "schema-registry"
        case .searchIndex: return "search-index"
        case .secret: return "secret"
        case .secretManagerSecret: return "secret-manager-secret"
        case .secretStore: return "secret-store"
        case .secretSync: return "secret-sync"
        case .secretsManagerSecret: return "secrets-manager-secret"
        case .secretsStoreSecret: return "secrets-store-secret"
        case .securityGroup: return "security-group"
        case .securityList: return "security-list"
        case .sendgridAccount: return "sendgrid-account"
        case .sendgridAlert: return "sendgrid-alert"
        case .sendgridApiKey: return "sendgrid-api-key"
        case .sendgridDnsRecord: return "sendgrid-dns-record"
        case .sendgridDomain: return "sendgrid-domain"
        case .sendgridEventWebhook: return "sendgrid-event-webhook"
        case .sendgridInboundParse: return "sendgrid-inbound-parse"
        case .sendgridIp: return "sendgrid-ip"
        case .sendgridIpPool: return "sendgrid-ip-pool"
        case .sendgridLinkBranding: return "sendgrid-link-branding"
        case .sendgridReverseDns: return "sendgrid-reverse-dns"
        case .sendgridSubuser: return "sendgrid-subuser"
        case .sendgridTemplate: return "sendgrid-template"
        case .sendgridUnsubscribeGroup: return "sendgrid-unsubscribe-group"
        case .sendgridVerifiedSender: return "sendgrid-verified-sender"
        case .sentimentJob: return "sentiment-job"
        case .server: return "server"
        case .serverlessContainer: return "serverless-container"
        case .serverlessEndpoint: return "serverless-endpoint"
        case .serverlessFunction: return "serverless-function"
        case .serverlessInstance: return "serverless-instance"
        case .serverlessTrafficFilter: return "serverless-traffic-filter"
        case .service: return "service"
        case .serviceAccount: return "service-account"
        case .serviceInstance: return "service-instance"
        case .serviceVersion: return "service-version"
        case .session: return "session"
        case .sharedDrive: return "shared-drive"
        case .sharedVariable: return "shared-variable"
        case .sharedVolume: return "shared-volume"
        case .signal: return "signal"
        case .skill: return "skill"
        case .sksCluster: return "sks-cluster"
        case .sksNodepool: return "sks-nodepool"
        case .slb: return "slb"
        case .slo: return "slo"
        case .snapshot: return "snapshot"
        case .sniEndpoint: return "sni-endpoint"
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
        case .source: return "source"
        case .sourceGroup: return "source-group"
        case .space: return "space"
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
        case .stackOutput: return "stack-output"
        case .stackPlugin: return "stack-plugin"
        case .stackscript: return "stackscript"
        case .starredQuery: return "starred-query"
        case .startupScript: return "startup-script"
        case .stateOutput: return "state-output"
        case .staticIp: return "static-ip"
        case .statusPage: return "status-page"
        case .statusPageResource: return "status-page-resource"
        case .statusPageSection: return "status-page-section"
        case .statusReport: return "status-report"
        case .stepFunction: return "step-function"
        case .storage: return "storage"
        case .storageBox: return "storage-box"
        case .storageZone: return "storage-zone"
        case .stripeAccount: return "stripe-account"
        case .stripeConnectedAccount: return "stripe-connected-account"
        case .stripeEventDestination: return "stripe-event-destination"
        case .stripeMeter: return "stripe-meter"
        case .stripePayout: return "stripe-payout"
        case .stripePrice: return "stripe-price"
        case .stripeProduct: return "stripe-product"
        case .stripeReportRun: return "stripe-report-run"
        case .stripeSigmaQueryRun: return "stripe-sigma-query-run"
        case .stripeWebhookEndpoint: return "stripe-webhook-endpoint"
        case .subAccount: return "sub-account"
        case .subaccount: return "subaccount"
        case .subnet: return "subnet"
        case .supabaseApiKey: return "supabase-api-key"
        case .supabaseAuth: return "supabase-auth"
        case .supabaseBackup: return "supabase-backup"
        case .supabaseBranch: return "supabase-branch"
        case .supabaseBucket: return "supabase-bucket"
        case .supabaseFunction: return "supabase-function"
        case .supabaseOrganization: return "supabase-organization"
        case .supabaseProject: return "supabase-project"
        case .supabaseReadReplica: return "supabase-read-replica"
        case .supabaseSecret: return "supabase-secret"
        case .supabaseSigningKey: return "supabase-signing-key"
        case .supabaseSsoProvider: return "supabase-sso-provider"
        case .supabaseThirdPartyAuth: return "supabase-third-party-auth"
        case .supervisedFineTuningJob: return "supervised-fine-tuning-job"
        case .syntheticCheck: return "synthetic-check"
        case .syntheticMonitor: return "synthetic-monitor"
        case .syntheticTest: return "synthetic-test"
        case .syntheticsTest: return "synthetics-test"
        case .tailnet: return "tailnet"
        case .targetGroup: return "target-group"
        case .tcoPolicy: return "tco-policy"
        case .tcpProxy: return "tcp-proxy"
        case .team: return "team"
        case .teamMember: return "team-member"
        case .telemetryAlert: return "telemetry-alert"
        case .template: return "template"
        case .tenancy: return "tenancy"
        case .tenant: return "tenant"
        case .test: return "test"
        case .testSuite: return "test-suite"
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
        case .trustedOrigin: return "trusted-origin"
        case .tsAllowList: return "ts-allow-list"
        case .tsBackup: return "ts-backup"
        case .tsExporter: return "ts-exporter"
        case .tsProject: return "ts-project"
        case .tsReadReplica: return "ts-read-replica"
        case .tsService: return "ts-service"
        case .tsVpc: return "ts-vpc"
        case .tsVpcPeering: return "ts-vpc-peering"
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
        case .upstashAccount: return "upstash-account"
        case .upstashQstash: return "upstash-qstash"
        case .upstashQstashQueue: return "upstash-qstash-queue"
        case .upstashQstashSchedule: return "upstash-qstash-schedule"
        case .upstashQstashUrlGroup: return "upstash-qstash-url-group"
        case .upstashRedis: return "upstash-redis"
        case .upstashSearch: return "upstash-search"
        case .upstashTeam: return "upstash-team"
        case .upstashVector: return "upstash-vector"
        case .uptimeCheck: return "uptime-check"
        case .uptimeMonitor: return "uptime-monitor"
        case .usageTrigger: return "usage-trigger"
        case .user: return "user"
        case .userInvite: return "user-invite"
        case .utApp: return "ut-app"
        case .utFile: return "ut-file"
        case .variable: return "variable"
        case .variableSet: return "variable-set"
        case .varsetVariable: return "varset-variable"
        case .vaultAuditDevice: return "vault-audit-device"
        case .vaultAuthMethod: return "vault-auth-method"
        case .vaultCluster: return "vault-cluster"
        case .vaultKvSecret: return "vault-kv-secret"
        case .vaultLease: return "vault-lease"
        case .vaultMount: return "vault-mount"
        case .vaultPkiCert: return "vault-pki-cert"
        case .vaultPkiRole: return "vault-pki-role"
        case .vaultPolicy: return "vault-policy"
        case .vaultToken: return "vault-token"
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
        case .videoLibrary: return "video-library"
        case .view: return "view"
        case .virtualField: return "virtual-field"
        case .vm: return "vm"
        case .vocabulary: return "vocabulary"
        case .voice: return "voice"
        case .voiceAgent: return "voice-agent"
        case .volume: return "volume"
        case .volumeSnapshot: return "volume-snapshot"
        case .voyageBatch: return "voyage-batch"
        case .voyageFile: return "voyage-file"
        case .voyageModel: return "voyage-model"
        case .vpc: return "vpc"
        case .vpcNatGateway: return "vpc-nat-gateway"
        case .vpcNetwork: return "vpc-network"
        case .vpcPeering: return "vpc-peering"
        case .vpcSubnet: return "vpc-subnet"
        case .vsphereCluster: return "vsphere-cluster"
        case .vsphereContentLibrary: return "vsphere-content-library"
        case .vsphereCustomizationSpec: return "vsphere-customization-spec"
        case .vsphereDatacenter: return "vsphere-datacenter"
        case .vsphereDatastore: return "vsphere-datastore"
        case .vsphereFolder: return "vsphere-folder"
        case .vsphereHost: return "vsphere-host"
        case .vsphereLibraryItem: return "vsphere-library-item"
        case .vsphereNetwork: return "vsphere-network"
        case .vsphereResourcePool: return "vsphere-resource-pool"
        case .vsphereTag: return "vsphere-tag"
        case .vsphereTagCategory: return "vsphere-tag-category"
        case .vsphereVcenter: return "vsphere-vcenter"
        case .vsphereVm: return "vsphere-vm"
        case .vswitch: return "vswitch"
        case .wafWebAcl: return "waf-web-acl"
        case .waitingRoom: return "waiting-room"
        case .webhook: return "webhook"
        case .webhookEndpoint: return "webhook-endpoint"
        case .webhookSubscription: return "webhook-subscription"
        case .worker: return "worker"
        case .workerPool: return "worker-pool"
        case .workerRoute: return "worker-route"
        case .workergroup: return "workergroup"
        case .workersAiModel: return "workers-ai-model"
        case .workflow: return "workflow"
        case .workload: return "workload"
        case .workspace: return "workspace"
        case .workspaceMember: return "workspace-member"
        case .workspaceVariable: return "workspace-variable"
        case .workspaceWebhook: return "workspace-webhook"
        case .xataApiKey: return "xata-api-key"
        case .xataBackup: return "xata-backup"
        case .xataBranch: return "xata-branch"
        case .xataInvitation: return "xata-invitation"
        case .xataMember: return "xata-member"
        case .xataOrganization: return "xata-organization"
        case .xataProject: return "xata-project"
        case .zone: return "zone"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [ResourceTypeId] = [
        .abTest,
        .accessApplication,
        .accessKey,
        .accessPolicy,
        .accessPolicyToken,
        .accessToken,
        .account,
        .ackCluster,
        .ackNodePool,
        .acmCertificate,
        .action,
        .actionsCache,
        .addOn,
        .adminApiKey,
        .agent,
        .agentApiKey,
        .agentConfig,
        .agentPool,
        .agentSession,
        .agentToken,
        .agentVariable,
        .aiGateway,
        .aiSearch,
        .aivenBillingGroup,
        .aivenConnectionPool,
        .aivenDatabase,
        .aivenIntegration,
        .aivenKafkaAcl,
        .aivenKafkaConnector,
        .aivenKafkaTopic,
        .aivenProject,
        .aivenSchemaSubject,
        .aivenService,
        .aivenServiceUser,
        .aivenVpc,
        .aivenVpcPeering,
        .alb,
        .alert,
        .alertChannel,
        .alertCondition,
        .alertConfiguration,
        .alertPolicy,
        .alertRule,
        .alertingProfile,
        .alias,
        .alignmentJob,
        .allowlistIdentifier,
        .alloydbCluster,
        .alloydbInstance,
        .analyticsEngineDataset,
        .annotation,
        .antiAffinityGroup,
        .api,
        .apiGateway,
        .apiKey,
        .apiToken,
        .apmApplication,
        .app,
        .appEngineService,
        .appSecret,
        .application,
        .applicationKey,
        .apprunnerService,
        .artifactRegistryRepo,
        .assistant,
        .astraAccessEntry,
        .astraCdc,
        .astraCollection,
        .astraDatabase,
        .astraKeyspace,
        .astraPcuGroup,
        .astraPrivateEndpoint,
        .astraRegion,
        .astraRole,
        .astraSnapshot,
        .astraStreamingTenant,
        .astraToken,
        .astraUser,
        .auditEvent,
        .authorizationServer,
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
        .backup,
        .backupPolicy,
        .backupRestore,
        .backupSchedule,
        .backupSnapshot,
        .backupVault,
        .balance,
        .bareMetal,
        .basinCatalog,
        .basinPipeline,
        .basinSink,
        .basinStream,
        .basinTable,
        .batch,
        .batchExport,
        .batchInferenceJob,
        .batchJobQueue,
        .bedrockModel,
        .bigqueryDataset,
        .bigqueryTable,
        .bigtableInstance,
        .billableMetric,
        .billingAccount,
        .billingGroup,
        .blockStorage,
        .blockStorageSnapshot,
        .blockVolume,
        .blocklistIdentifier,
        .blueprint,
        .board,
        .boardView,
        .bootVolume,
        .branchRestriction,
        .browserApplication,
        .bucket,
        .budget,
        .budgetAlertRule,
        .build,
        .burnAlert,
        .byokCredential,
        .cacheRule,
        .cachedContent,
        .capellaAllowedCidr,
        .capellaApiKey,
        .capellaAppService,
        .capellaBackup,
        .capellaBucket,
        .capellaCluster,
        .capellaCollection,
        .capellaDbCredential,
        .capellaNetworkPeer,
        .capellaPrivateEndpoint,
        .capellaProject,
        .capellaReplication,
        .capellaScope,
        .capellaUser,
        .cdnEndpoint,
        .cerebrasBatch,
        .cerebrasEndpoint,
        .cerebrasFile,
        .cerebrasModel,
        .cerebrasModelVersion,
        .certificate,
        .certificateAuthority,
        .chApiKey,
        .chBackup,
        .chClickpipe,
        .chDatabase,
        .chMember,
        .chPostgres,
        .chService,
        .chain,
        .chart,
        .check,
        .checkGroup,
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
        .clusterSecret,
        .codeEngineApp,
        .codeEngineProject,
        .codebuildProject,
        .codepipelinePipeline,
        .codespace,
        .cognitoUserPool,
        .cohort,
        .collection,
        .collectionDocument,
        .column,
        .compartment,
        .composerEnvironment,
        .computeConfig,
        .configStore,
        .configVar,
        .connection,
        .connectivityRule,
        .connector,
        .consulAclPolicy,
        .consulAclRole,
        .consulAclToken,
        .consulCheck,
        .consulCluster,
        .consulConfigEntry,
        .consulIntention,
        .consulNamespace,
        .consulNode,
        .consulPartition,
        .consulPeering,
        .consulService,
        .consulSession,
        .contactPoint,
        .container,
        .containerApp,
        .containerRegistry,
        .containerRegistryAuth,
        .containerRepository,
        .context,
        .contextVariable,
        .convexAccessToken,
        .convexCustomDomain,
        .convexCustomRole,
        .convexDefaultEnvVar,
        .convexDeployKey,
        .convexDeployment,
        .convexEnvVar,
        .convexInvite,
        .convexLogStream,
        .convexMember,
        .convexPreviewDeployKey,
        .convexProject,
        .convexTeam,
        .convexUsageLimit,
        .copilotSeat,
        .corsRule,
        .cosBucket,
        .costCenter,
        .crawler,
        .crdbAllowlistEntry,
        .crdbApiKey,
        .crdbBackup,
        .crdbBlackoutWindow,
        .crdbCluster,
        .crdbDatabase,
        .crdbEgressRule,
        .crdbFolder,
        .crdbLogExport,
        .crdbMetricExport,
        .crdbOrganization,
        .crdbRestore,
        .crdbServiceAccount,
        .crdbSqlUser,
        .cronMonitor,
        .customDomain,
        .customEnrichment,
        .customHostname,
        .customTemplate,
        .customVoice,
        .customer,
        .d1Database,
        .dashboard,
        .dashboardGroup,
        .database,
        .databaseApiKey,
        .databaseBackup,
        .databaseDb,
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
        .dbaas,
        .dbaasDatabase,
        .dbaasUser,
        .dedicatedInference,
        .deploy,
        .deployKey,
        .deployToken,
        .deployedModel,
        .deployment,
        .deploymentVariable,
        .depotActionsRepo,
        .depotBuild,
        .depotProject,
        .depotRegistryImage,
        .depotToken,
        .depotTrustPolicy,
        .derivedColumn,
        .detector,
        .device,
        .dict,
        .dictionary,
        .directory,
        .directoryGroup,
        .directoryUser,
        .disk,
        .distributionCredential,
        .dnsDomain,
        .dnsRecord,
        .dnsZone,
        .dockerContainer,
        .dockerImage,
        .dockerNetwork,
        .dockerVolume,
        .dockerhubAccessToken,
        .dockerhubInvite,
        .dockerhubMember,
        .dockerhubNamespace,
        .dockerhubOrgAccessToken,
        .dockerhubRepository,
        .dockerhubTag,
        .dockerhubTeam,
        .documentdbCluster,
        .doksCluster,
        .domain,
        .domainRecord,
        .dopplerConfig,
        .dopplerEnvironment,
        .dopplerGroup,
        .dopplerIntegration,
        .dopplerProject,
        .dopplerSecret,
        .dopplerServiceAccount,
        .dopplerServiceAccountToken,
        .dopplerServiceToken,
        .dopplerSync,
        .dopplerUser,
        .dopplerWebhook,
        .dopplerWorkplace,
        .downtime,
        .dpoJob,
        .dropRule,
        .droplet,
        .durableObjectNamespace,
        .dynamicSecret,
        .dynamodbTable,
        .dyno,
        .ebsVolume,
        .ec2Instance,
        .ecrRepository,
        .ecsInstance,
        .ecsService,
        .edgeRule,
        .edgeScript,
        .efsFileSystem,
        .eip,
        .eksCluster,
        .elasticIp,
        .elasticacheCluster,
        .elasticacheServerlessCache,
        .emailRoutingRule,
        .embedJob,
        .encryptionKey,
        .endpoint,
        .enrichment,
        .enterpriseConnection,
        .envGroup,
        .envGroupVar,
        .envVar,
        .environment,
        .escalationPolicy,
        .eval,
        .evaluation,
        .evaluationJob,
        .evaluator,
        .eventHook,
        .eventbridgeRule,
        .events2metrics,
        .experiment,
        .exportSink,
        .`extension`,
        .falApiKey,
        .falApp,
        .falComputeInstance,
        .falModel,
        .falWorkflow,
        .fcFunction,
        .featureFlag,
        .field,
        .file,
        .fileSearchDocument,
        .fileSearchStore,
        .filesystem,
        .fineTune,
        .fineTuningJob,
        .finetunedModel,
        .firestoreDatabase,
        .firewall,
        .firewallGroup,
        .firewallRule,
        .firewallRuleset,
        .flexCluster,
        .flexibleIp,
        .flinkComputePool,
        .floatingIp,
        .folder,
        .formation,
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
        .globalFirewall,
        .glueDatabase,
        .gpuCluster,
        .groqBatch,
        .groqFile,
        .groqFineTuning,
        .groqModel,
        .group,
        .groupDeployToken,
        .groupMember,
        .groupVariable,
        .groupWebhook,
        .guardrail,
        .hardware,
        .healthCheck,
        .healthcheck,
        .heartbeat,
        .heartbeatGroup,
        .hfDataset,
        .hfInferenceEndpoint,
        .hfJob,
        .hfMemberToken,
        .hfModel,
        .hfProviderModel,
        .hfScheduledJob,
        .hfServiceAccount,
        .hfSpace,
        .hfWebhook,
        .historyItem,
        .hogFunction,
        .host,
        .hostedRunner,
        .hostname,
        .hybridEnvironment,
        .hyperdrive,
        .iamRole,
        .iamUser,
        .image,
        .incident,
        .incidentIoAlertRoute,
        .incidentIoAlertSource,
        .incidentIoCatalogType,
        .incidentIoEscalation,
        .incidentIoEscalationPath,
        .incidentIoIncident,
        .incidentIoMaintenanceWindow,
        .incidentIoSchedule,
        .incidentIoSeverity,
        .incidentIoStatus,
        .incidentIoStatusPage,
        .incidentIoTeam,
        .incidentIoUser,
        .incidentIoWorkflow,
        .index,
        .inferenceBatch,
        .influxBucket,
        .influxCheck,
        .influxDashboard,
        .influxDedicatedDatabase,
        .influxDedicatedToken,
        .influxNotificationEndpoint,
        .influxNotificationRule,
        .influxOrg,
        .influxTask,
        .influxTelegraf,
        .influxToken,
        .insight,
        .instance,
        .instanceGroup,
        .instancePool,
        .instanceSnapshot,
        .instanceTemplate,
        .instanceType,
        .integration,
        .internetGateway,
        .invitation,
        .invite,
        .invoice,
        .ipAccessEntry,
        .ipAccessRule,
        .ipAllocation,
        .issue,
        .jfrogAccessToken,
        .jfrogBuild,
        .jfrogBuildRun,
        .jfrogGroup,
        .jfrogPermission,
        .jfrogPlatform,
        .jfrogRepository,
        .jfrogUser,
        .jfrogXrayPolicy,
        .jfrogXrayViolation,
        .jfrogXrayWatch,
        .job,
        .jwtTemplate,
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
        .keyValue,
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
        .lifecycleRule,
        .linode,
        .liveSession,
        .lkeCluster,
        .lkeNodePool,
        .llmModel,
        .loadBalancer,
        .logDrain,
        .logSink,
        .logStream,
        .loggingEndpoint,
        .logpushJob,
        .machine,
        .machineIdentity,
        .mailgunAccount,
        .mailgunAccountWebhook,
        .mailgunApiKey,
        .mailgunDnsRecord,
        .mailgunDomain,
        .mailgunIp,
        .mailgunIpPool,
        .mailgunMailingList,
        .mailgunRoute,
        .mailgunSmtpCredential,
        .mailgunSubaccount,
        .mailgunTag,
        .mailgunWebhook,
        .maintenance,
        .maintenanceWindow,
        .managedDatabase,
        .managedDb,
        .managedEndpoint,
        .managedKube,
        .marker,
        .markerSetting,
        .mediaAsset,
        .member,
        .memcachedInstance,
        .memorystoreMemcached,
        .memorystoreRedis,
        .memorystoreValkey,
        .messageBatch,
        .messagingService,
        .minioServer,
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
        .module,
        .mongodbDatabase,
        .monitor,
        .monitorGroup,
        .mqBroker,
        .mskCluster,
        .mssqlDatabase,
        .mutingRule,
        .mysqlDatabase,
        .namespace,
        .natGateway,
        .natsAccount,
        .natsConnection,
        .natsConsumer,
        .natsKvBucket,
        .natsObjectStore,
        .natsPeer,
        .natsServer,
        .natsStream,
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
        .networkVolume,
        .networkZone,
        .nexusEndpoint,
        .nfAccount,
        .nfAddon,
        .nfCluster,
        .nfDomain,
        .nfJob,
        .nfPipeline,
        .nfProject,
        .nfSecretGroup,
        .nfService,
        .nfSubdomain,
        .nfVolume,
        .nfsShare,
        .nlb,
        .nodeGroup,
        .nodePool,
        .nodebalancer,
        .nomadAclPolicy,
        .nomadAclToken,
        .nomadAllocation,
        .nomadCluster,
        .nomadCsiPlugin,
        .nomadDeployment,
        .nomadJob,
        .nomadNamespace,
        .nomadNode,
        .nomadNodePool,
        .nomadService,
        .nomadVariable,
        .nomadVolume,
        .notificationPolicy,
        .notificationRule,
        .notifier,
        .oauthApplication,
        .objectStorage,
        .objectStorageBucket,
        .objectStorageUser,
        .objectStore,
        .objectStoreCredential,
        .octaviaLoadBalancer,
        .okeCluster,
        .onCallCalendar,
        .onlineArchive,
        .opensearchCluster,
        .opensearchDomain,
        .org,
        .orgToken,
        .organization,
        .organizationApiKey,
        .organizationDomain,
        .organizationMembership,
        .organizationRole,
        .organizationUser,
        .osContainer,
        .osDnsRecordset,
        .osDnsZone,
        .osFlavor,
        .osFloatingIp,
        .osImage,
        .osKeypair,
        .osLbListener,
        .osLbPool,
        .osLoadbalancer,
        .osNetwork,
        .osRouter,
        .osSecurityGroup,
        .osSecurityGroupRule,
        .osServer,
        .osStack,
        .osSubnet,
        .osVolume,
        .osVolumeBackup,
        .osVolumeSnapshot,
        .ossBucket,
        .outgoingWebhook,
        .package,
        .pageRule,
        .pagerdutyBusinessService,
        .pagerdutyEscalationPolicy,
        .pagerdutyEventOrchestration,
        .pagerdutyIncident,
        .pagerdutyMaintenanceWindow,
        .pagerdutySchedule,
        .pagerdutyService,
        .pagerdutyTeam,
        .pagerdutyUser,
        .parsingRuleGroup,
        .permission,
        .perplexityAgentModel,
        .perplexityAsyncRequest,
        .perplexityRouterModel,
        .perplexitySkill,
        .perplexitySonarModel,
        .pgDatabase,
        .pgSchema,
        .phoneNumber,
        .pipeline,
        .pipelineCache,
        .pipelineCoupling,
        .pipelineSchedule,
        .pipelineTemplate,
        .placementGroup,
        .playbook,
        .pod,
        .policy,
        .policyGroup,
        .policyPack,
        .policySet,
        .postgres,
        .postgresCluster,
        .postmarkDnsRecord,
        .postmarkDomain,
        .postmarkInboundRule,
        .postmarkMessageStream,
        .postmarkSenderSignature,
        .postmarkServer,
        .postmarkTemplate,
        .postmarkWebhook,
        .postureIntegration,
        .prediction,
        .primaryIp,
        .privateEndpointService,
        .privateLocation,
        .privateNetwork,
        .problem,
        .processGroup,
        .productEnvironment,
        .project,
        .projectApiKey,
        .projectDeployKey,
        .projectMember,
        .projectRateLimit,
        .projectServiceAccount,
        .projectUser,
        .projectVariable,
        .projectWebhook,
        .prometheusAlert,
        .prometheusAlertmanager,
        .prometheusAmAlert,
        .prometheusReceiver,
        .prometheusRule,
        .prometheusRuleGroup,
        .prometheusScrapePool,
        .prometheusServer,
        .prometheusSilence,
        .prometheusTarget,
        .pronunciationDict,
        .pronunciationDictionary,
        .protectedBranch,
        .provider,
        .psBackup,
        .psBranch,
        .psDatabase,
        .psDeployRequest,
        .psPassword,
        .psRole,
        .psWebhook,
        .publicIp,
        .pubsubSubscription,
        .pubsubTopic,
        .pullZone,
        .purchase,
        .pveBackup,
        .pveBackupJob,
        .pveCluster,
        .pveCt,
        .pveFirewallAlias,
        .pveFirewallRule,
        .pveHaResource,
        .pveHaRule,
        .pveIpset,
        .pveNode,
        .pvePool,
        .pveSecurityGroup,
        .pveStorage,
        .pveVm,
        .queue,
        .quota,
        .quotaRule,
        .r2Bucket,
        .rabbitmqBinding,
        .rabbitmqChannel,
        .rabbitmqCluster,
        .rabbitmqConnection,
        .rabbitmqExchange,
        .rabbitmqFederationUpstream,
        .rabbitmqNode,
        .rabbitmqOperatorPolicy,
        .rabbitmqPermission,
        .rabbitmqPolicy,
        .rabbitmqQueue,
        .rabbitmqShovel,
        .rabbitmqTopicPermission,
        .rabbitmqUser,
        .rabbitmqVhost,
        .ramUser,
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
        .recipient,
        .recordingRule,
        .redirectRule,
        .redirectUrl,
        .redisInstance,
        .redshiftCluster,
        .registryModule,
        .registryNamespace,
        .registryProvider,
        .reinforcementFineTuningJob,
        .release,
        .replicationRule,
        .repoBlocklist,
        .repository,
        .repositoryVariable,
        .repositoryWebhook,
        .resendAccount,
        .resendApiKey,
        .resendAutomation,
        .resendBroadcast,
        .resendContact,
        .resendContactProperty,
        .resendDnsRecord,
        .resendDomain,
        .resendEmail,
        .resendOauthGrant,
        .resendSegment,
        .resendSuppression,
        .resendTemplate,
        .resendTopic,
        .resendWebhook,
        .reservation,
        .reservedIp,
        .resourceGroup,
        .restoreJob,
        .reviewApp,
        .role,
        .rollupRule,
        .routeTable,
        .route53HealthCheck,
        .route53HostedZone,
        .route53RecordSet,
        .router,
        .run,
        .runTask,
        .runner,
        .runnerResourceClass,
        .s3Bucket,
        .sagemakerEndpoint,
        .sambanovaModel,
        .savedQuery,
        .schedule,
        .scheduledFunction,
        .schemaRegistry,
        .searchIndex,
        .secret,
        .secretManagerSecret,
        .secretStore,
        .secretSync,
        .secretsManagerSecret,
        .secretsStoreSecret,
        .securityGroup,
        .securityList,
        .sendgridAccount,
        .sendgridAlert,
        .sendgridApiKey,
        .sendgridDnsRecord,
        .sendgridDomain,
        .sendgridEventWebhook,
        .sendgridInboundParse,
        .sendgridIp,
        .sendgridIpPool,
        .sendgridLinkBranding,
        .sendgridReverseDns,
        .sendgridSubuser,
        .sendgridTemplate,
        .sendgridUnsubscribeGroup,
        .sendgridVerifiedSender,
        .sentimentJob,
        .server,
        .serverlessContainer,
        .serverlessEndpoint,
        .serverlessFunction,
        .serverlessInstance,
        .serverlessTrafficFilter,
        .service,
        .serviceAccount,
        .serviceInstance,
        .serviceVersion,
        .session,
        .sharedDrive,
        .sharedVariable,
        .sharedVolume,
        .signal,
        .skill,
        .sksCluster,
        .sksNodepool,
        .slb,
        .slo,
        .snapshot,
        .sniEndpoint,
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
        .source,
        .sourceGroup,
        .space,
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
        .stackOutput,
        .stackPlugin,
        .stackscript,
        .starredQuery,
        .startupScript,
        .stateOutput,
        .staticIp,
        .statusPage,
        .statusPageResource,
        .statusPageSection,
        .statusReport,
        .stepFunction,
        .storage,
        .storageBox,
        .storageZone,
        .stripeAccount,
        .stripeConnectedAccount,
        .stripeEventDestination,
        .stripeMeter,
        .stripePayout,
        .stripePrice,
        .stripeProduct,
        .stripeReportRun,
        .stripeSigmaQueryRun,
        .stripeWebhookEndpoint,
        .subAccount,
        .subaccount,
        .subnet,
        .supabaseApiKey,
        .supabaseAuth,
        .supabaseBackup,
        .supabaseBranch,
        .supabaseBucket,
        .supabaseFunction,
        .supabaseOrganization,
        .supabaseProject,
        .supabaseReadReplica,
        .supabaseSecret,
        .supabaseSigningKey,
        .supabaseSsoProvider,
        .supabaseThirdPartyAuth,
        .supervisedFineTuningJob,
        .syntheticCheck,
        .syntheticMonitor,
        .syntheticTest,
        .syntheticsTest,
        .tailnet,
        .targetGroup,
        .tcoPolicy,
        .tcpProxy,
        .team,
        .teamMember,
        .telemetryAlert,
        .template,
        .tenancy,
        .tenant,
        .test,
        .testSuite,
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
        .trustedOrigin,
        .tsAllowList,
        .tsBackup,
        .tsExporter,
        .tsProject,
        .tsReadReplica,
        .tsService,
        .tsVpc,
        .tsVpcPeering,
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
        .upstashAccount,
        .upstashQstash,
        .upstashQstashQueue,
        .upstashQstashSchedule,
        .upstashQstashUrlGroup,
        .upstashRedis,
        .upstashSearch,
        .upstashTeam,
        .upstashVector,
        .uptimeCheck,
        .uptimeMonitor,
        .usageTrigger,
        .user,
        .userInvite,
        .utApp,
        .utFile,
        .variable,
        .variableSet,
        .varsetVariable,
        .vaultAuditDevice,
        .vaultAuthMethod,
        .vaultCluster,
        .vaultKvSecret,
        .vaultLease,
        .vaultMount,
        .vaultPkiCert,
        .vaultPkiRole,
        .vaultPolicy,
        .vaultToken,
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
        .videoLibrary,
        .view,
        .virtualField,
        .vm,
        .vocabulary,
        .voice,
        .voiceAgent,
        .volume,
        .volumeSnapshot,
        .voyageBatch,
        .voyageFile,
        .voyageModel,
        .vpc,
        .vpcNatGateway,
        .vpcNetwork,
        .vpcPeering,
        .vpcSubnet,
        .vsphereCluster,
        .vsphereContentLibrary,
        .vsphereCustomizationSpec,
        .vsphereDatacenter,
        .vsphereDatastore,
        .vsphereFolder,
        .vsphereHost,
        .vsphereLibraryItem,
        .vsphereNetwork,
        .vsphereResourcePool,
        .vsphereTag,
        .vsphereTagCategory,
        .vsphereVcenter,
        .vsphereVm,
        .vswitch,
        .wafWebAcl,
        .waitingRoom,
        .webhook,
        .webhookEndpoint,
        .webhookSubscription,
        .worker,
        .workerPool,
        .workerRoute,
        .workergroup,
        .workersAiModel,
        .workflow,
        .workload,
        .workspace,
        .workspaceMember,
        .workspaceVariable,
        .workspaceWebhook,
        .xataApiKey,
        .xataBackup,
        .xataBranch,
        .xataInvitation,
        .xataMember,
        .xataOrganization,
        .xataProject,
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
