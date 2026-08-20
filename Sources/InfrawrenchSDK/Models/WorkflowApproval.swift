/*
 * InfrawrenchSDK v1.34.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.34.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct WorkflowApproval: Codable, Hashable, Sendable {
    public var id: String
    public var workflowId: String
    public var workflowName: String?
    public var runId: String
    public var title: String
    public var message: String
    public var status: WorkflowApprovalStatus
    public var expiresAt: String
    public var decidedAt: String?
    public var decidedByName: String?
    public var createdAt: String

    public init(
        id: String,
        workflowId: String,
        workflowName: String? = nil,
        runId: String,
        title: String,
        message: String,
        status: WorkflowApprovalStatus,
        expiresAt: String,
        decidedAt: String? = nil,
        decidedByName: String? = nil,
        createdAt: String
    ) {
        self.id = id
        self.workflowId = workflowId
        self.workflowName = workflowName
        self.runId = runId
        self.title = title
        self.message = message
        self.status = status
        self.expiresAt = expiresAt
        self.decidedAt = decidedAt
        self.decidedByName = decidedByName
        self.createdAt = createdAt
    }
}
