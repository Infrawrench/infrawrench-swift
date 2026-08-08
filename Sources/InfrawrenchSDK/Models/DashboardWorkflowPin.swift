/*
 * InfrawrenchSDK v1.0.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.0.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct DashboardWorkflowPin: Codable, Hashable, Sendable {
    public struct Metric: Codable, Hashable, Sendable {
        public var key: String
        public var label: String
        public var unit: String?
        public var value: JSONValue?

        public init(
            key: String,
            label: String,
            unit: String? = nil,
            value: JSONValue? = nil
        ) {
            self.key = key
            self.label = label
            self.unit = unit
            self.value = value
        }
    }

    public var pinId: String
    public var workflowId: String
    public var gridX: Int
    public var name: String
    public var lastRunAt: String?
    public var lastStatus: String?
    public var metrics: [Metric]

    public init(
        pinId: String,
        workflowId: String,
        gridX: Int,
        name: String,
        lastRunAt: String? = nil,
        lastStatus: String? = nil,
        metrics: [Metric]
    ) {
        self.pinId = pinId
        self.workflowId = workflowId
        self.gridX = gridX
        self.name = name
        self.lastRunAt = lastRunAt
        self.lastStatus = lastStatus
        self.metrics = metrics
    }
}
