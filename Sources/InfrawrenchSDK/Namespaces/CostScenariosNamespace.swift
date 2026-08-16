/*
 * InfrawrenchSDK v1.27.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.27.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostScenariosReferentsResult: Codable, Hashable, Sendable {
    public var referents: [CostScenarioReferent]

    public init(
        referents: [CostScenarioReferent]
    ) {
        self.referents = referents
    }
}

public struct CostScenariosGetGetResult: Codable, Hashable, Sendable {
    public var models: [CostScenarioModel]

    public init(
        models: [CostScenarioModel]
    ) {
        self.models = models
    }
}

/// `client.costScenarios`
public final class CostScenariosNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.costScenarios.get`
    public let get: CostScenariosGetNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.get = CostScenariosGetNamespace(transport: transport)
    }

    /// Create a scenario model
    ///
    /// Names must be unique per organization (case-insensitively) — the name is
    /// what a chart prints under its scenario line and what the CLI's `--scenario
    /// <name>` addresses, so two models sharing one would make both meaningless.
    /// A model needs at least one adjustment: an empty model changes nothing,
    /// which is the same as applying no scenario.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// POST /api/org/{orgId}/cost-scenarios
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 409: A live scenario model already uses this name.
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: CostScenarioModelInput,
        options: RequestOptions? = nil
    ) async throws -> CostScenarioModel {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/cost-scenarios",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Delete a scenario model
    ///
    /// Soft delete — **refused with a 409 while anything references the model**,
    /// with the referents in the body. For a chart, deleting would silently drop
    /// the assumptions from a projection somebody is reading; for a budget it
    /// would move the forecast thresholds back to the bare trend, changing when
    /// people get paged. Detaching the referents is a deliberate step, never a
    /// side effect of deletion.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// DELETE /api/org/{orgId}/cost-scenarios/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Still referenced — the body lists every referent.
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
                path: "/api/org/{orgId}/cost-scenarios/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List a scenario model's referents
    ///
    /// Every budget, cost report and dashboard cost graph referencing this model
    /// — what an edit will change, and what a delete would be refused over.
    /// Budgets come first: they are the referents that page people.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/cost-scenarios/{id}/referents
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func referents(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> CostScenariosReferentsResult {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/cost-scenarios/{id}/referents",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Update a scenario model
    ///
    /// Replaces the whole model. This is the high-leverage write: every chart
    /// drawing it, and **every budget whose forecast thresholds are measured
    /// against it**, uses the new numbers on its next evaluation — which for a
    /// budget can change which alerts fire. `GET /{id}/referents` names what a
    /// change will touch.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// PUT /api/org/{orgId}/cost-scenarios/{id}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: A live scenario model already uses this name.
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        id: String,
        body: CostScenarioModelInput,
        options: RequestOptions? = nil
    ) async throws -> CostScenarioModel {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/cost-scenarios/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}

/// `client.costScenarios.get`
public final class CostScenariosGetNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// List scenario models
    ///
    /// Named, reusable sets of adjustments an organization overlays on a cost
    /// forecast — the **known future cost a trend fit cannot see**. Pass an id as
    /// `POST /costs/query`'s `scenarioModelId` (alongside `forecast: true`) to
    /// get the adjusted projection back *beside* the unadjusted one, never
    /// instead of it.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/cost-scenarios
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> CostScenariosGetGetResult {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/cost-scenarios",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Get a scenario model
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/cost-scenarios/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func getOrgOrgIdCostScenariosId(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> CostScenarioModel {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/cost-scenarios/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }
}
