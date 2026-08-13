/*
 * InfrawrenchSDK v1.25.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.25.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostReportPlacement: Codable, Hashable, Sendable {
    public var widgetId: String
    public var dashboardId: String
    public var dashboardName: String

    public init(
        widgetId: String,
        dashboardId: String,
        dashboardName: String
    ) {
        self.widgetId = widgetId
        self.dashboardId = dashboardId
        self.dashboardName = dashboardName
    }
}
