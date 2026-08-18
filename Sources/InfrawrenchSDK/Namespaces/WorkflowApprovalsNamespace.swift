/*
 * InfrawrenchSDK v1.29.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.29.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.workflowApprovals`
public final class WorkflowApprovalsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Approve a pending workflow approval request
    ///
    /// The suspended run resumes within a few seconds of the decision landing.
    ///
    /// _Requires permission: `workflows:approve`._
    ///
    /// POST /api/org/{orgId}/workflow-approvals/{id}/approve
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func approve(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> WorkflowApproval {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/workflow-approvals/{id}/approve",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Deny a pending workflow approval request
    ///
    /// Denial fails the waiting `infra.waitForApproval(...)` call in the run.
    ///
    /// _Requires permission: `workflows:approve`._
    ///
    /// POST /api/org/{orgId}/workflow-approvals/{id}/deny
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func deny(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> WorkflowApproval {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/workflow-approvals/{id}/deny",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List workflow approval requests
    ///
    /// Approval requests raised by `infra.waitForApproval(...)` inside workflow
    /// runs, newest first. Filter with `status=pending` to build an approvals
    /// inbox.
    ///
    /// _Requires permission: `workflows:read`._
    ///
    /// GET /api/org/{orgId}/workflow-approvals
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        status: WorkflowApprovalStatus? = nil,
        workflowId: String? = nil,
        runId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [WorkflowApproval] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/workflow-approvals",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("status", status), QueryParameter("workflowId", workflowId), QueryParameter("runId", runId)]
            ),
            options: options
        )
    }
}
