/*
 * InfrawrenchSDK v0.30.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.30.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct UntaggedSpendReport: Codable, Hashable, Sendable {
    public struct ByKey: Codable, Hashable, Sendable {
        public var key: String
        /// Currency code → amount in the currency's major unit.
        public var untagged: [String: Double]

        public init(
            key: String,
            untagged: [String: Double]
        ) {
            self.key = key
            self.untagged = untagged
        }
    }

    public struct TopUntagged: Codable, Hashable, Sendable {
        public var accountId: String
        public var accountLabel: String
        public var service: String
        public var currency: String
        public var amount: Double

        public init(
            accountId: String,
            accountLabel: String,
            service: String,
            currency: String,
            amount: Double
        ) {
            self.accountId = accountId
            self.accountLabel = accountLabel
            self.service = service
            self.currency = currency
            self.amount = amount
        }
    }

    public var from: String
    public var to: String
    public var requiredKeys: [String]
    public var currencies: [String]
    /// Currency code → amount in the currency's major unit.
    public var totals: [String: Double]
    /// Spend on rows missing at least one required tag key, per currency.
    public var untaggedTotals: [String: Double]
    public var byKey: [ByKey]
    public var topUntagged: [TopUntagged]

    public init(
        from: String,
        to: String,
        requiredKeys: [String],
        currencies: [String],
        totals: [String: Double],
        untaggedTotals: [String: Double],
        byKey: [ByKey],
        topUntagged: [TopUntagged]
    ) {
        self.from = from
        self.to = to
        self.requiredKeys = requiredKeys
        self.currencies = currencies
        self.totals = totals
        self.untaggedTotals = untaggedTotals
        self.byKey = byKey
        self.topUntagged = topUntagged
    }
}
