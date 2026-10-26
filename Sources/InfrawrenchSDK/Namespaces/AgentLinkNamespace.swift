/*
 * InfrawrenchSDK v1.84.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.84.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.agentLink`
public final class AgentLinkNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.agentLink.agents`
    public let agents: AgentLinkAgentsNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.agents = AgentLinkAgentsNamespace(transport: transport)
    }

    /// Unlink, revoking every agent this link made
    ///
    /// DELETE /api/agent-link
    ///
    /// Raises on 401: Unknown or revoked link credential
    public func delete(
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/agent-link"
            ),
            options: options
        )
    }

    /// Describe this link
    ///
    /// GET /api/agent-link
    ///
    /// Raises on 401: Unknown or revoked link credential
    public func get(
        options: RequestOptions? = nil
    ) async throws -> AgentLinkInfo {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/agent-link"
            ),
            options: options
        )
    }
}

/// `client.agentLink.agents`
public final class AgentLinkAgentsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Create an agent with its own `iwa_` credential
    ///
    /// POST /api/agent-link/agents
    ///
    /// Raises on 400: `scope_not_allowed` (with `scopes`), `invalid_provider`, or
    /// malformed
    ///
    /// Raises on 401: Unknown or revoked link credential
    ///
    /// Raises on 403: The approving person no longer exists
    ///
    /// Raises on 409: `exists`: a live agent with this `externalId` (with
    /// `agentId`)
    public func create(
        body: CreatePlatformAgent? = nil,
        options: RequestOptions? = nil
    ) async throws -> PlatformAgentWithCredential {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/agent-link/agents",
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Revoke an agent (idempotent; the row is kept for the audit log)
    ///
    /// DELETE /api/agent-link/agents/{id}
    ///
    /// Raises on 401: Unknown or revoked link credential
    ///
    /// Raises on 404: Not an agent of this link
    public func delete(
        id: String,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/agent-link/agents/{id}",
                pathParameters: ["id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List the agents this link made, newest first, revoked included
    ///
    /// GET /api/agent-link/agents
    ///
    /// Raises on 401: Unknown or revoked link credential
    public func list(
        options: RequestOptions? = nil
    ) async throws -> [PlatformAgent] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/agent-link/agents"
            ),
            options: options
        )
    }

    /// Replace an agent's credential; the old one stops working immediately
    ///
    /// POST /api/agent-link/agents/{id}/rotate
    ///
    /// Raises on 401: Unknown or revoked link credential
    ///
    /// Raises on 404: Not an agent of this link, or revoked
    public func rotate(
        id: String,
        options: RequestOptions? = nil
    ) async throws -> PlatformAgentWithCredential {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/agent-link/agents/{id}/rotate",
                pathParameters: ["id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Edit an agent's label, scopes or providers
    ///
    /// PATCH /api/agent-link/agents/{id}
    ///
    /// Raises on 400: `scope_not_allowed`, `invalid_provider`, or malformed
    ///
    /// Raises on 401: Unknown or revoked link credential
    ///
    /// Raises on 404: Not an agent of this link, or revoked
    public func update(
        id: String,
        body: PatchPlatformAgent? = nil,
        options: RequestOptions? = nil
    ) async throws -> PlatformAgentEnvelope {
        return try await transport.send(
            RequestSpec(
                method: "PATCH",
                path: "/api/agent-link/agents/{id}",
                pathParameters: ["id": id.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}
