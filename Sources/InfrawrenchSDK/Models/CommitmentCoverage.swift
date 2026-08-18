/*
 * InfrawrenchSDK v1.31.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.31.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CommitmentCoverage: Codable, Hashable, Sendable {
    /// False when every in-scope account was excluded — 'we cannot tell' reported
    /// as unavailable, never as 0%.
    public var available: Bool
    public var currencies: [CommitmentCoverageCurrency]
    /// Accounts whose plugin cannot tell usage from other charge types; their
    /// rows would drag coverage down for reasons unrelated to purchasing.
    public var excludedAccountIds: [String]

    public init(
        available: Bool,
        currencies: [CommitmentCoverageCurrency],
        excludedAccountIds: [String]
    ) {
        self.available = available
        self.currencies = currencies
        self.excludedAccountIds = excludedAccountIds
    }
}
