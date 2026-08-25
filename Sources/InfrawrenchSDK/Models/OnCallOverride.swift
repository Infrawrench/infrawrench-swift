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

public struct OnCallOverride: Codable, Hashable, Sendable {
    public var id: String
    public var scheduleId: String
    public var userId: String
    public var userName: String?
    public var startsAt: String
    public var endsAt: String
    public var reason: String?
    public var createdByUserId: String?
    public var createdAt: String

    public init(
        id: String,
        scheduleId: String,
        userId: String,
        userName: String? = nil,
        startsAt: String,
        endsAt: String,
        reason: String? = nil,
        createdByUserId: String? = nil,
        createdAt: String
    ) {
        self.id = id
        self.scheduleId = scheduleId
        self.userId = userId
        self.userName = userName
        self.startsAt = startsAt
        self.endsAt = endsAt
        self.reason = reason
        self.createdByUserId = createdByUserId
        self.createdAt = createdAt
    }
}
