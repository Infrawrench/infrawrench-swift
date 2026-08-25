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

public struct DashboardWidgetFull: Codable, Hashable, Sendable {
    public var id: String
    public var organizationId: String
    public var dashboardId: String
    public var kind: DashboardWidgetKind
    public var title: String
    public var config: JsonObject
    public var gridX: Int
    public var gridY: Int
    public var gridW: Int
    public var gridH: Int
    public var syncVersion: Int
    public var deletedAt: String?
    public var createdAt: String
    public var updatedAt: String

    public init(
        id: String,
        organizationId: String,
        dashboardId: String,
        kind: DashboardWidgetKind,
        title: String,
        config: JsonObject,
        gridX: Int,
        gridY: Int,
        gridW: Int,
        gridH: Int,
        syncVersion: Int,
        deletedAt: String? = nil,
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
        self.organizationId = organizationId
        self.dashboardId = dashboardId
        self.kind = kind
        self.title = title
        self.config = config
        self.gridX = gridX
        self.gridY = gridY
        self.gridW = gridW
        self.gridH = gridH
        self.syncVersion = syncVersion
        self.deletedAt = deletedAt
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
