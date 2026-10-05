/*
 * InfrawrenchSDK v1.74.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.74.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct RealizedSavingsReport: Codable, Hashable, Sendable {
    public var from: String
    public var to: String
    public var settings: RealizedSavingsSettings
    public var totals: [RealizedSavingsTotal]
    public var byMonth: [RealizedSavingsMonth]
    public var byKind: [RealizedSavingsBucket]
    public var byCostCentre: [RealizedSavingsBucket]
    public var byAccount: [RealizedSavingsBucket]
    public var events: [SavingsEventResult]
    public var shortfallCount: Int
    public var unmeasuredCount: Int

    public init(
        from: String,
        to: String,
        settings: RealizedSavingsSettings,
        totals: [RealizedSavingsTotal],
        byMonth: [RealizedSavingsMonth],
        byKind: [RealizedSavingsBucket],
        byCostCentre: [RealizedSavingsBucket],
        byAccount: [RealizedSavingsBucket],
        events: [SavingsEventResult],
        shortfallCount: Int,
        unmeasuredCount: Int
    ) {
        self.from = from
        self.to = to
        self.settings = settings
        self.totals = totals
        self.byMonth = byMonth
        self.byKind = byKind
        self.byCostCentre = byCostCentre
        self.byAccount = byAccount
        self.events = events
        self.shortfallCount = shortfallCount
        self.unmeasuredCount = unmeasuredCount
    }
}
