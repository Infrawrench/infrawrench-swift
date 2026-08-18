/*
 * InfrawrenchSDK v1.30.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.30.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ChangeCostImpact: Codable, Hashable, Sendable {
    public var status: ChangeCostImpactStatus
    public var costBasis: ChangeCostBasis
    /// The half-window that was requested.
    public var windowDays: Int
    /// The half-window the data supported. Clamped symmetrically, so both means
    /// always average the same number of days.
    public var effectiveWindowDays: Int
    /// UTC day the change landed on. Excluded from both windows — it is a mixed
    /// day.
    public var eventDay: String
    public var before: ChangeCostImpactWindow?
    public var after: ChangeCostImpactWindow?
    public var series: [ChangeCostImpactSeries]
    public var confidence: ChangeCostImpactConfidence
    public var reasons: [ChangeCostImpactReason]
    /// Other recorded changes to the same resource inside the window. A delta is
    /// correlation, never causation; this is the number that says how much else
    /// was going on.
    public var overlappingChanges: Int

    public init(
        status: ChangeCostImpactStatus,
        costBasis: ChangeCostBasis,
        windowDays: Int,
        effectiveWindowDays: Int,
        eventDay: String,
        before: ChangeCostImpactWindow? = nil,
        after: ChangeCostImpactWindow? = nil,
        series: [ChangeCostImpactSeries],
        confidence: ChangeCostImpactConfidence,
        reasons: [ChangeCostImpactReason],
        overlappingChanges: Int
    ) {
        self.status = status
        self.costBasis = costBasis
        self.windowDays = windowDays
        self.effectiveWindowDays = effectiveWindowDays
        self.eventDay = eventDay
        self.before = before
        self.after = after
        self.series = series
        self.confidence = confidence
        self.reasons = reasons
        self.overlappingChanges = overlappingChanges
    }
}
