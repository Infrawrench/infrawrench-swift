/*
 * InfrawrenchSDK v1.81.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.81.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SeatListResponse: Codable, Hashable, Sendable {
    public struct Counts: Codable, Hashable, Sendable {
        public var seats: Int
        public var inactive: Int
        public var duplicate: Int
        public var downgrade: Int
        public var unknownActivity: Int
        public var unpriced: Int

        public init(
            seats: Int,
            inactive: Int,
            duplicate: Int,
            downgrade: Int,
            unknownActivity: Int,
            unpriced: Int
        ) {
            self.seats = seats
            self.inactive = inactive
            self.duplicate = duplicate
            self.downgrade = downgrade
            self.unknownActivity = unknownActivity
            self.unpriced = unpriced
        }
    }

    public struct Account2: Codable, Hashable, Sendable {
        public var accountId: String
        public var accountName: String
        public var pluginId: PluginId
        public var pluginName: String
        public var seatCount: Int
        public var lastPolledAt: String?
        public var lastError: String?

        public init(
            accountId: String,
            accountName: String,
            pluginId: PluginId,
            pluginName: String,
            seatCount: Int,
            lastPolledAt: String? = nil,
            lastError: String? = nil
        ) {
            self.accountId = accountId
            self.accountName = accountName
            self.pluginId = pluginId
            self.pluginName = pluginName
            self.seatCount = seatCount
            self.lastPolledAt = lastPolledAt
            self.lastError = lastError
        }
    }

    public var inactiveDays: Int
    public var seats: [Seat]
    /// Largest saving first; at most one per seat.
    public var findings: [SeatFinding]
    public var savingsMonthly: [SeatTotal]
    public var spendMonthly: [SeatTotal]
    public var counts: Counts
    public var accounts: [Account2]

    public init(
        inactiveDays: Int,
        seats: [Seat],
        findings: [SeatFinding],
        savingsMonthly: [SeatTotal],
        spendMonthly: [SeatTotal],
        counts: Counts,
        accounts: [Account2]
    ) {
        self.inactiveDays = inactiveDays
        self.seats = seats
        self.findings = findings
        self.savingsMonthly = savingsMonthly
        self.spendMonthly = spendMonthly
        self.counts = counts
        self.accounts = accounts
    }
}
