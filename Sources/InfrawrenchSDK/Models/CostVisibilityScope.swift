/*
 * InfrawrenchSDK v1.71.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.71.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostVisibilityScope: Codable, Hashable, Sendable {
    public var id: String
    public var principalKind: CostVisibilityPrincipalKind
    /// Role id, member user id, or API key id.
    public var principalId: String
    /// Role name, member email or key name; null when the principal no longer
    /// exists.
    public var principalLabel: String?
    public var costCentreIds: [String]
    public var accountIds: [String]
    public var savedFilterId: String?
    public var createdAt: String
    public var updatedAt: String

    public init(
        id: String,
        principalKind: CostVisibilityPrincipalKind,
        principalId: String,
        principalLabel: String? = nil,
        costCentreIds: [String],
        accountIds: [String],
        savedFilterId: String? = nil,
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
        self.principalKind = principalKind
        self.principalId = principalId
        self.principalLabel = principalLabel
        self.costCentreIds = costCentreIds
        self.accountIds = accountIds
        self.savedFilterId = savedFilterId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
