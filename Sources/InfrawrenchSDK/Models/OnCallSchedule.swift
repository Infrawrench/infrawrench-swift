/*
 * InfrawrenchSDK v1.35.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.35.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct OnCallSchedule: Codable, Hashable, Sendable {
    public var id: String
    public var name: String
    public var timezone: String
    /// Days per shift. 7 is the common case; 1 gives a daily rotation.
    public var rotationDays: Int
    /// Wall-clock time in `timezone` at which the shift changes hands.
    public var handoffTime: String
    /// The calendar date in `timezone` the first shift begins on. Every later
    /// boundary is derived from it, so moving this re-anchors the whole rotation.
    public var startDate: String
    /// Rotation order. Reordering re-plans the future, deliberately.
    public var participants: [OnCallParticipant?]
    /// Off resolves to nobody. A routing destination pointing at a disabled
    /// rotation contributes nobody and the rule's other destinations still
    /// deliver.
    public var enabled: Bool
    public var createdAt: String
    public var updatedAt: String

    public init(
        id: String,
        name: String,
        timezone: String,
        rotationDays: Int,
        handoffTime: String,
        startDate: String,
        participants: [OnCallParticipant?],
        enabled: Bool,
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
        self.name = name
        self.timezone = timezone
        self.rotationDays = rotationDays
        self.handoffTime = handoffTime
        self.startDate = startDate
        self.participants = participants
        self.enabled = enabled
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
