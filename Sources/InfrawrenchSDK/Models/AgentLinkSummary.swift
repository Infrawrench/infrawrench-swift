/*
 * InfrawrenchSDK v1.84.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.84.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AgentLinkSummary: Codable, Hashable, Sendable {
    public struct ApprovedBy: Codable, Hashable, Sendable {
        public var email: String

        public init(
            email: String
        ) {
            self.email = email
        }
    }

    public var id: String
    public var organizationId: String
    public var organizationName: String
    public var platform: String
    public var label: String
    /// The ceiling as approved.
    public var scopes: [String]
    /// The ceiling as it stands now: approved ∩ the approver's current role (no
    /// elevation) − permissions no agent may hold. Agents can only be granted
    /// scopes from here.
    public var effectiveScopes: [String]
    /// The scopes in `effectiveScopes` that `providers` can limit (resources,
    /// secrets, object storage). An agent given `providers` may hold only these;
    /// any other scope is a `scope_not_allowed`, because it would stay
    /// organization-wide.
    public var narrowableScopes: [String]
    /// `effectiveScopes` grouped and labelled as the Infrawrench pickers show
    /// them.
    public var scopeGroups: [AgentLinkScopeGroup]
    /// Plugins the organization has at least one connected account for.
    public var providers: [AgentLinkProvider]
    public var approvedBy: ApprovedBy?
    public var createdAt: String
    public var credentialPrefix: String?
    public var lastSeenAt: String?
    public var revokedAt: String?

    public init(
        id: String,
        organizationId: String,
        organizationName: String,
        platform: String,
        label: String,
        scopes: [String],
        effectiveScopes: [String],
        narrowableScopes: [String],
        scopeGroups: [AgentLinkScopeGroup],
        providers: [AgentLinkProvider],
        approvedBy: ApprovedBy? = nil,
        createdAt: String,
        credentialPrefix: String? = nil,
        lastSeenAt: String? = nil,
        revokedAt: String? = nil
    ) {
        self.id = id
        self.organizationId = organizationId
        self.organizationName = organizationName
        self.platform = platform
        self.label = label
        self.scopes = scopes
        self.effectiveScopes = effectiveScopes
        self.narrowableScopes = narrowableScopes
        self.scopeGroups = scopeGroups
        self.providers = providers
        self.approvedBy = approvedBy
        self.createdAt = createdAt
        self.credentialPrefix = credentialPrefix
        self.lastSeenAt = lastSeenAt
        self.revokedAt = revokedAt
    }
}
