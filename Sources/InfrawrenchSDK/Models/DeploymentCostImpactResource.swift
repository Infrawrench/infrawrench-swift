/*
 * InfrawrenchSDK v1.21.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.21.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct DeploymentCostImpactResource: Codable, Hashable, Sendable {
    public var resourceId: ResourceId
    public var displayName: String
    public var pluginId: String
    public var resourceTypeId: String
    public var impact: ChangeCostImpact

    public init(
        resourceId: ResourceId,
        displayName: String,
        pluginId: String,
        resourceTypeId: String,
        impact: ChangeCostImpact
    ) {
        self.resourceId = resourceId
        self.displayName = displayName
        self.pluginId = pluginId
        self.resourceTypeId = resourceTypeId
        self.impact = impact
    }
}
