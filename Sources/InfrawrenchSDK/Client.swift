/*
 * InfrawrenchSDK v0.11.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.11.0).
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
    /// `client.accounts`
    public let accounts: AccountsNamespace
    /// `client.agents`
    public let agents: AgentsNamespace
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
    /// `client.bastions`
    public let bastions: BastionsNamespace
    /// `client.billing`
    public let billing: BillingNamespace
    /// `client.budgets`
    public let budgets: BudgetsNamespace
    /// `client.connect`
    public let connect: ConnectNamespace
    /// `client.costs`
    public let costs: CostsNamespace
    /// `client.dashboards`
    public let dashboards: DashboardsNamespace
    /// `client.deployments`
    public let deployments: DeploymentsNamespace
    /// `client.docker`
    public let docker: DockerNamespace
    /// `client.invitations`
    public let invitations: InvitationsNamespace
    /// `client.kv`
    public let kv: KvNamespace
    /// `client.msteams`
    public let msteams: MsteamsNamespace
    /// `client.orgs`
    public let orgs: OrgsNamespace
    /// `client.pages`
    public let pages: PagesNamespace
    /// `client.profile`
    public let profile: ProfileNamespace
    /// `client.resources`
    public let resources: ResourcesNamespace
    /// `client.search`
    public let search: SearchNamespace
    /// `client.sftp`
    public let sftp: SftpNamespace
    /// `client.slack`
    public let slack: SlackNamespace
    /// `client.sql`
    public let sql: SqlNamespace
    /// `client.sshKeys`
    public let sshKeys: SshKeysNamespace
    /// `client.sshTunnels`
    public let sshTunnels: SshTunnelsNamespace
    /// `client.storage`
    public let storage: StorageNamespace
    /// `client.team`
    public let team: TeamNamespace

    public init(_ options: ClientOptions = ClientOptions()) {
        let transport = ApiTransport(options: options)
        self.transport = transport
        self.accounts = AccountsNamespace(transport: transport)
        self.agents = AgentsNamespace(transport: transport)
        self.apiKeys = ApiKeysNamespace(transport: transport)
        self.artifacts = ArtifactsNamespace(transport: transport)
        self.associations = AssociationsNamespace(transport: transport)
        self.auditLogs = AuditLogsNamespace(transport: transport)
        self.auth = AuthNamespace(transport: transport)
        self.bastions = BastionsNamespace(transport: transport)
        self.billing = BillingNamespace(transport: transport)
        self.budgets = BudgetsNamespace(transport: transport)
        self.connect = ConnectNamespace(transport: transport)
        self.costs = CostsNamespace(transport: transport)
        self.dashboards = DashboardsNamespace(transport: transport)
        self.deployments = DeploymentsNamespace(transport: transport)
        self.docker = DockerNamespace(transport: transport)
        self.invitations = InvitationsNamespace(transport: transport)
        self.kv = KvNamespace(transport: transport)
        self.msteams = MsteamsNamespace(transport: transport)
        self.orgs = OrgsNamespace(transport: transport)
        self.pages = PagesNamespace(transport: transport)
        self.profile = ProfileNamespace(transport: transport)
        self.resources = ResourcesNamespace(transport: transport)
        self.search = SearchNamespace(transport: transport)
        self.sftp = SftpNamespace(transport: transport)
        self.slack = SlackNamespace(transport: transport)
        self.sql = SqlNamespace(transport: transport)
        self.sshKeys = SshKeysNamespace(transport: transport)
        self.sshTunnels = SshTunnelsNamespace(transport: transport)
        self.storage = StorageNamespace(transport: transport)
        self.team = TeamNamespace(transport: transport)
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
