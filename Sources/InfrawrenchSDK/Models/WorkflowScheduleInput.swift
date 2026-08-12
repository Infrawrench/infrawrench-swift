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

public struct WorkflowScheduleInput: Codable, Hashable, Sendable {
    /// Standard 5-field cron expression (minute hour day-of-month month
    /// day-of-week). Supports `*`, lists, ranges, and steps; 3-letter
    /// month/weekday names; `7` as Sunday. When both day fields are restricted, a
    /// date matches if either does (POSIX).
    public var expression: String
    /// IANA timezone the expression's wall times are evaluated in. Omit or null
    /// for UTC.
    public var timezone: String?
    /// Also set the workflow's enabled flag. Omit to leave it unchanged.
    public var enabled: Bool?

    public init(
        expression: String,
        timezone: String? = nil,
        enabled: Bool? = nil
    ) {
        self.expression = expression
        self.timezone = timezone
        self.enabled = enabled
    }
}
