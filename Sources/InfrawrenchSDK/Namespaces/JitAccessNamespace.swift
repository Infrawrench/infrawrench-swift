/*
 * InfrawrenchSDK v1.79.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.79.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct JitAccessRequestsApproveBody: Codable, Hashable, Sendable {
    public var note: String?

    public init(
        note: String? = nil
    ) {
        self.note = note
    }
}

public struct JitAccessRequestsCancelBody: Codable, Hashable, Sendable {
    public var note: String?

    public init(
        note: String? = nil
    ) {
        self.note = note
    }
}

public struct JitAccessRequestsDenyBody: Codable, Hashable, Sendable {
    public var note: String?

    public init(
        note: String? = nil
    ) {
        self.note = note
    }
}

public struct JitAccessRequestsExtendBody: Codable, Hashable, Sendable {
    public var minutes: Int

    public init(
        minutes: Int
    ) {
        self.minutes = minutes
    }
}

public struct JitAccessRequestsRevokeBody: Codable, Hashable, Sendable {
    public var note: String?

    public init(
        note: String? = nil
    ) {
        self.note = note
    }
}

/// `client.jitAccess`
public final class JitAccessNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.jitAccess.accounts`
    public let accounts: JitAccessAccountsNamespace
    /// `client.jitAccess.policies`
    public let policies: JitAccessPoliciesNamespace
    /// `client.jitAccess.requests`
    public let requests: JitAccessRequestsNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.accounts = JitAccessAccountsNamespace(transport: transport)
        self.policies = JitAccessPoliciesNamespace(transport: transport)
        self.requests = JitAccessRequestsNamespace(transport: transport)
    }
}

/// `client.jitAccess.accounts`
public final class JitAccessAccountsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Accounts that can grant just-in-time access
    ///
    /// Connected accounts whose provider plugin declares the just-in-time
    /// capability.
    ///
    /// _Requires permission: `access:read`._
    ///
    /// GET /api/org/{orgId}/jit-access/accounts
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [JitAccessAccount] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/jit-access/accounts",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Grantable roles in a scope (picker)
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// GET /api/org/{orgId}/jit-access/accounts/{accountId}/roles
    ///
    /// Raises on 502: Provider error
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func roles(
        orgId: String? = nil,
        accountId: String,
        scopeId: String,
        options: RequestOptions? = nil
    ) async throws -> [JitPickerOption] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/jit-access/accounts/{accountId}/roles",
                pathParameters: ["orgId": orgId?.parameterValue, "accountId": accountId.parameterValue],
                query: [QueryParameter("scopeId", scopeId)]
            ),
            options: options
        )
    }

    /// Scopes on an account (picker)
    ///
    /// The places a role can be granted (AWS accounts, GCP projects, namespaces),
    /// read from the provider.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// GET /api/org/{orgId}/jit-access/accounts/{accountId}/scopes
    ///
    /// Raises on 502: Provider error
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func scopes(
        orgId: String? = nil,
        accountId: String,
        options: RequestOptions? = nil
    ) async throws -> [JitPickerOption] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/jit-access/accounts/{accountId}/scopes",
                pathParameters: ["orgId": orgId?.parameterValue, "accountId": accountId.parameterValue]
            ),
            options: options
        )
    }
}

/// `client.jitAccess.policies`
public final class JitAccessPoliciesNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Create a policy
    ///
    /// Audit-logged. At least one approver (member, role or on-call rotation) is
    /// required.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// POST /api/org/{orgId}/jit-access/policies
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: JitPolicyInput? = nil,
        options: RequestOptions? = nil
    ) async throws -> JitPolicy {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/jit-access/policies",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Delete a policy
    ///
    /// Grants the policy produced still end on time; its pending requests have no
    /// approvers and time out.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// DELETE /api/org/{orgId}/jit-access/policies/{policyId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        policyId: String,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/jit-access/policies/{policyId}",
                pathParameters: ["orgId": orgId?.parameterValue, "policyId": policyId.parameterValue]
            ),
            options: options
        )
    }

    /// Get a policy
    ///
    /// _Requires permission: `access:read`._
    ///
    /// GET /api/org/{orgId}/jit-access/policies/{policyId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        policyId: String,
        options: RequestOptions? = nil
    ) async throws -> JitPolicy {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/jit-access/policies/{policyId}",
                pathParameters: ["orgId": orgId?.parameterValue, "policyId": policyId.parameterValue]
            ),
            options: options
        )
    }

    /// List just-in-time access policies
    ///
    /// _Requires permission: `access:read`._
    ///
    /// GET /api/org/{orgId}/jit-access/policies
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [JitPolicy] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/jit-access/policies",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Resolve the caller's provider principal
    ///
    /// Who the grant would go to, matched by the caller's email in the provider.
    ///
    /// _Requires permission: `access:request`._
    ///
    /// GET /api/org/{orgId}/jit-access/policies/{policyId}/principal
    ///
    /// Raises on 403: Not a requester
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func principal(
        orgId: String? = nil,
        policyId: String,
        options: RequestOptions? = nil
    ) async throws -> JitPrincipalResolution {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/jit-access/policies/{policyId}/principal",
                pathParameters: ["orgId": orgId?.parameterValue, "policyId": policyId.parameterValue]
            ),
            options: options
        )
    }

    /// Principals the caller may pick
    ///
    /// _Requires permission: `access:request`._
    ///
    /// GET /api/org/{orgId}/jit-access/policies/{policyId}/principals
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func principals(
        orgId: String? = nil,
        policyId: String,
        q: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [JitPrincipalOption?] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/jit-access/policies/{policyId}/principals",
                pathParameters: ["orgId": orgId?.parameterValue, "policyId": policyId.parameterValue],
                query: [QueryParameter("q", q)]
            ),
            options: options
        )
    }

    /// Replace a policy
    ///
    /// Live grants keep their window; pending requests are decided against the
    /// new approver set.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// PUT /api/org/{orgId}/jit-access/policies/{policyId}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        policyId: String,
        body: JitPolicyInput? = nil,
        options: RequestOptions? = nil
    ) async throws -> JitPolicy {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/jit-access/policies/{policyId}",
                pathParameters: ["orgId": orgId?.parameterValue, "policyId": policyId.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}

/// `client.jitAccess.requests`
public final class JitAccessRequestsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Approve a request
    ///
    /// The caller must be in the policy's approver set at this moment. On
    /// approval the provider grant is made; the response may still read
    /// `granting` when it completes in the background. Audit-logged. Not
    /// available to API keys.
    ///
    /// _Requires permission: `access:read`._
    ///
    /// POST /api/org/{orgId}/jit-access/requests/{requestId}/approve
    ///
    /// Raises on 403: Not allowed
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Already decided, timed out, or not in a state for this
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func approve(
        orgId: String? = nil,
        requestId: String,
        body: JitAccessRequestsApproveBody? = nil,
        options: RequestOptions? = nil
    ) async throws -> JitAccessRequest {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/jit-access/requests/{requestId}/approve",
                pathParameters: ["orgId": orgId?.parameterValue, "requestId": requestId.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Cancel your pending request
    ///
    /// Requester only. Audit-logged. Not available to API keys.
    ///
    /// _Requires permission: `access:request`._
    ///
    /// POST /api/org/{orgId}/jit-access/requests/{requestId}/cancel
    ///
    /// Raises on 403: Not allowed
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Already decided, timed out, or not in a state for this
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func cancel(
        orgId: String? = nil,
        requestId: String,
        body: JitAccessRequestsCancelBody? = nil,
        options: RequestOptions? = nil
    ) async throws -> JitAccessRequest {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/jit-access/requests/{requestId}/cancel",
                pathParameters: ["orgId": orgId?.parameterValue, "requestId": requestId.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Request just-in-time access
    ///
    /// Ask for one of a policy's scope and role pairs for a bounded window.
    /// Approvers are notified over push, Slack (with Approve/Deny buttons) and
    /// Microsoft Teams. Not available to API keys.
    ///
    /// _Requires permission: `access:request`._
    ///
    /// POST /api/org/{orgId}/jit-access/requests
    ///
    /// Raises on 400: Invalid
    ///
    /// Raises on 403: Not a requester under this policy
    ///
    /// Raises on 409: A pending or active request already covers this
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: JitCreateRequest? = nil,
        options: RequestOptions? = nil
    ) async throws -> JitAccessRequest {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/jit-access/requests",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Deny a request
    ///
    /// The caller must be in the policy's approver set. Audit-logged. Not
    /// available to API keys.
    ///
    /// _Requires permission: `access:read`._
    ///
    /// POST /api/org/{orgId}/jit-access/requests/{requestId}/deny
    ///
    /// Raises on 403: Not allowed
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Already decided, timed out, or not in a state for this
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func deny(
        orgId: String? = nil,
        requestId: String,
        body: JitAccessRequestsDenyBody? = nil,
        options: RequestOptions? = nil
    ) async throws -> JitAccessRequest {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/jit-access/requests/{requestId}/deny",
                pathParameters: ["orgId": orgId?.parameterValue, "requestId": requestId.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Extend an active grant
    ///
    /// Approvers only, within the policy maximum for the whole window. A
    /// provider-enforced expiry is moved upstream first. Audit-logged. Not
    /// available to API keys.
    ///
    /// _Requires permission: `access:read`._
    ///
    /// POST /api/org/{orgId}/jit-access/requests/{requestId}/extend
    ///
    /// Raises on 400: Beyond the policy maximum
    ///
    /// Raises on 403: Not an approver
    ///
    /// Raises on 409: Not active
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func extend(
        orgId: String? = nil,
        requestId: String,
        body: JitAccessRequestsExtendBody? = nil,
        options: RequestOptions? = nil
    ) async throws -> JitAccessRequest {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/jit-access/requests/{requestId}/extend",
                pathParameters: ["orgId": orgId?.parameterValue, "requestId": requestId.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Get a request
    ///
    /// _Requires permission: `access:read`._
    ///
    /// GET /api/org/{orgId}/jit-access/requests/{requestId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        requestId: String,
        options: RequestOptions? = nil
    ) async throws -> JitAccessRequest {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/jit-access/requests/{requestId}",
                pathParameters: ["orgId": orgId?.parameterValue, "requestId": requestId.parameterValue]
            ),
            options: options
        )
    }

    /// List just-in-time access requests
    ///
    /// Newest first, with caller-relative action flags.
    ///
    /// _Requires permission: `access:read`._
    ///
    /// GET /api/org/{orgId}/jit-access/requests
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter mine: One of `1`.
    ///
    /// - Parameter holding: Only rows that may be holding access upstream. One of
    /// `1`.
    public func list(
        orgId: String? = nil,
        status: JitRequestStatus? = nil,
        mine: String? = nil,
        holding: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [JitAccessRequest] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/jit-access/requests",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("status", status), QueryParameter("mine", mine), QueryParameter("holding", holding)]
            ),
            options: options
        )
    }

    /// End a grant early
    ///
    /// Allowed for the holder, an approver, or a member with org:settings:write.
    /// Audit-logged. Not available to API keys.
    ///
    /// POST /api/org/{orgId}/jit-access/requests/{requestId}/revoke
    ///
    /// Raises on 403: Not allowed
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Already decided, timed out, or not in a state for this
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func revoke(
        orgId: String? = nil,
        requestId: String,
        body: JitAccessRequestsRevokeBody? = nil,
        options: RequestOptions? = nil
    ) async throws -> JitAccessRequest {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/jit-access/requests/{requestId}/revoke",
                pathParameters: ["orgId": orgId?.parameterValue, "requestId": requestId.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}
