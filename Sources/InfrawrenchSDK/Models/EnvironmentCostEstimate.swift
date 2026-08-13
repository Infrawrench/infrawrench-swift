/*
 * InfrawrenchSDK v1.23.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.23.0).
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

        public init(
            memberKey: String,
            displayName: String,
            monthlyAmount: Double? = nil,
            currency: String? = nil
        ) {
            self.memberKey = memberKey
            self.displayName = displayName
            self.monthlyAmount = monthlyAmount
            self.currency = currency
        }
    }

    /// Null means 'could not be priced', which is not the same as zero.
    public var monthlyAmount: Double?
    public var currency: String?
    /// True when at least one member is unpriced — read as 'at least'.
    public var partial: Bool
    public var unpricedCount: Int
    public var members: [Member]

    public init(
        monthlyAmount: Double? = nil,
        currency: String? = nil,
        partial: Bool,
        unpricedCount: Int,
        members: [Member]
    ) {
        self.monthlyAmount = monthlyAmount
        self.currency = currency
        self.partial = partial
        self.unpricedCount = unpricedCount
        self.members = members
    }
}
