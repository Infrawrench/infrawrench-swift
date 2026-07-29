/*
 * InfrawrenchSDK v0.13.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.13.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct DashboardPin: Codable, Hashable, Sendable {
    public var pinId: String
    public var resourceId: ResourceId
    public var gridX: Int
    public var gridY: Int
    public var gridW: Int
    public var gridH: Int

    public init(
        pinId: String,
        resourceId: ResourceId,
        gridX: Int,
        gridY: Int,
        gridW: Int,
        gridH: Int
    ) {
        self.pinId = pinId
        self.resourceId = resourceId
        self.gridX = gridX
        self.gridY = gridY
        self.gridW = gridW
        self.gridH = gridH
    }
}
