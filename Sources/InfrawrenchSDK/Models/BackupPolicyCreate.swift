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

public struct BackupPolicyCreate: Codable, Hashable, Sendable {
    public var name: String
    public var resourceTypeIds: [String]?
    public var tagKey: String?
    public var tagValue: String?
    public var maxRpoHours: Int?
    public var minRetentionDays: Int?
    public var enabled: Bool?

    public init(
        name: String,
        resourceTypeIds: [String]? = nil,
        tagKey: String? = nil,
        tagValue: String? = nil,
        maxRpoHours: Int? = nil,
        minRetentionDays: Int? = nil,
        enabled: Bool? = nil
    ) {
        self.name = name
        self.resourceTypeIds = resourceTypeIds
        self.tagKey = tagKey
        self.tagValue = tagValue
        self.maxRpoHours = maxRpoHours
        self.minRetentionDays = minRetentionDays
        self.enabled = enabled
    }
}
