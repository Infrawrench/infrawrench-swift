/*
 * InfrawrenchSDK v1.85.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.85.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct OrphanedResource: Codable, Hashable, Sendable {
    /// Infrawrench resource id; for an idle finding whose `idle.hasResource` is
    /// false, a finding id prefixed `idle:`.
    public var id: String
    public var pluginId: PluginId
    public var resourceTypeId: String
    public var resourceTypeName: String
    public var displayName: String
    /// Provider-native id, when known.
    public var externalId: String?
    /// Plugin-authored explanation of why this resource looks wasted.
    public var reason: String
    public var cost: OrphanCostAnnotation?
    public var owner: ResourceOwnerAnnotation?
    public var lastSyncedAt: String?
    public var remediation: FindingRemediation?
    public var idle: OrphanIdleDetail?
    public var estimate: IdleSavingsEstimate?

    public init(
        id: String,
        pluginId: PluginId,
        resourceTypeId: String,
        resourceTypeName: String,
        displayName: String,
        externalId: String? = nil,
        reason: String,
        cost: OrphanCostAnnotation? = nil,
        owner: ResourceOwnerAnnotation? = nil,
        lastSyncedAt: String? = nil,
        remediation: FindingRemediation? = nil,
        idle: OrphanIdleDetail? = nil,
        estimate: IdleSavingsEstimate? = nil
    ) {
        self.id = id
        self.pluginId = pluginId
        self.resourceTypeId = resourceTypeId
        self.resourceTypeName = resourceTypeName
        self.displayName = displayName
        self.externalId = externalId
        self.reason = reason
        self.cost = cost
        self.owner = owner
        self.lastSyncedAt = lastSyncedAt
        self.remediation = remediation
        self.idle = idle
        self.estimate = estimate
    }
}
