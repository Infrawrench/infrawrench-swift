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

public struct WorkflowPinRequest: Codable, Hashable, Sendable {
    public var dashboardId: String
    public var workflowId: String

    public init(
        dashboardId: String,
        workflowId: String
    ) {
        self.dashboardId = dashboardId
        self.workflowId = workflowId
    }
}
