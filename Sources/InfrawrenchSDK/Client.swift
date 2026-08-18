/*
 * InfrawrenchSDK v1.29.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.29.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// A client for the Infrawrench API.
///
/// ```swift
/// let client = APIV1Client(apiKey: apiKey, orgId: orgId)
/// let accounts = try await client.accounts.list()
/// ```
///
/// Calls mirror the URL structure, so `POST /api/org/{orgId}/accounts/{id}/sync` is
/// `client.accounts.sync(id:)`. The `orgId` given here fills itself in on every
/// org-scoped call; pass one to a single call to override it.
public final class APIV1Client: Sendable {
    /// Shared request plumbing. Reach for it only to inspect the resolved base URL.
    public let transport: ApiTransport
    /// `client.accessRequests`
    public let accessRequests: AccessRequestsNamespace
    /// `client.accessReview`
    public let accessReview: AccessReviewNamespace
    /// `client.accounts`
    public let accounts: AccountsNamespace
    /// `client.agent`
    public let agent: AgentNamespace
    /// `client.agentRegistrations`
    public let agentRegistrations: AgentRegistrationsNamespace
    /// `client.agents`
    public let agents: AgentsNamespace
    /// `client.alertRules`
    public let alertRules: AlertRulesNamespace
    /// `client.apiKeys`
    public let apiKeys: ApiKeysNamespace
    /// `client.artifacts`
    public let artifacts: ArtifactsNamespace
    /// `client.associations`
    public let associations: AssociationsNamespace
    /// `client.auditLogs`
    public let auditLogs: AuditLogsNamespace
    /// `client.auth`
    public let auth: AuthNamespace
    /// `client.backups`
    public let backups: BackupsNamespace
    /// `client.bastions`
    public let bastions: BastionsNamespace
    /// `client.billing`
    public let billing: BillingNamespace
    /// `client.billingRules`
    public let billingRules: BillingRulesNamespace
    /// `client.blastRadius`
    public let blastRadius: BlastRadiusNamespace
    /// `client.budgets`
    public let budgets: BudgetsNamespace
    /// `client.businessMetrics`
    public let businessMetrics: BusinessMetricsNamespace
    /// `client.calendar`
    public let calendar: CalendarNamespace
    /// `client.changeFreezes`
    public let changeFreezes: ChangeFreezesNamespace
    /// `client.changes`
    public let changes: ChangesNamespace
    /// `client.chat`
    public let chat: ChatNamespace
    /// `client.commitments`
    public let commitments: CommitmentsNamespace
    /// `client.config`
    public let config: ConfigNamespace
    /// `client.connect`
    public let connect: ConnectNamespace
    /// `client.costAlerts`
    public let costAlerts: CostAlertsNamespace
    /// `client.costAnnotations`
    public let costAnnotations: CostAnnotationsNamespace
    /// `client.costCentres`
    public let costCentres: CostCentresNamespace
    /// `client.costExports`
    public let costExports: CostExportsNamespace
    /// `client.costReportFolders`
    public let costReportFolders: CostReportFoldersNamespace
    /// `client.costReportNotifications`
    public let costReportNotifications: CostReportNotificationsNamespace
    /// `client.costReports`
    public let costReports: CostReportsNamespace
    /// `client.costScenarios`
    public let costScenarios: CostScenariosNamespace
    /// `client.costs`
    public let costs: CostsNamespace
    /// `client.credentialHygiene`
    public let credentialHygiene: CredentialHygieneNamespace
    /// `client.credits`
    public let credits: CreditsNamespace
    /// `client.currency`
    public let currency: CurrencyNamespace
    /// `client.customGraphs`
    public let customGraphs: CustomGraphsNamespace
    /// `client.dashboards`
    public let dashboards: DashboardsNamespace
    /// `client.dependencyGraph`
    public let dependencyGraph: DependencyGraphNamespace
    /// `client.deployments`
    public let deployments: DeploymentsNamespace
    /// `client.digest`
    public let digest: DigestNamespace
    /// `client.dns`
    public let dns: DnsNamespace
    /// `client.docker`
    public let docker: DockerNamespace
    /// `client.environmentDiff`
    public let environmentDiff: EnvironmentDiffNamespace
    /// `client.environments`
    public let environments: EnvironmentsNamespace
    /// `client.expiring`
    public let expiring: ExpiringNamespace
    /// `client.iac`
    public let iac: IacNamespace
    /// `client.incidents`
    public let incidents: IncidentsNamespace
    /// `client.invitations`
    public let invitations: InvitationsNamespace
    /// `client.invoices`
    public let invoices: InvoicesNamespace
    /// `client.jira`
    public let jira: JiraNamespace
    /// `client.kv`
    public let kv: KvNamespace
    /// `client.leases`
    public let leases: LeasesNamespace
    /// `client.linear`
    public let linear: LinearNamespace
    /// `client.logWorkspaces`
    public let logWorkspaces: LogWorkspacesNamespace
    /// `client.managedAccounts`
    public let managedAccounts: ManagedAccountsNamespace
    /// `client.metricAlerts`
    public let metricAlerts: MetricAlertsNamespace
    /// `client.moment`
    public let moment: MomentNamespace
    /// `client.msteams`
    public let msteams: MsteamsNamespace
    /// `client.networkFlows`
    public let networkFlows: NetworkFlowsNamespace
    /// `client.orgs`
    public let orgs: OrgsNamespace
    /// `client.orphans`
    public let orphans: OrphansNamespace
    /// `client.ownership`
    public let ownership: OwnershipNamespace
    /// `client.pages`
    public let pages: PagesNamespace
    /// `client.posture`
    public let posture: PostureNamespace
    /// `client.probes`
    public let probes: ProbesNamespace
    /// `client.profile`
    public let profile: ProfileNamespace
    /// `client.quotas`
    public let quotas: QuotasNamespace
    /// `client.resources`
    public let resources: ResourcesNamespace
    /// `client.rightsizing`
    public let rightsizing: RightsizingNamespace
    /// `client.savedCostFilters`
    public let savedCostFilters: SavedCostFiltersNamespace
    /// `client.schedules`
    public let schedules: SchedulesNamespace
    /// `client.search`
    public let search: SearchNamespace
    /// `client.sessionRecordings`
    public let sessionRecordings: SessionRecordingsNamespace
    /// `client.sftp`
    public let sftp: SftpNamespace
    /// `client.sharedConsoles`
    public let sharedConsoles: SharedConsolesNamespace
    /// `client.slack`
    public let slack: SlackNamespace
    /// `client.sql`
    public let sql: SqlNamespace
    /// `client.sshFanout`
    public let sshFanout: SshFanoutNamespace
    /// `client.sshKeys`
    public let sshKeys: SshKeysNamespace
    /// `client.sshTunnels`
    public let sshTunnels: SshTunnelsNamespace
    /// `client.status`
    public let status: StatusNamespace
    /// `client.statusIncidents`
    public let statusIncidents: StatusIncidentsNamespace
    /// `client.statusPages`
    public let statusPages: StatusPagesNamespace
    /// `client.storage`
    public let storage: StorageNamespace
    /// `client.tagPolicy`
    public let tagPolicy: TagPolicyNamespace
    /// `client.team`
    public let team: TeamNamespace
    /// `client.wallboard`
    public let wallboard: WallboardNamespace
    /// `client.workflowApprovals`
    public let workflowApprovals: WorkflowApprovalsNamespace
    /// `client.workflowSecrets`
    public let workflowSecrets: WorkflowSecretsNamespace
    /// `client.workflows`
    public let workflows: WorkflowsNamespace

    public init(_ options: ClientOptions = ClientOptions()) {
        let transport = ApiTransport(options: options)
        self.transport = transport
        self.accessRequests = AccessRequestsNamespace(transport: transport)
        self.accessReview = AccessReviewNamespace(transport: transport)
        self.accounts = AccountsNamespace(transport: transport)
        self.agent = AgentNamespace(transport: transport)
        self.agentRegistrations = AgentRegistrationsNamespace(transport: transport)
        self.agents = AgentsNamespace(transport: transport)
        self.alertRules = AlertRulesNamespace(transport: transport)
        self.apiKeys = ApiKeysNamespace(transport: transport)
        self.artifacts = ArtifactsNamespace(transport: transport)
        self.associations = AssociationsNamespace(transport: transport)
        self.auditLogs = AuditLogsNamespace(transport: transport)
        self.auth = AuthNamespace(transport: transport)
        self.backups = BackupsNamespace(transport: transport)
        self.bastions = BastionsNamespace(transport: transport)
        self.billing = BillingNamespace(transport: transport)
        self.billingRules = BillingRulesNamespace(transport: transport)
        self.blastRadius = BlastRadiusNamespace(transport: transport)
        self.budgets = BudgetsNamespace(transport: transport)
        self.businessMetrics = BusinessMetricsNamespace(transport: transport)
        self.calendar = CalendarNamespace(transport: transport)
        self.changeFreezes = ChangeFreezesNamespace(transport: transport)
        self.changes = ChangesNamespace(transport: transport)
        self.chat = ChatNamespace(transport: transport)
        self.commitments = CommitmentsNamespace(transport: transport)
        self.config = ConfigNamespace(transport: transport)
        self.connect = ConnectNamespace(transport: transport)
        self.costAlerts = CostAlertsNamespace(transport: transport)
        self.costAnnotations = CostAnnotationsNamespace(transport: transport)
        self.costCentres = CostCentresNamespace(transport: transport)
        self.costExports = CostExportsNamespace(transport: transport)
        self.costReportFolders = CostReportFoldersNamespace(transport: transport)
        self.costReportNotifications = CostReportNotificationsNamespace(transport: transport)
        self.costReports = CostReportsNamespace(transport: transport)
        self.costScenarios = CostScenariosNamespace(transport: transport)
        self.costs = CostsNamespace(transport: transport)
        self.credentialHygiene = CredentialHygieneNamespace(transport: transport)
        self.credits = CreditsNamespace(transport: transport)
        self.currency = CurrencyNamespace(transport: transport)
        self.customGraphs = CustomGraphsNamespace(transport: transport)
        self.dashboards = DashboardsNamespace(transport: transport)
        self.dependencyGraph = DependencyGraphNamespace(transport: transport)
        self.deployments = DeploymentsNamespace(transport: transport)
        self.digest = DigestNamespace(transport: transport)
        self.dns = DnsNamespace(transport: transport)
        self.docker = DockerNamespace(transport: transport)
        self.environmentDiff = EnvironmentDiffNamespace(transport: transport)
        self.environments = EnvironmentsNamespace(transport: transport)
        self.expiring = ExpiringNamespace(transport: transport)
        self.iac = IacNamespace(transport: transport)
        self.incidents = IncidentsNamespace(transport: transport)
        self.invitations = InvitationsNamespace(transport: transport)
        self.invoices = InvoicesNamespace(transport: transport)
        self.jira = JiraNamespace(transport: transport)
        self.kv = KvNamespace(transport: transport)
        self.leases = LeasesNamespace(transport: transport)
        self.linear = LinearNamespace(transport: transport)
        self.logWorkspaces = LogWorkspacesNamespace(transport: transport)
        self.managedAccounts = ManagedAccountsNamespace(transport: transport)
        self.metricAlerts = MetricAlertsNamespace(transport: transport)
        self.moment = MomentNamespace(transport: transport)
        self.msteams = MsteamsNamespace(transport: transport)
        self.networkFlows = NetworkFlowsNamespace(transport: transport)
        self.orgs = OrgsNamespace(transport: transport)
        self.orphans = OrphansNamespace(transport: transport)
        self.ownership = OwnershipNamespace(transport: transport)
        self.pages = PagesNamespace(transport: transport)
        self.posture = PostureNamespace(transport: transport)
        self.probes = ProbesNamespace(transport: transport)
        self.profile = ProfileNamespace(transport: transport)
        self.quotas = QuotasNamespace(transport: transport)
        self.resources = ResourcesNamespace(transport: transport)
        self.rightsizing = RightsizingNamespace(transport: transport)
        self.savedCostFilters = SavedCostFiltersNamespace(transport: transport)
        self.schedules = SchedulesNamespace(transport: transport)
        self.search = SearchNamespace(transport: transport)
        self.sessionRecordings = SessionRecordingsNamespace(transport: transport)
        self.sftp = SftpNamespace(transport: transport)
        self.sharedConsoles = SharedConsolesNamespace(transport: transport)
        self.slack = SlackNamespace(transport: transport)
        self.sql = SqlNamespace(transport: transport)
        self.sshFanout = SshFanoutNamespace(transport: transport)
        self.sshKeys = SshKeysNamespace(transport: transport)
        self.sshTunnels = SshTunnelsNamespace(transport: transport)
        self.status = StatusNamespace(transport: transport)
        self.statusIncidents = StatusIncidentsNamespace(transport: transport)
        self.statusPages = StatusPagesNamespace(transport: transport)
        self.storage = StorageNamespace(transport: transport)
        self.tagPolicy = TagPolicyNamespace(transport: transport)
        self.team = TeamNamespace(transport: transport)
        self.wallboard = WallboardNamespace(transport: transport)
        self.workflowApprovals = WorkflowApprovalsNamespace(transport: transport)
        self.workflowSecrets = WorkflowSecretsNamespace(transport: transport)
        self.workflows = WorkflowsNamespace(transport: transport)
    }

    /// The common case, without spelling out `ClientOptions`.
    public convenience init(
        apiKey: String? = nil,
        orgId: String? = nil,
        baseURL: String = InfrawrenchSDKInfo.defaultBaseURL
    ) {
        self.init(ClientOptions(baseURL: baseURL, apiKey: apiKey, orgId: orgId))
    }
}
