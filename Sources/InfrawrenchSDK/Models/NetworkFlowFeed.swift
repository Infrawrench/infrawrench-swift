/*
 * InfrawrenchSDK v1.22.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.22.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct NetworkFlowFeed: Codable, Hashable, Sendable {
    public struct Range: Codable, Hashable, Sendable {
        public var from: String
        public var to: String

        public init(
            from: String,
            to: String
        ) {
            self.from = from
            self.to = to
        }
    }

    public struct Totals: Codable, Hashable, Sendable {
        public var bytes: Double
        public var estimatedCost: Double
        public var currency: String
        public var unattributedBytes: Double
        public var truncatedBytes: Double

        public init(
            bytes: Double,
            estimatedCost: Double,
            currency: String,
            unattributedBytes: Double,
            truncatedBytes: Double
        ) {
            self.bytes = bytes
            self.estimatedCost = estimatedCost
            self.currency = currency
            self.unattributedBytes = unattributedBytes
            self.truncatedBytes = truncatedBytes
        }
    }

    public var enabled: Bool
    public var initialLookbackDays: Int
    /// Always true. Flow bytes come from logs that sample or drop under load and
    /// are priced at published list rates with no free tier, no volume tier and
    /// no negotiated discount modelled — the ranking is sound, the absolute
    /// figure will not reconcile to the invoice.
    public var estimated: Bool
    public var range: Range
    public var scopes: [NetworkFlowScopeSummary]
    public var topFlows: [NetworkFlowPair]
    public var accounts: [NetworkFlowAccountStatus]
    public var rateCards: [NetworkFlowRateCard]
    public var totals: Totals

    public init(
        enabled: Bool,
        initialLookbackDays: Int,
        estimated: Bool,
        range: Range,
        scopes: [NetworkFlowScopeSummary],
        topFlows: [NetworkFlowPair],
        accounts: [NetworkFlowAccountStatus],
        rateCards: [NetworkFlowRateCard],
        totals: Totals
    ) {
        self.enabled = enabled
        self.initialLookbackDays = initialLookbackDays
        self.estimated = estimated
        self.range = range
        self.scopes = scopes
        self.topFlows = topFlows
        self.accounts = accounts
        self.rateCards = rateCards
        self.totals = totals
    }
}
