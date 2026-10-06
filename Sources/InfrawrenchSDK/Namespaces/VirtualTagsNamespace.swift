/*
 * InfrawrenchSDK v1.75.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.75.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.virtualTags`
public final class VirtualTagsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Create a virtual tag
    ///
    /// Queues the background evaluation over stored history at once.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// POST /api/org/{orgId}/virtual-tags
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: VirtualTagInput,
        options: RequestOptions? = nil
    ) async throws -> VirtualTag {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/virtual-tags",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Delete a virtual tag
    ///
    /// Refused with a 409 that names every saved filter, budget, report,
    /// dashboard card, change alert, allocation rule, cost export or business
    /// metric still referencing the key: deleting it would make those fail rather
    /// than quietly widen to all spend.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// DELETE /api/org/{orgId}/virtual-tags/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
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
                path: "/api/org/{orgId}/virtual-tags/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Get a virtual tag
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/virtual-tags/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> VirtualTag {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/virtual-tags/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List virtual tags
    ///
    /// Virtual tags are tags the organisation computes from its own ordered
    /// rules: merge `env`/`Environment`/`ENV` into one key, assign values by any
    /// cost filter, split shared spend by percentage or by a business metric,
    /// with optional start and end dates per rule. They work as the `virtual_tag`
    /// cost dimension everywhere a tag does.
    ///
    /// **They are computed at query time and never written into stored cost
    /// data**, and splits are weighted so a total never changes.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/virtual-tags
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [VirtualTag] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/virtual-tags",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Preview an unsaved virtual tag
    ///
    /// Evaluates a definition over the trailing 30 days without storing it: spend
    /// per rule, unmatched spend and the top values. Validates exactly as a save
    /// would.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// POST /api/org/{orgId}/virtual-tags/preview
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func preview(
        orgId: String? = nil,
        body: VirtualTagInput,
        options: RequestOptions? = nil
    ) async throws -> VirtualTagStats? {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/virtual-tags/preview",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Re-run a virtual tag's evaluation
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// POST /api/org/{orgId}/virtual-tags/{id}/reprocess
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func reprocess(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> VirtualTag {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/virtual-tags/{id}/reprocess",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Update a virtual tag
    ///
    /// A full replace, rule order included. The key cannot change (400). Saving
    /// re-queues the background evaluation.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// PUT /api/org/{orgId}/virtual-tags/{id}
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
        body: VirtualTagInput,
        options: RequestOptions? = nil
    ) async throws -> VirtualTag {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/virtual-tags/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
