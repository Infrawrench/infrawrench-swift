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

public struct DashboardWithPins: Codable, Hashable, Sendable {
    public var dashboard: DashboardFull
    public var pins: [DashboardPin]
    public var workflowPins: [DashboardWorkflowPin]
    public var widgets: [DashboardWidget]

    public init(
        dashboard: DashboardFull,
        pins: [DashboardPin],
        workflowPins: [DashboardWorkflowPin],
        widgets: [DashboardWidget]
    ) {
        self.dashboard = dashboard
        self.pins = pins
        self.workflowPins = workflowPins
        self.widgets = widgets
    }
}
