/*
 * InfrawrenchSDK v0.4.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.4.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AgentsSessionsDeleteResult: Codable, Hashable, Sendable {
    public var ok: Bool

    public init(
        ok: Bool
    ) {
        self.ok = ok
    }
}

public struct AgentsSessionsOpenResult: Codable, Hashable, Sendable {
    public var command: String
    public var cwd: String
    public var sshKeyId: String?
    public var sshKeyName: String?

    public init(
        command: String,
        cwd: String,
        sshKeyId: String? = nil,
        sshKeyName: String? = nil
    ) {
        self.command = command
        self.cwd = cwd
        self.sshKeyId = sshKeyId
        self.sshKeyName = sshKeyName
    }
}

public struct AgentsSessionsReconcileResult: Codable, Hashable, Sendable {
    public var branchName: String
    public var message: String

    public init(
        branchName: String,
        message: String
    ) {
        self.branchName = branchName
        self.message = message
    }
}

/// `client.agents`
public final class AgentsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.agents.sessions`
    public let sessions: AgentsSessionsNamespace
    /// `client.agents.settings`
    public let settings: AgentsSettingsNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.sessions = AgentsSessionsNamespace(transport: transport)
        self.settings = AgentsSettingsNamespace(transport: transport)
    }

    /// List accounts whose plugins can create agent VMs
    ///
    /// _Requires permission: `accounts:read`._
    ///
    /// GET /api/org/{orgId}/agents/accounts
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func accounts(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [AgentVmAccount] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/agents/accounts",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }
}

/// `client.agents.sessions`
public final class AgentsSessionsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Create an agent session
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// POST /api/org/{orgId}/agents/sessions
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: CreateAgentSession,
        options: RequestOptions? = nil
    ) async throws -> AgentSession {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/agents/sessions",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Delete an agent session and destroy its VM
    ///
    /// _Requires permission: `resources:delete`._
    ///
    /// DELETE /api/org/{orgId}/agents/sessions/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 502: The provider refused to delete the VM
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> AgentsSessionsDeleteResult {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/agents/sessions/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List agent sessions
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/agents/sessions
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [AgentSession] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/agents/sessions",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Return the command and working directory for an agent session
    ///
    /// _Requires permission: `resources:execute`._
    ///
    /// POST /api/org/{orgId}/agents/sessions/{id}/open
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func open(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> AgentsSessionsOpenResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/agents/sessions/{id}/open",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Return reconciliation branch metadata
    ///
    /// _Requires permission: `resources:execute`._
    ///
    /// POST /api/org/{orgId}/agents/sessions/{id}/reconcile
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func reconcile(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> AgentsSessionsReconcileResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/agents/sessions/{id}/reconcile",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }
}

/// `client.agents.settings`
public final class AgentsSettingsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Get saved Agents defaults
    ///
    /// _Requires permission: `accounts:read`._
    ///
    /// GET /api/org/{orgId}/agents/settings
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> AgentSettings? {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/agents/settings",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Save Agents defaults
    ///
    /// _Requires permission: `accounts:write`._
    ///
    /// PUT /api/org/{orgId}/agents/settings
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        body: AgentSettings,
        options: RequestOptions? = nil
    ) async throws -> AgentSettings? {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/agents/settings",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
