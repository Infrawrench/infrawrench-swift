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

public struct OnCallOverrideCreate: Codable, Hashable, Sendable {
    public var scheduleId: String
    public var userId: String
    public var startsAt: String
    public var endsAt: String
    public var reason: String?

    public init(
        scheduleId: String,
        userId: String,
        startsAt: String,
        endsAt: String,
        reason: String? = nil
    ) {
        self.scheduleId = scheduleId
        self.userId = userId
        self.startsAt = startsAt
        self.endsAt = endsAt
        self.reason = reason
    }
}
