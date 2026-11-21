/*
 * InfrawrenchSDK v1.124.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.124.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.migrationEstimates`
public final class MigrationEstimatesNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Save a migration estimate
    ///
    /// Stores the inputs only; the figures are computed on every read.
    /// Audit-logged.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// POST /api/org/{orgId}/migration-estimates
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: MigrationEstimateInput,
        options: RequestOptions? = nil
    ) async throws -> MigrationEstimate {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/migration-estimates",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Delete a migration estimate
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// DELETE /api/org/{orgId}/migration-estimates/{id}
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
                path: "/api/org/{orgId}/migration-estimates/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Get a saved migration estimate
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/migration-estimates/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> MigrationEstimate {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/migration-estimates/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List saved migration estimates
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/migration-estimates
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [MigrationEstimate] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/migration-estimates",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Compute an unsaved migration estimate
    ///
    /// Matches each resource to the target's type of the same category, picks the
    /// cheapest size meeting or exceeding its vCPUs, memory and GPUs (or the
    /// override), and prices it beside what the resource costs now. Resources
    /// with no equivalent are listed apart with the reason. A figure nothing can
    /// price is null, never 0. A read despite the method.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// POST /api/org/{orgId}/migration-estimates/preview
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func preview(
        orgId: String? = nil,
        body: MigrationEstimateInput,
        options: RequestOptions? = nil
    ) async throws -> MigrationEstimateResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/migration-estimates/preview",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Compute a saved migration estimate
    ///
    /// The saved inputs priced now: current spend as the caller's cost visibility
    /// scope sees it, and today's list prices.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/migration-estimates/{id}/result
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func result(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> MigrationEstimateResult {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/migration-estimates/{id}/result",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Turn an estimate into a scenario model
    ///
    /// Creates a scenario model with one recurring monthly amount, the estimate's
    /// paired delta (target minus current over the rows priced on both sides),
    /// from `startDate`. 400 when the estimate has no single-currency delta.
    /// Audit-logged.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// POST /api/org/{orgId}/migration-estimates/{id}/scenario
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func scenario(
        orgId: String? = nil,
        id: String,
        body: MigrationScenarioInput,
        options: RequestOptions? = nil
    ) async throws -> MigrationScenarioCreated {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/migration-estimates/{id}/scenario",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Providers an estimate can target
    ///
    /// Every provider with at least one resource type that declares a
    /// cross-provider category, with its categories, the regions it can be priced
    /// in (with their area) and whether pricing it needs one of the org's
    /// accounts.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/migration-estimates/targets
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func targets(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> MigrationTargets {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/migration-estimates/targets",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Terraform for the target provider
    ///
    /// HCL for the matched rows through the target plugin's own Terraform export,
    /// with each row's matched type, size and region. Rows the export cannot map
    /// are listed with the reason. 400 when the target has no Terraform export.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/migration-estimates/{id}/terraform
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func terraform(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> MigrationTerraformResult {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/migration-estimates/{id}/terraform",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Replace a migration estimate
    ///
    /// Name, source, target, region and overrides together. Audit-logged.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// PUT /api/org/{orgId}/migration-estimates/{id}
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
        body: MigrationEstimateInput,
        options: RequestOptions? = nil
    ) async throws -> MigrationEstimate {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/migration-estimates/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
