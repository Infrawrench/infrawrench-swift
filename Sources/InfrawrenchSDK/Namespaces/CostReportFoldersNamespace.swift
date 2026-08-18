/*
 * InfrawrenchSDK v1.31.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.31.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.costReportFolders`
public final class CostReportFoldersNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Create a cost-report folder
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// POST /api/org/{orgId}/cost-report-folders
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: CostReportFolderInput,
        options: RequestOptions? = nil
    ) async throws -> CostReportFolder {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/cost-report-folders",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Delete a cost-report folder
    ///
    /// Never blocked by contents and never destructive to them: the folder's
    /// reports and immediate subfolders fall back to the top level. Deleting a
    /// folder cannot delete a report.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// DELETE /api/org/{orgId}/cost-report-folders/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/cost-report-folders/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List cost-report folders
    ///
    /// The org's report folders as a flat list — build the tree from
    /// `parentFolderId`. Folders organize the Reports list and nothing else; a
    /// report's id, URL and dashboard cards are unchanged by where it is filed.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/cost-report-folders
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [CostReportFolder] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/cost-report-folders",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Update a cost-report folder
    ///
    /// Rename and/or reparent. Filing a *report* is not here — that is `PUT
    /// /cost-reports/{id}` with a different `folderId`. Reparenting past the
    /// 3-level depth limit, or under the folder's own subtree, is a 400.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// PUT /api/org/{orgId}/cost-report-folders/{id}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        id: String,
        body: CostReportFolderInput,
        options: RequestOptions? = nil
    ) async throws -> CostReportFolder {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/cost-report-folders/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
