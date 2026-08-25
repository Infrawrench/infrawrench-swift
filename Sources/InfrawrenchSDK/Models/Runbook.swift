/*
 * InfrawrenchSDK v1.39.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.39.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct Runbook: Codable, Hashable, Sendable {
    public var id: String
    public var name: String
    public var description: String?
    public var steps: [RunbookStep]
    /// Resource types this runbook is about; empty means it is not scoped to a
    /// type. Used to answer 'which runbooks apply here', **never** to restrict
    /// who may open it — a runbook nobody can find is the failure this feature
    /// exists to fix.
    public var resourceTypeIds: [String]
    /// Optional tag narrowing. Matched case-insensitively.
    public var tagKey: String?
    /// Required value of `tagKey`, matched exactly.
    public var tagValue: String?
    /// Off keeps the row and hides it from the 'what applies here' lookup.
    /// Retiring a runbook must not cost you the history of the runs performed
    /// against it.
    public var enabled: Bool
    public var createdByUserId: String?
    public var createdByName: String?
    public var createdAt: String
    public var updatedAt: String
    public var runCount: Int
    public var lastRunAt: String?

    public init(
        id: String,
        name: String,
        description: String? = nil,
        steps: [RunbookStep],
        resourceTypeIds: [String],
        tagKey: String? = nil,
        tagValue: String? = nil,
        enabled: Bool,
        createdByUserId: String? = nil,
        createdByName: String? = nil,
        createdAt: String,
        updatedAt: String,
        runCount: Int,
        lastRunAt: String? = nil
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.steps = steps
        self.resourceTypeIds = resourceTypeIds
        self.tagKey = tagKey
        self.tagValue = tagValue
        self.enabled = enabled
        self.createdByUserId = createdByUserId
        self.createdByName = createdByName
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.runCount = runCount
        self.lastRunAt = lastRunAt
    }
}
