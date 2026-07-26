/*
 * InfrawrenchSDK v0.3.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.3.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CreateWidgetRequest: Codable, Hashable, Sendable {
    public var dashboardId: String
    public var kind: DashboardWidgetKind
    public var title: String?
    public var config: JsonObject

    public init(
        dashboardId: String,
        kind: DashboardWidgetKind,
        title: String? = nil,
        config: JsonObject
    ) {
        self.dashboardId = dashboardId
        self.kind = kind
        self.title = title
        self.config = config
    }
}
