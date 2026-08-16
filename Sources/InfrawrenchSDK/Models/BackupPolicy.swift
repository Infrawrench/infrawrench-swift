/*
 * InfrawrenchSDK v1.27.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.27.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct BackupPolicy: Codable, Hashable, Sendable {
    public var id: String
    public var name: String
    /// Resource types the policy selects; empty selects every stateful type.
    public var resourceTypeIds: [String]
    /// Tag key that must be present. Matched case-insensitively.
    public var tagKey: String?
    /// Required value of `tagKey`, matched exactly. Null means presence is
    /// enough.
    public var tagValue: String?
    /// The newest backup must be no older than this. Null means no RPO demand.
    public var maxRpoHours: Int?
    /// Provider-native retention must be at least this. Null means no demand.
    public var minRetentionDays: Int?
    public var enabled: Bool
    public var createdAt: String
    public var updatedAt: String

    public init(
        id: String,
        name: String,
        resourceTypeIds: [String],
        tagKey: String? = nil,
        tagValue: String? = nil,
        maxRpoHours: Int? = nil,
        minRetentionDays: Int? = nil,
        enabled: Bool,
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
        self.name = name
        self.resourceTypeIds = resourceTypeIds
        self.tagKey = tagKey
        self.tagValue = tagValue
        self.maxRpoHours = maxRpoHours
        self.minRetentionDays = minRetentionDays
        self.enabled = enabled
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
