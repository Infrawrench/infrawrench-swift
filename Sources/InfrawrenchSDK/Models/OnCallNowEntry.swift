/*
 * InfrawrenchSDK v1.100.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.100.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct OnCallNowEntry: Codable, Hashable, Sendable {
    public var scheduleId: String
    public var scheduleName: String
    public var enabled: Bool
    public var shift: OnCallShift?
    /// The next person in the rotation, where an escalation goes. Resolved from
    /// the rotation and never from a cover: a cover is somebody standing in for
    /// one shift.
    public var next: OnCallParticipant?

    public init(
        scheduleId: String,
        scheduleName: String,
        enabled: Bool,
        shift: OnCallShift? = nil,
        next: OnCallParticipant? = nil
    ) {
        self.scheduleId = scheduleId
        self.scheduleName = scheduleName
        self.enabled = enabled
        self.shift = shift
        self.next = next
    }
}
