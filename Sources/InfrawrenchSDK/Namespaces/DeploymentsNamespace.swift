/*
 * InfrawrenchSDK v0.30.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.30.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct DeploymentsRunsCreateResult: Codable, Hashable, Sendable {
    public var id: String

    public init(
        id: String
    ) {
        self.id = id
    }
}

public struct DeploymentsTriggersUpdateBody: Codable, Hashable, Sendable {
    public var enabled: Bool

    public init(
        enabled: Bool
    ) {
        self.enabled = enabled
    }
}

/// `client.deployments`
public final class DeploymentsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.deployments.runs`
    public let runs: DeploymentsRunsNamespace
    /// `client.deployments.triggers`
    public let triggers: DeploymentsTriggersNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.runs = DeploymentsRunsNamespace(transport: transport)
        self.triggers = DeploymentsTriggersNamespace(transport: transport)
    }

    /// List the environments a repository's Infrafile declares
    ///
    /// Reads `Infrafile` at the branch head and returns its declared
    /// environments. The file is parsed, not executed.
    ///
    /// _Requires permission: `deployments:read`._
    ///
    /// POST /api/org/{orgId}/deployments/envs
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 401: Unauthenticated
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func envs(
        orgId: String? = nil,
        body: DeployEnvsInput? = nil,
        options: RequestOptions? = nil
    ) async throws -> DeployEnvs {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/deployments/envs",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Preview a deploy without building
    ///
    /// Runs the Infrafile's `plan()` and renders its Dockerfile, then stops.
    /// Nothing is built or deployed.
    ///
    /// _Requires permission: `deployments:plan`._
    ///
    /// POST /api/org/{orgId}/deployments/plan
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 401: Unauthenticated
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func plan(
        orgId: String? = nil,
        body: DeployPlanInput? = nil,
        options: RequestOptions? = nil
    ) async throws -> DeployPlanResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/deployments/plan",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// List repositories this organization can deploy from
    ///
    /// Repositories visible to the organization's GitHub App installations. Empty
    /// when the app is not configured.
    ///
    /// _Requires permission: `deployments:read`._
    ///
    /// GET /api/org/{orgId}/deployments/repos
    ///
    /// Raises on 401: Unauthenticated
    ///
    /// Raises on 403: Forbidden
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func repos(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [DeployRepo] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/deployments/repos",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }
}

/// `client.deployments.runs`
public final class DeploymentsRunsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Record a deployment that ran elsewhere
    ///
    /// The CLI builds on the operator's own machine, so the server never sees
    /// that run. Reporting it here keeps one history across both origins.
    ///
    /// _Requires permission: `deployments:write`._
    ///
    /// POST /api/org/{orgId}/deployments/runs
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 401: Unauthenticated
    ///
    /// Raises on 403: Forbidden
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: DeploymentRunInput? = nil,
        options: RequestOptions? = nil
    ) async throws -> DeploymentsRunsCreateResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/deployments/runs",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Get one deployment run, with its logs and rendered Dockerfile
    ///
    /// _Requires permission: `deployments:read`._
    ///
    /// GET /api/org/{orgId}/deployments/runs/{id}
    ///
    /// Raises on 401: Unauthenticated
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> DeploymentRun {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/deployments/runs/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List deployment runs
    ///
    /// _Requires permission: `deployments:read`._
    ///
    /// GET /api/org/{orgId}/deployments/runs
    ///
    /// Raises on 401: Unauthenticated
    ///
    /// Raises on 403: Forbidden
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        env: String? = nil,
        limit: Int? = nil,
        options: RequestOptions? = nil
    ) async throws -> [DeploymentRun] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/deployments/runs",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("env", env), QueryParameter("limit", limit)]
            ),
            options: options
        )
    }

    /// Roll back to a previous deployment
    ///
    /// Re-runs that run's `deploy()` with the image and plan it recorded,
    /// building nothing — the exact artifact that was known good ships again. The
    /// Infrafile is read at the commit that run deployed, not at the branch head.
    /// Only a successful run that produced an image can be rolled back to. With
    /// `deleteCreated`, resources that runs after the target created through
    /// `infra.accounts` are deleted once the rollback has succeeded — undoing the
    /// provisioning, not just the shipping. Deletions are best-effort and
    /// reported in the result's notes.
    ///
    /// _Requires permission: `deployments:write`._
    ///
    /// POST /api/org/{orgId}/deployments/runs/{id}/rollback
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 401: Unauthenticated
    ///
    /// Raises on 402: Payment required — the organization's plan does not include
    /// this
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// Raises on 423: Blocked by an active change freeze. Retry with the
    /// `x-change-freeze-override: true` header if you hold `freezes:override`;
    /// both blocks and overrides are audit-logged.
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func rollback(
        orgId: String? = nil,
        id: String,
        body: DeployRollbackInput? = nil,
        options: RequestOptions? = nil
    ) async throws -> DeployPlanResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/deployments/runs/{id}/rollback",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}

/// `client.deployments.triggers`
public final class DeploymentsTriggersNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Deploy an environment whenever a branch moves
    ///
    /// Arming a trigger records the branch's current commit WITHOUT deploying it
    /// — the trigger fires on the next push, not on the state at the moment it
    /// was created. The environment is validated against the Infrafile at that
    /// branch head, so a typo fails here rather than silently never firing.
    ///
    /// _Requires permission: `deployments:write`._
    ///
    /// POST /api/org/{orgId}/deployments/triggers
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 401: Unauthenticated
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: DeployTriggerInput? = nil,
        options: RequestOptions? = nil
    ) async throws -> DeployTrigger {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/deployments/triggers",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Delete a deploy trigger
    ///
    /// _Requires permission: `deployments:write`._
    ///
    /// DELETE /api/org/{orgId}/deployments/triggers/{id}
    ///
    /// Raises on 401: Unauthenticated
    ///
    /// Raises on 403: Forbidden
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
                path: "/api/org/{orgId}/deployments/triggers/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List deploy-on-push triggers
    ///
    /// _Requires permission: `deployments:read`._
    ///
    /// GET /api/org/{orgId}/deployments/triggers
    ///
    /// Raises on 401: Unauthenticated
    ///
    /// Raises on 403: Forbidden
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [DeployTrigger] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/deployments/triggers",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Enable or disable a deploy trigger
    ///
    /// _Requires permission: `deployments:write`._
    ///
    /// PATCH /api/org/{orgId}/deployments/triggers/{id}
    ///
    /// Raises on 401: Unauthenticated
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        id: String,
        body: DeploymentsTriggersUpdateBody? = nil,
        options: RequestOptions? = nil
    ) async throws -> DeployTrigger {
        return try await transport.send(
            RequestSpec(
                method: "PATCH",
                path: "/api/org/{orgId}/deployments/triggers/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}
