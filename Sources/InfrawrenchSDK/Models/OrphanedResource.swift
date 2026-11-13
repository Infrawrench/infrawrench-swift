/*
 * InfrawrenchSDK v1.108.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.108.0).
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
    /// Best-effort trailing spend matched from collected per-resource cost rows;
    /// null when the provider reports no per-resource cost. The flag itself never
    /// depends on billing data.
    public var cost: OrphanCostAnnotation?
    /// Who owns this resource, or null when nobody has claimed it. Present only
    /// when the owner can be named: a resource carrying a purpose but no owner
    /// reads as null, because the question this answers is who to tell.
    public var owner: ResourceOwnerAnnotation?
    public var lastSyncedAt: String?
    public var remediation: FindingRemediation?
    public var idle: OrphanIdleDetail?
    /// Monthly figure at the provider's published list price, for idle rows a
    /// plugin could price. An estimate: show it only when `cost` (billed spend)
    /// is null.
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
