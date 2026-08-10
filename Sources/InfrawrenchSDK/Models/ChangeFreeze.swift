/*
 * InfrawrenchSDK v1.7.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.7.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ChangeFreeze: Codable, Hashable, Sendable {
    public var id: String
    public var name: String
    public var reason: String?
    public var startsAt: String
    public var endsAt: String?
    public var active: Bool
    public var createdByUserId: String?
    public var endedByUserId: String?
    public var createdAt: String
    public var updatedAt: String

    public init(
        id: String,
        name: String,
        reason: String? = nil,
        startsAt: String,
        endsAt: String? = nil,
        active: Bool,
        createdByUserId: String? = nil,
        endedByUserId: String? = nil,
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
        self.name = name
        self.reason = reason
        self.startsAt = startsAt
        self.endsAt = endsAt
        self.active = active
        self.createdByUserId = createdByUserId
        self.endedByUserId = endedByUserId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
