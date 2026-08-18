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

public struct WorkflowSchedule: Codable, Hashable, Sendable {
    /// Standard 5-field cron expression (minute hour day-of-month month
    /// day-of-week). Supports `*`, lists, ranges, and steps; 3-letter
    /// month/weekday names; `7` as Sunday. When both day fields are restricted, a
    /// date matches if either does (POSIX).
    public var expression: String
    /// IANA timezone the expression's wall times are evaluated in. Omit or null
    /// for UTC.
    public var timezone: String?
    /// Mirrors the workflow's enabled flag — a disabled workflow's schedule never
    /// fires.
    public var enabled: Bool
    /// When the workflow last finished a run (any trigger source).
    public var lastRunAt: String?
    /// The persisted next fire time the scheduler will claim. Null while
    /// disabled, or when the expression never matches.
    public var nextRunAt: String?
    /// Preview of the next few fire times, computed at read time.
    public var nextRuns: [String]

    public init(
        expression: String,
        timezone: String? = nil,
        enabled: Bool,
        lastRunAt: String? = nil,
        nextRunAt: String? = nil,
        nextRuns: [String]
    ) {
        self.expression = expression
        self.timezone = timezone
        self.enabled = enabled
        self.lastRunAt = lastRunAt
        self.nextRunAt = nextRunAt
        self.nextRuns = nextRuns
    }
}
