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

/// Over every finding the caller can see, ignoring filters.
public struct SavingsFindingsSummary: Codable, Hashable, Sendable {
    public struct Counts: Codable, Hashable, Sendable {
        public var ready: Int
        public var in_progress: Int
        public var completed: Int
        public var archived: Int

        public init(
            ready: Int,
            in_progress: Int,
            completed: Int,
            archived: Int
        ) {
            self.ready = ready
            self.in_progress = in_progress
            self.completed = completed
            self.archived = archived
        }
    }

    public struct SavingsRate: Codable, Hashable, Sendable {
        public var currency: String
        public var rate: Double

        public init(
            currency: String,
            rate: Double
        ) {
            self.currency = currency
            self.rate = rate
        }
    }

    public var counts: Counts
    /// Monthly savings of open findings, per currency, largest first.
    public var potentialMonthly: [SavingsFindingMoney?]
    /// Open findings with no price; never summed.
    public var unpricedOpenCount: Int
    /// Realized savings over the trailing `realizedWindowDays`, per currency (the
    /// realized savings report). Null without `costs:read`.
    public var realized: [SavingsFindingMoney?]?
    public var realizedWindowDays: Int
    /// Realized ÷ (realized + potential) per currency: the share of the
    /// identified monthly opportunity already captured. Currencies with nothing
    /// on either side are omitted.
    public var savingsRate: [SavingsRate]?

    public init(
        counts: Counts,
        potentialMonthly: [SavingsFindingMoney?],
        unpricedOpenCount: Int,
        realized: [SavingsFindingMoney?]? = nil,
        realizedWindowDays: Int,
        savingsRate: [SavingsRate]? = nil
    ) {
        self.counts = counts
        self.potentialMonthly = potentialMonthly
        self.unpricedOpenCount = unpricedOpenCount
        self.realized = realized
        self.realizedWindowDays = realizedWindowDays
        self.savingsRate = savingsRate
    }
}
