/*
 * InfrawrenchSDK v1.12.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.12.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct PinRequest: Codable, Hashable, Sendable {
    public var dashboardId: String
    public var resourceId: ResourceId
    public var gridX: Int?
    public var gridY: Int?

    public init(
        dashboardId: String,
        resourceId: ResourceId,
        gridX: Int? = nil,
        gridY: Int? = nil
    ) {
        self.dashboardId = dashboardId
        self.resourceId = resourceId
        self.gridX = gridX
        self.gridY = gridY
    }
}
