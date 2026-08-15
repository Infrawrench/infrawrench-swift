/*
 * InfrawrenchSDK v1.26.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.26.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.costCentres`
public final class CostCentresNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.costCentres.rules`
    public let rules: CostCentresRulesNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.rules = CostCentresRulesNamespace(transport: transport)
    }

    /// Create a cost centre
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// POST /api/org/{orgId}/cost-centres
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: CostCentreInput,
        options: RequestOptions? = nil
    ) async throws -> CostCentre {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/cost-centres",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Delete a cost centre (its allocation rules go with it)
    ///
    /// The centre's allocation rules are deleted with it, so the spend they
    /// claimed falls through to the next matching rule or to "Unallocated". Child
    /// centres are not deleted: they are re-parented onto the deleted centre's
    /// own parent (a root's children become roots), so a subtree keeps its shape
    /// and no ancestor's subtree total moves unexpectedly.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// DELETE /api/org/{orgId}/cost-centres/{id}
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
                path: "/api/org/{orgId}/cost-centres/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List cost centres
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/cost-centres
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [CostCentre] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/cost-centres",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Update or move a cost centre
    ///
    /// Renames, redescribes, and/or moves a centre. Moving is `parentId`
    /// changing; omitting the field leaves the centre where it is. 400 when the
    /// move would cycle or breach the depth cap.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// PUT /api/org/{orgId}/cost-centres/{id}
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
        body: CostCentreInput,
        options: RequestOptions? = nil
    ) async throws -> CostCentre {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/cost-centres/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}

/// `client.costCentres.rules`
public final class CostCentresRulesNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Create an allocation rule
    ///
    /// Maps spend onto a cost centre. Rules evaluate first-match-wins by
    /// ascending priority against each cost row's tags, account, provider, and
    /// service.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// POST /api/org/{orgId}/cost-centres/rules
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: AllocationRuleInput,
        options: RequestOptions? = nil
    ) async throws -> AllocationRule {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/cost-centres/rules",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Delete an allocation rule
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// DELETE /api/org/{orgId}/cost-centres/rules/{id}
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
                path: "/api/org/{orgId}/cost-centres/rules/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List allocation rules in evaluation order
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/cost-centres/rules
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [AllocationRule] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/cost-centres/rules",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Swap the priorities of two allocation rules
    ///
    /// Atomically swaps priorities so first-match-wins order can be edited
    /// without a half-applied pair of independent updates.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// POST /api/org/{orgId}/cost-centres/rules/swap
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func swap(
        orgId: String? = nil,
        body: SwapAllocationRulesBody,
        options: RequestOptions? = nil
    ) async throws -> [AllocationRule] {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/cost-centres/rules/swap",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Update an allocation rule
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// PUT /api/org/{orgId}/cost-centres/rules/{id}
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
        body: AllocationRuleInput,
        options: RequestOptions? = nil
    ) async throws -> AllocationRule {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/cost-centres/rules/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
