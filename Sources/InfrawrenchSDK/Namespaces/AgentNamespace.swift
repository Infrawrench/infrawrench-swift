/*
 * InfrawrenchSDK v1.34.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.34.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.agent`
public final class AgentNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.agent.claim`
    public let claim: AgentClaimNamespace
    /// `client.agent.identity`
    public let identity: AgentIdentityNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.claim = AgentClaimNamespace(transport: transport)
        self.identity = AgentIdentityNamespace(transport: transport)
    }
}

/// `client.agent.claim`
public final class AgentClaimNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Confirm a claim, binding the workspace to the signed-in user
    ///
    /// The code is re-resolved here rather than trusting a registration id from
    /// the lookup, so the lookup cannot be used as an oracle. Rate limited per
    /// user.
    ///
    /// POST /api/agent/claim
    ///
    /// Raises on 400: Bad code, already claimed, revoked, or a merge with no
    /// valid target
    ///
    /// Raises on 401: Unauthenticated
    ///
    /// Raises on 402: The merge would put a free target organization over its
    /// plan limits
    ///
    /// Raises on 403: You lack the permission the merge needs in the target
    /// organization (`accounts:write`, plus `costs:write` when moving history).
    ///
    /// Raises on 429: Too many attempts
    public func create(
        body: AgentClaimRequest? = nil,
        options: RequestOptions? = nil
    ) async throws -> AgentClaimResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/agent/claim",
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Resolve a user code so the claim page can show what is being claimed
    ///
    /// A POST rather than a GET with the code in the path: the code is a live
    /// bearer secret for 15 minutes, and a URL lands in history, in `Referer`,
    /// and in access logs. Rate limited per user.
    ///
    /// POST /api/agent/claim/lookup
    ///
    /// Raises on 400: Missing, malformed, or expired code
    ///
    /// Raises on 401: Unauthenticated
    ///
    /// Raises on 404: The workspace no longer exists
    ///
    /// Raises on 429: Too many attempts
    public func lookup(
        body: AgentClaimLookupRequest? = nil,
        options: RequestOptions? = nil
    ) async throws -> AgentClaimLookup {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/agent/claim/lookup",
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}

/// `client.agent.identity`
public final class AgentIdentityNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Start the claim ceremony and mint a user code
    ///
    /// Returns a code to show the user together with the verification URL.
    /// Replaces any code already outstanding for this registration.
    ///
    /// POST /api/agent/identity/claim
    ///
    /// Raises on 400: Already claimed
    ///
    /// Raises on 401: Unknown or revoked credential
    ///
    /// Raises on 403: Registration revoked
    public func claim(
        options: RequestOptions? = nil
    ) async throws -> AgentClaimStarted {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/agent/identity/claim"
            ),
            options: options
        )
    }

    /// Open an anonymous registration and a 24-hour trial workspace
    ///
    /// Requires no authentication — this is how a client with no credentials gets
    /// one. Rate limited per source address. The workspace it opens is deleted 24
    /// hours later unless a person completes the claim ceremony.
    ///
    /// POST /api/agent/identity
    ///
    /// Raises on 429: Too many registrations from this address
    ///
    /// Raises on 500: Could not open a workspace
    public func create(
        body: AgentRegisterRequest? = nil,
        options: RequestOptions? = nil
    ) async throws -> RegisteredAgent {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/agent/identity",
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Poll this registration's claim status and time remaining
    ///
    /// GET /api/agent/identity
    ///
    /// Raises on 401: Unknown or revoked credential
    ///
    /// Raises on 404: Unknown registration
    public func get(
        options: RequestOptions? = nil
    ) async throws -> AgentIdentity {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/agent/identity"
            ),
            options: options
        )
    }
}
