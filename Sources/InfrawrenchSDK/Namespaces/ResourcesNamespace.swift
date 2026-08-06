/*
 * InfrawrenchSDK v0.36.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.36.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ResourcesCreateCostEstimateResult: Codable, Hashable, Sendable {
    public var estimate: JsonObject?

    public init(
        estimate: JsonObject? = nil
    ) {
        self.estimate = estimate
    }
}

public struct ResourcesNosqlCommandResult: Codable, Hashable, Sendable {
    public var result: JsonObject

    public init(
        result: JsonObject
    ) {
        self.result = result
    }
}

/// `client.resources`
public final class ResourcesNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.resources.manifest`
    public let manifest: ResourcesManifestNamespace
    /// `client.resources.secretVersions`
    public let secretVersions: ResourcesSecretVersionsNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.manifest = ResourcesManifestNamespace(transport: transport)
        self.secretVersions = ResourcesSecretVersionsNamespace(transport: transport)
    }

    /// Attach a resource onto another (e.g. disk → VM)
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// POST /api/org/{orgId}/resources/attach
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func attach(
        orgId: String? = nil,
        body: AttachRequest,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/resources/attach",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Create a new resource via its plugin
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// POST /api/org/{orgId}/resources/create
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 422: Blocked by the organization's tag policy: the submitted
    /// fields are missing a required tag (or carry a disallowed value). Retry
    /// with the `x-tag-policy-override: true` header if you hold
    /// `tag-policy:override`; both blocks and overrides are audit-logged.
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: CreateResourceRequest,
        options: RequestOptions? = nil
    ) async throws -> CreateResourceResponse {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/resources/create",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Get the dynamic create form for a resource type
    ///
    /// Calls the plugin's `getCreateConfig`. The returned `CreateResourceConfig`
    /// is plugin-shaped — see `JsonObject`.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// POST /api/org/{orgId}/resources/create-config
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func createConfig(
        orgId: String? = nil,
        body: CreateConfigRequest,
        options: RequestOptions? = nil
    ) async throws -> JsonObject {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/resources/create-config",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Cost estimate for the current create form values
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// POST /api/org/{orgId}/resources/create-cost-estimate
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func createCostEstimate(
        orgId: String? = nil,
        body: CreateCostEstimateRequest,
        options: RequestOptions? = nil
    ) async throws -> ResourcesCreateCostEstimateResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/resources/create-cost-estimate",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Pricing per size for a create form
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// POST /api/org/{orgId}/resources/create-pricing
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func createPricing(
        orgId: String? = nil,
        body: CreatePricingRequest,
        options: RequestOptions? = nil
    ) async throws -> [String: JsonObject] {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/resources/create-pricing",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Delete a resource via the plugin
    ///
    /// _Requires permission: `resources:delete`._
    ///
    /// DELETE /api/org/{orgId}/resources/{pluginId}/{typeId}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 423: Blocked by an active change freeze. Retry with the
    /// `x-change-freeze-override: true` header if you hold `freezes:override`;
    /// both blocks and overrides are audit-logged.
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        pluginId: PluginId,
        typeId: ResourceTypeId,
        resourceId: ResourceId,
        accountId: String,
        parentResourceId: ResourceId? = nil,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/resources/{pluginId}/{typeId}",
                pathParameters: ["orgId": orgId?.parameterValue, "pluginId": pluginId.parameterValue, "typeId": typeId.parameterValue],
                query: [QueryParameter("resourceId", resourceId), QueryParameter("accountId", accountId), QueryParameter("parentResourceId", parentResourceId)]
            ),
            options: options
        )
    }

    /// Get human-readable describe text for a resource
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// POST /api/org/{orgId}/resources/{pluginId}/{typeId}/describe
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func describe(
        orgId: String? = nil,
        pluginId: PluginId,
        typeId: ResourceTypeId,
        body: DescribeRequest,
        options: RequestOptions? = nil
    ) async throws -> DescribeResponse {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/resources/{pluginId}/{typeId}/describe",
                pathParameters: ["orgId": orgId?.parameterValue, "pluginId": pluginId.parameterValue, "typeId": typeId.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Full resource detail page payload
    ///
    /// Performs a live `listResources` against the provider, falls back to DB on
    /// failure, and returns the plugin's `renderDetail` schema plus host-derived
    /// flags (SQL/KV/SSH availability, child resources, peer panes, etc).
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/resources/{pluginId}/{typeId}/detail
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter includePeerPanes: Default true. If false, peer panes are
    /// returned as stubs. One of `true`, `false`.
    public func detail(
        orgId: String? = nil,
        pluginId: PluginId,
        typeId: ResourceTypeId,
        resourceId: ResourceId,
        accountId: String? = nil,
        parentResourceId: ResourceId? = nil,
        includePeerPanes: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> ResourceDetail {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/resources/{pluginId}/{typeId}/detail",
                pathParameters: ["orgId": orgId?.parameterValue, "pluginId": pluginId.parameterValue, "typeId": typeId.parameterValue],
                query: [QueryParameter("resourceId", resourceId), QueryParameter("accountId", accountId), QueryParameter("parentResourceId", parentResourceId), QueryParameter("includePeerPanes", includePeerPanes)]
            ),
            options: options
        )
    }

    /// Export a credential file for a resource (one-time reveal)
    ///
    /// _Requires permission: `secrets:read`._
    ///
    /// POST /api/org/{orgId}/resources/{pluginId}/{typeId}/export-credential
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func exportCredential(
        orgId: String? = nil,
        pluginId: PluginId,
        typeId: ResourceTypeId,
        body: ExportCredentialRequest,
        options: RequestOptions? = nil
    ) async throws -> CredentialExport {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/resources/{pluginId}/{typeId}/export-credential",
                pathParameters: ["orgId": orgId?.parameterValue, "pluginId": pluginId.parameterValue, "typeId": typeId.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Execute an in-form field action (e.g. generate an IAM role)
    ///
    /// Calls the plugin's `executeFieldAction`. Returns `{ value }` to assign to
    /// the field; for `select` fields the optional `option` should be spliced
    /// into the options list so the new value can be displayed.
    ///
    /// POST /api/org/{orgId}/resources/field-action
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func fieldAction(
        orgId: String? = nil,
        body: FieldActionRequest,
        options: RequestOptions? = nil
    ) async throws -> FieldActionResponse {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/resources/field-action",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Bulk-import resources from YAML (kubectl apply -f equivalent)
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// POST /api/org/{orgId}/resources/{pluginId}/import-yaml
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func importYaml(
        orgId: String? = nil,
        pluginId: PluginId,
        body: ImportYamlRequest,
        options: RequestOptions? = nil
    ) async throws -> JsonObject {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/resources/{pluginId}/import-yaml",
                pathParameters: ["orgId": orgId?.parameterValue, "pluginId": pluginId.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Invoke a plugin-defined action on a resource
    ///
    /// Actions the plugin marks `destructive: true` in its detail schema are
    /// blocked with `423` while an org change freeze is in effect.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// POST /api/org/{orgId}/resources/invoke-action
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 423: Blocked by an active change freeze. Retry with the
    /// `x-change-freeze-override: true` header if you hold `freezes:override`;
    /// both blocks and overrides are audit-logged.
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func invokeAction(
        orgId: String? = nil,
        body: InvokeActionRequest,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/resources/invoke-action",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Fetch logs for a resource
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// POST /api/org/{orgId}/resources/{pluginId}/{typeId}/logs
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func logs(
        orgId: String? = nil,
        pluginId: PluginId,
        typeId: ResourceTypeId,
        body: LogsRequest,
        options: RequestOptions? = nil
    ) async throws -> LogsResponse {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/resources/{pluginId}/{typeId}/logs",
                pathParameters: ["orgId": orgId?.parameterValue, "pluginId": pluginId.parameterValue, "typeId": typeId.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Fetch metric series for a resource
    ///
    /// Historical points from the metrics store when the resource has accumulated
    /// any (resources pinned to a dashboard are polled continuously); otherwise
    /// the series are fetched live from the provider on demand.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// POST /api/org/{orgId}/resources/{pluginId}/{typeId}/metrics
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func metrics(
        orgId: String? = nil,
        pluginId: PluginId,
        typeId: ResourceTypeId,
        body: MetricsRequest,
        options: RequestOptions? = nil
    ) async throws -> MetricsResponse {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/resources/{pluginId}/{typeId}/metrics",
                pathParameters: ["orgId": orgId?.parameterValue, "pluginId": pluginId.parameterValue, "typeId": typeId.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Run a NoSQL document-browser command (e.g. MongoDB shell)
    ///
    /// _Requires permission: `resources:execute`._
    ///
    /// POST /api/org/{orgId}/resources/nosql-command
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func nosqlCommand(
        orgId: String? = nil,
        body: NoSqlCommandRequest,
        options: RequestOptions? = nil
    ) async throws -> ResourcesNosqlCommandResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/resources/nosql-command",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Lazy-fetch peer-integration panes for a resource
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// POST /api/org/{orgId}/resources/{pluginId}/{typeId}/peer-panes
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func peerPanes(
        orgId: String? = nil,
        pluginId: PluginId,
        typeId: ResourceTypeId,
        body: PeerPanesRequest,
        options: RequestOptions? = nil
    ) async throws -> [PeerPane] {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/resources/{pluginId}/{typeId}/peer-panes",
                pathParameters: ["orgId": orgId?.parameterValue, "pluginId": pluginId.parameterValue, "typeId": typeId.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Fetch options for a `resource-picker` field
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// POST /api/org/{orgId}/resources/picker-resources
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func pickerResources(
        orgId: String? = nil,
        body: PickerResourcesRequest,
        options: RequestOptions? = nil
    ) async throws -> [PickerResource] {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/resources/picker-resources",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Update a resource via its plugin
    ///
    /// Applies the supplied field changes upstream and persists the refreshed
    /// fields/display name to the DB. The body's `fields` map only carries the
    /// keys the caller actually changed. Blocked with `423` while an org change
    /// freeze is in effect (this is also the path that applies right-sizing
    /// recommendations); every applied update is audit-logged.
    ///
    /// POST /api/org/{orgId}/resources/update
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 423: Blocked by an active change freeze. Retry with the
    /// `x-change-freeze-override: true` header if you hold `freezes:override`;
    /// both blocks and overrides are audit-logged.
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        body: UpdateResourceRequest,
        options: RequestOptions? = nil
    ) async throws -> UpdateResourceResponse {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/resources/update",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}

/// `client.resources.manifest`
public final class ResourcesManifestNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Apply an edited manifest to a resource
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// POST /api/org/{orgId}/resources/{pluginId}/{typeId}/manifest
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        pluginId: PluginId,
        typeId: ResourceTypeId,
        body: ApplyManifestRequest,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/resources/{pluginId}/{typeId}/manifest",
                pathParameters: ["orgId": orgId?.parameterValue, "pluginId": pluginId.parameterValue, "typeId": typeId.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Fetch the raw manifest (YAML/JSON) for a resource
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/resources/{pluginId}/{typeId}/manifest
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        pluginId: PluginId,
        typeId: ResourceTypeId,
        resourceId: ResourceId,
        accountId: String,
        parentResourceId: ResourceId? = nil,
        options: RequestOptions? = nil
    ) async throws -> Manifest {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/resources/{pluginId}/{typeId}/manifest",
                pathParameters: ["orgId": orgId?.parameterValue, "pluginId": pluginId.parameterValue, "typeId": typeId.parameterValue],
                query: [QueryParameter("resourceId", resourceId), QueryParameter("accountId", accountId), QueryParameter("parentResourceId", parentResourceId)]
            ),
            options: options
        )
    }
}

/// `client.resources.secretVersions`
public final class ResourcesSecretVersionsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Reveal the plaintext value of a specific version (one-time)
    ///
    /// _Requires permission: `secrets:read`._
    ///
    /// POST /api/org/{orgId}/resources/{pluginId}/{typeId}/secret-versions/access
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func access(
        orgId: String? = nil,
        pluginId: PluginId,
        typeId: ResourceTypeId,
        body: SecretAccessRequest,
        options: RequestOptions? = nil
    ) async throws -> SecretAccessResponse {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/resources/{pluginId}/{typeId}/secret-versions/access",
                pathParameters: ["orgId": orgId?.parameterValue, "pluginId": pluginId.parameterValue, "typeId": typeId.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Add a new secret version
    ///
    /// _Requires permission: `secrets:write`._
    ///
    /// POST /api/org/{orgId}/resources/{pluginId}/{typeId}/secret-versions/add
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func add(
        orgId: String? = nil,
        pluginId: PluginId,
        typeId: ResourceTypeId,
        body: SecretAddRequest,
        options: RequestOptions? = nil
    ) async throws -> SecretVersionResponse {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/resources/{pluginId}/{typeId}/secret-versions/add",
                pathParameters: ["orgId": orgId?.parameterValue, "pluginId": pluginId.parameterValue, "typeId": typeId.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// List secret versions for a versioned-secret resource
    ///
    /// _Requires permission: `secrets:read`._
    ///
    /// GET /api/org/{orgId}/resources/{pluginId}/{typeId}/secret-versions
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        pluginId: PluginId,
        typeId: ResourceTypeId,
        resourceId: ResourceId,
        accountId: String,
        parentResourceId: ResourceId? = nil,
        options: RequestOptions? = nil
    ) async throws -> SecretVersionsResponse {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/resources/{pluginId}/{typeId}/secret-versions",
                pathParameters: ["orgId": orgId?.parameterValue, "pluginId": pluginId.parameterValue, "typeId": typeId.parameterValue],
                query: [QueryParameter("resourceId", resourceId), QueryParameter("accountId", accountId), QueryParameter("parentResourceId", parentResourceId)]
            ),
            options: options
        )
    }

    /// Enable/disable/destroy a secret version
    ///
    /// _Requires permission: `secrets:write`._
    ///
    /// POST /api/org/{orgId}/resources/{pluginId}/{typeId}/secret-versions/modify
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 423: Blocked by an active change freeze. Retry with the
    /// `x-change-freeze-override: true` header if you hold `freezes:override`;
    /// both blocks and overrides are audit-logged.
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func modify(
        orgId: String? = nil,
        pluginId: PluginId,
        typeId: ResourceTypeId,
        body: SecretModifyRequest,
        options: RequestOptions? = nil
    ) async throws -> SecretVersionResponse {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/resources/{pluginId}/{typeId}/secret-versions/modify",
                pathParameters: ["orgId": orgId?.parameterValue, "pluginId": pluginId.parameterValue, "typeId": typeId.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
