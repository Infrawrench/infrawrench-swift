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

public struct EnvironmentCostEstimate: Codable, Hashable, Sendable {
    public struct Member: Codable, Hashable, Sendable {
        public var memberKey: String
        public var displayName: String
        public var monthlyAmount: Double?
        public var currency: String?
        public var monthlyKgCo2e: Double?

        public init(
            memberKey: String,
            displayName: String,
            monthlyAmount: Double? = nil,
            currency: String? = nil,
            monthlyKgCo2e: Double? = nil
        ) {
            self.memberKey = memberKey
            self.displayName = displayName
            self.monthlyAmount = monthlyAmount
            self.currency = currency
            self.monthlyKgCo2e = monthlyKgCo2e
        }
    }

    /// Null means 'could not be priced', which is not the same as zero.
    public var monthlyAmount: Double?
    public var currency: String?
    /// True when at least one member is unpriced — read as 'at least'.
    public var partial: Bool
    public var unpricedCount: Int
    /// Estimated monthly kg CO2e of the members that could be placed against a
    /// published grid figure. Null when none could. See the Carbon tag for the
    /// method.
    public var monthlyKgCo2e: Double?
    /// Sized compute members whose carbon could not be estimated.
    public var uncarbonedCount: Int
    public var members: [Member]

    public init(
        monthlyAmount: Double? = nil,
        currency: String? = nil,
        partial: Bool,
        unpricedCount: Int,
        monthlyKgCo2e: Double? = nil,
        uncarbonedCount: Int,
        members: [Member]
    ) {
        self.monthlyAmount = monthlyAmount
        self.currency = currency
        self.partial = partial
        self.unpricedCount = unpricedCount
        self.monthlyKgCo2e = monthlyKgCo2e
        self.uncarbonedCount = uncarbonedCount
        self.members = members
    }
}
