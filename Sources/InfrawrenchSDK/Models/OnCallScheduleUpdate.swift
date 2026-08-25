/*
 * InfrawrenchSDK v1.38.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.38.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct OnCallScheduleUpdate: Codable, Hashable, Sendable {
    public var name: String?
    public var timezone: String?
    public var rotationDays: Int?
    public var handoffTime: String?
    public var startDate: String?
    public var participantUserIds: [String]?
    public var enabled: Bool?

    public init(
        name: String? = nil,
        timezone: String? = nil,
        rotationDays: Int? = nil,
        handoffTime: String? = nil,
        startDate: String? = nil,
        participantUserIds: [String]? = nil,
        enabled: Bool? = nil
    ) {
        self.name = name
        self.timezone = timezone
        self.rotationDays = rotationDays
        self.handoffTime = handoffTime
        self.startDate = startDate
        self.participantUserIds = participantUserIds
        self.enabled = enabled
    }
}
