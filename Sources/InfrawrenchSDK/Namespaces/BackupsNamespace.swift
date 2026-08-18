/*
 * InfrawrenchSDK v1.29.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.29.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.backups`
public final class BackupsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.backups.policies`
    public let policies: BackupsPoliciesNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.policies = BackupsPoliciesNamespace(transport: transport)
    }

    /// List backup coverage across synced resources
    ///
    /// What protects the organization's stateful resources, what does not, and
    /// which backups protect nothing. Derived from already-synced inventory using
    /// the `backupRole` and `backupPolicy` declarations plugins carry on their
    /// resource types — no provider API calls are made and results reflect the
    /// last sync. Findings are recomputed on every read rather than stored.
    /// Orphaned backups carry a trailing-30-day spend quote when billing data is
    /// available.
    ///
    /// GET /api/org/{orgId}/backups
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> BackupCoverageResponse {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/backups",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }
}

/// `client.backups.policies`
public final class BackupsPoliciesNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Create a backup policy
    ///
    /// A policy must demand at least one of `maxRpoHours` and `minRetentionDays`
    /// — one that demands nothing could never produce a finding and would read as
    /// protection while providing none. An empty `resourceTypeIds` selects every
    /// stateful resource type.
    ///
    /// POST /api/org/{orgId}/backups/policies
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: BackupPolicyCreate? = nil,
        options: RequestOptions? = nil
    ) async throws -> BackupPolicy {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/backups/policies",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Delete a backup policy
    ///
    /// Removes the objective. To stop a policy judging without losing it, set
    /// `enabled` to false instead.
    ///
    /// DELETE /api/org/{orgId}/backups/policies/{policyId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        policyId: String,
        options: RequestOptions? = nil
    ) async throws {
        try await transport.sendVoid(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/backups/policies/{policyId}",
                pathParameters: ["orgId": orgId?.parameterValue, "policyId": policyId.parameterValue]
            ),
            options: options
        )
    }

    /// List the organization's backup policies
    ///
    /// The recovery objectives coverage is judged against. A policy selects
    /// resources by type and/or tag and demands a maximum RPO, a minimum
    /// retention, or both.
    ///
    /// GET /api/org/{orgId}/backups/policies
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> BackupPolicyList {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/backups/policies",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Update a backup policy
    ///
    /// Omitted fields are left alone; an explicit `null` clears `tagKey`,
    /// `tagValue`, `maxRpoHours` or `minRetentionDays`. The result is validated
    /// after merging, so a patch that would leave the policy demanding nothing is
    /// rejected.
    ///
    /// PATCH /api/org/{orgId}/backups/policies/{policyId}
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
        body: BackupPolicyUpdate? = nil,
        options: RequestOptions? = nil
    ) async throws -> BackupPolicy {
        return try await transport.send(
            RequestSpec(
                method: "PATCH",
                path: "/api/org/{orgId}/backups/policies/{policyId}",
                pathParameters: ["orgId": orgId?.parameterValue, "policyId": policyId.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}
