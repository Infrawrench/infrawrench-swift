/*
 * InfrawrenchSDK v1.29.1 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.29.1).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.environments`
public final class EnvironmentsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.environments.instances`
    public let instances: EnvironmentsInstancesNamespace
    /// `client.environments.settings`
    public let settings: EnvironmentsSettingsNamespace
    /// `client.environments.templates`
    public let templates: EnvironmentsTemplatesNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.instances = EnvironmentsInstancesNamespace(transport: transport)
        self.settings = EnvironmentsSettingsNamespace(transport: transport)
        self.templates = EnvironmentsTemplatesNamespace(transport: transport)
    }

    /// Preview a template capture
    ///
    /// Turn a selection of live resources into a draft template. **Persists
    /// nothing** — the editor shows the draft so the user can choose which fields
    /// to vary before saving. The shape of every member comes from the plugin's
    /// own `getCreateConfig`: a captured value with no matching create field is
    /// dropped, and a resource type the plugin cannot create is reported in
    /// `skipped` with a reason rather than silently omitted. Recorded output
    /// references whose target is also in the selection are preserved as `output`
    /// field values; a value that is exactly another selected resource's external
    /// id becomes a `member-id`.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// POST /api/org/{orgId}/environments/capture
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func capture(
        orgId: String? = nil,
        body: EnvironmentCaptureRequest? = nil,
        options: RequestOptions? = nil
    ) async throws -> EnvironmentCaptureDraft {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/environments/capture",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}

/// `client.environments.instances`
public final class EnvironmentsInstancesNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Forget a torn-down environment
    ///
    /// Removes the record. Refuses while the instance still owns resources — the
    /// row is the only thing that knows they exist. Audit-logged.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// DELETE /api/org/{orgId}/environments/instances/{instanceId}
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: The environment is still live — tear it down first
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        instanceId: String,
        options: RequestOptions? = nil
    ) async throws {
        try await transport.sendVoid(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/environments/instances/{instanceId}",
                pathParameters: ["orgId": orgId?.parameterValue, "instanceId": instanceId.parameterValue]
            ),
            options: options
        )
    }

    /// List environment instances
    ///
    /// Newest first. Reading this also reconciles instances past their deadline
    /// against what the lease pass already deleted, so an environment whose
    /// resources are all gone stops reporting itself as running.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/environments/instances
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> EnvironmentInstanceList {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/environments/instances",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Get an environment instance
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/environments/instances/{instanceId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func getOrgOrgIdEnvironmentsInstancesInstanceId(
        orgId: String? = nil,
        instanceId: String,
        options: RequestOptions? = nil
    ) async throws -> EnvironmentInstance {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/environments/instances/{instanceId}",
                pathParameters: ["orgId": orgId?.parameterValue, "instanceId": instanceId.parameterValue]
            ),
            options: options
        )
    }

    /// Tear an environment down now
    ///
    /// Deletes every created member through the ordinary `deleteResource` path,
    /// in reverse creation order. Idempotent: a member already gone, a resource
    /// the provider answers 404 for, and an instance already torn down all
    /// succeed quietly, so this is safe to retry. Blocked by an active change
    /// freeze. Audit-logged.
    ///
    /// _Requires permission: `resources:delete`._
    ///
    /// POST /api/org/{orgId}/environments/instances/{instanceId}/teardown
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 423: Blocked by an active change freeze. Retry with the
    /// `x-change-freeze-override: true` header if you hold `freezes:override`;
    /// both blocks and overrides are audit-logged.
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func teardown(
        orgId: String? = nil,
        instanceId: String,
        options: RequestOptions? = nil
    ) async throws -> EnvironmentInstance {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/environments/instances/{instanceId}/teardown",
                pathParameters: ["orgId": orgId?.parameterValue, "instanceId": instanceId.parameterValue]
            ),
            options: options
        )
    }
}

/// `client.environments.settings`
public final class EnvironmentsSettingsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Get the organization's environment TTL rails
    ///
    /// The longest TTL an instantiation may ask for and the TTL the form
    /// pre-fills. Absent settings normalize into the shipped defaults (168h /
    /// 24h).
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/environments/settings
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> EnvironmentSettings {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/environments/settings",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Set the organization's environment TTL rails
    ///
    /// `org:settings:write`, not `resources:write` — this is a governance
    /// decision about how long the organization is willing to pay for a throwaway
    /// environment. Clamped to a 720-hour ceiling; the default is clamped to the
    /// maximum. Audit-logged.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// PUT /api/org/{orgId}/environments/settings
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        body: EnvironmentSettings? = nil,
        options: RequestOptions? = nil
    ) async throws -> EnvironmentSettings {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/environments/settings",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}

/// `client.environments.templates`
public final class EnvironmentsTemplatesNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Create an environment template
    ///
    /// Save a capture draft as a template. Member keys must be unique, every
    /// parameter and member reference must resolve, and the members must be
    /// orderable — a dependency cycle is rejected here rather than half-way
    /// through an apply. Audit-logged.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// POST /api/org/{orgId}/environments/templates
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 409: A template with that name already exists
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: EnvironmentTemplateInput? = nil,
        options: RequestOptions? = nil
    ) async throws -> EnvironmentTemplate {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/environments/templates",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Delete an environment template
    ///
    /// Live instances keep running and keep their TTL — they own real resources,
    /// and the template is only where they came from. Their `templateId` becomes
    /// null; the denormalized `templateName` is what the surface reads.
    /// Audit-logged.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// DELETE /api/org/{orgId}/environments/templates/{templateId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        templateId: String,
        options: RequestOptions? = nil
    ) async throws {
        try await transport.sendVoid(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/environments/templates/{templateId}",
                pathParameters: ["orgId": orgId?.parameterValue, "templateId": templateId.parameterValue]
            ),
            options: options
        )
    }

    /// Price an instantiation before it runs
    ///
    /// Runs each member's create fields through the plugin's own `estimateCost`.
    /// A member the plugin cannot price is counted in `unpricedCount` and makes
    /// the total `partial` — `null` is never rounded to zero.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// POST /api/org/{orgId}/environments/templates/{templateId}/estimate
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func estimate(
        orgId: String? = nil,
        templateId: String,
        body: EnvironmentEstimateRequest? = nil,
        options: RequestOptions? = nil
    ) async throws -> EnvironmentCostEstimate {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/environments/templates/{templateId}/estimate",
                pathParameters: ["orgId": orgId?.parameterValue, "templateId": templateId.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// List environment templates
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/environments/templates
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> EnvironmentTemplateList {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/environments/templates",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Get an environment template
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/environments/templates/{templateId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func getOrgOrgIdEnvironmentsTemplatesTemplateId(
        orgId: String? = nil,
        templateId: String,
        options: RequestOptions? = nil
    ) async throws -> EnvironmentTemplate {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/environments/templates/{templateId}",
                pathParameters: ["orgId": orgId?.parameterValue, "templateId": templateId.parameterValue]
            ),
            options: options
        )
    }

    /// Stamp out an environment
    ///
    /// Creates the template's resources in dependency order through the ordinary
    /// `createResource` path, name-prefixed per instance, and attaches an
    /// auto-delete lease to each so expiry runs through the existing lease pass.
    /// `ttlHours` is **required**. Requires `resources:write` **and**
    /// `resources:delete` (the lease is a standing deletion, the same rule `POST
    /// /leases` applies), and is blocked by an active change freeze. A create
    /// that fails part-way returns a `partial` instance whose created members are
    /// recorded and tearable-down, never an error with orphaned resources behind
    /// it. Audit-logged.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// POST /api/org/{orgId}/environments/templates/{templateId}/instantiate
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: The organization is at its live-environment limit
    ///
    /// Raises on 423: Blocked by an active change freeze. Retry with the
    /// `x-change-freeze-override: true` header if you hold `freezes:override`;
    /// both blocks and overrides are audit-logged.
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func instantiate(
        orgId: String? = nil,
        templateId: String,
        body: EnvironmentInstantiateRequest? = nil,
        options: RequestOptions? = nil
    ) async throws -> EnvironmentInstance {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/environments/templates/{templateId}/instantiate",
                pathParameters: ["orgId": orgId?.parameterValue, "templateId": templateId.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Replace an environment template
    ///
    /// The whole document is replaced. Live instances are unaffected.
    /// Audit-logged.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// PUT /api/org/{orgId}/environments/templates/{templateId}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        templateId: String,
        body: EnvironmentTemplateInput? = nil,
        options: RequestOptions? = nil
    ) async throws -> EnvironmentTemplate {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/environments/templates/{templateId}",
                pathParameters: ["orgId": orgId?.parameterValue, "templateId": templateId.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}
