/*
 * InfrawrenchSDK v1.56.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.56.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostVisibilityScopeInput: Codable, Hashable, Sendable {
    public var principalKind: CostVisibilityPrincipalKind
    public var principalId: String
    /// Rows the allocation rules assign to these cost centres (or their
    /// children).
    public var costCentreIds: [String]
    /// Rows on these connected accounts.
    public var accountIds: [String]
    /// A saved filter ANDed onto the scope. With no centres and no accounts it
    /// decides alone; a scope with nothing at all matches no rows.
    public var savedFilterId: String?

    public init(
        principalKind: CostVisibilityPrincipalKind,
        principalId: String,
        costCentreIds: [String],
        accountIds: [String],
        savedFilterId: String? = nil
    ) {
        self.principalKind = principalKind
        self.principalId = principalId
        self.costCentreIds = costCentreIds
        self.accountIds = accountIds
        self.savedFilterId = savedFilterId
    }
}
