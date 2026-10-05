/*
 * InfrawrenchSDK v1.57.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.57.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostVisibilitySource: Codable, Hashable, Sendable {
    public var kind: CostVisibilityPrincipalKind
    public var label: String?
    public var costCentreIds: [String]
    public var accountIds: [String]
    public var savedFilterId: String?

    public init(
        kind: CostVisibilityPrincipalKind,
        label: String? = nil,
        costCentreIds: [String],
        accountIds: [String],
        savedFilterId: String? = nil
    ) {
        self.kind = kind
        self.label = label
        self.costCentreIds = costCentreIds
        self.accountIds = accountIds
        self.savedFilterId = savedFilterId
    }
}
