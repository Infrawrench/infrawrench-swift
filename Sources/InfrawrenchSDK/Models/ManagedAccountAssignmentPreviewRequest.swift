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

/// The period whose spend is previewed defaults to the last full calendar month.
public struct ManagedAccountAssignmentPreviewRequest: Codable, Hashable, Sendable {
    /// The customer to assign to, or null to take the items off every customer.
    public var managedAccountId: String?
    public var costCentreIds: [String]?
    public var accountIds: [String]?
    public var periodFrom: String?
    public var periodTo: String?

    public init(
        managedAccountId: String? = nil,
        costCentreIds: [String]? = nil,
        accountIds: [String]? = nil,
        periodFrom: String? = nil,
        periodTo: String? = nil
    ) {
        self.managedAccountId = managedAccountId
        self.costCentreIds = costCentreIds
        self.accountIds = accountIds
        self.periodFrom = periodFrom
        self.periodTo = periodTo
    }
}
