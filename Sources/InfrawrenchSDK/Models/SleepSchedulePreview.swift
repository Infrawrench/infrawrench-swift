/*
 * InfrawrenchSDK v1.15.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.15.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SleepSchedulePreview: Codable, Hashable, Sendable {
    /// Fraction of the week (0–1) the schedule keeps the resource stopped.
    public var offFraction: Double
    /// Trailing spend normalized to a month; null when billing holds no rows.
    public var monthlyCost: Double?
    public var projectedMonthlySaving: Double?
    public var currency: String?
    /// Days of billing data the estimate was computed over (0 = none found).
    public var costWindowDays: Int
    /// The next few transitions, soonest first — a timezone sanity check.
    public var nextTransitions: [ScheduleTransition]

    public init(
        offFraction: Double,
        monthlyCost: Double? = nil,
        projectedMonthlySaving: Double? = nil,
        currency: String? = nil,
        costWindowDays: Int,
        nextTransitions: [ScheduleTransition]
    ) {
        self.offFraction = offFraction
        self.monthlyCost = monthlyCost
        self.projectedMonthlySaving = projectedMonthlySaving
        self.currency = currency
        self.costWindowDays = costWindowDays
        self.nextTransitions = nextTransitions
    }
}
