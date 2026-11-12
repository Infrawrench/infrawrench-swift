/*
 * InfrawrenchSDK v1.103.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.103.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct WorkflowMetric: Codable, Hashable, Sendable {
    public var id: String
    /// Organization id
    public var organizationId: String
    public var workflowId: String
    public var key: String
    public var label: String
    /// `number`, `string` or `boolean`.
    public var type: String
    public var unit: String?
    public var value: JSONValue
    public var syncVersion: Int
    public var deletedAt: String?
    public var updatedAt: String

    public init(
        id: String,
        organizationId: String,
        workflowId: String,
        key: String,
        label: String,
        type: String,
        unit: String? = nil,
        value: JSONValue,
        syncVersion: Int,
        deletedAt: String? = nil,
        updatedAt: String
    ) {
        self.id = id
        self.organizationId = organizationId
        self.workflowId = workflowId
        self.key = key
        self.label = label
        self.type = type
        self.unit = unit
        self.value = value
        self.syncVersion = syncVersion
        self.deletedAt = deletedAt
        self.updatedAt = updatedAt
    }
}
