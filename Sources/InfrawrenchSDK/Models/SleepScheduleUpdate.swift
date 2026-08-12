/*
 * InfrawrenchSDK v1.20.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.20.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SleepScheduleUpdate: Codable, Hashable, Sendable {
    /// ISO weekdays the resource is worked on: 1 = Monday … 7 = Sunday.
    public var daysOfWeek: [Int]?
    /// Wall-clock time of day, 24-hour `"HH:MM"`, in the schedule's timezone.
    public var stopTime: String?
    /// Wall-clock time of day, 24-hour `"HH:MM"`, in the schedule's timezone.
    public var startTime: String?
    /// IANA timezone the wall-clock times are computed in (DST-safe).
    public var timezone: String?
    public var paused: Bool?

    public init(
        daysOfWeek: [Int]? = nil,
        stopTime: String? = nil,
        startTime: String? = nil,
        timezone: String? = nil,
        paused: Bool? = nil
    ) {
        self.daysOfWeek = daysOfWeek
        self.stopTime = stopTime
        self.startTime = startTime
        self.timezone = timezone
        self.paused = paused
    }
}
