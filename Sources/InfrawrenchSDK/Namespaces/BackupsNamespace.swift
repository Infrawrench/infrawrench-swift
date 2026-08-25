/*
 * InfrawrenchSDK v1.39.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.39.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct BackupsDrillsLogResult: Codable, Hashable, Sendable {
    public var drills: [RestoreDrill]

    public init(
        drills: [RestoreDrill]
    ) {
        self.drills = drills
    }
}

/// `client.backups`
public final class BackupsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.backups.drills`
    public let drills: BackupsDrillsNamespace
    /// `client.backups.policies`
    public let policies: BackupsPoliciesNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.drills = BackupsDrillsNamespace(transport: transport)
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

/// `client.backups.drills`
public final class BackupsDrillsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Record a restore drill
    ///
    /// A `verified` drill **must** carry the measured time: an RPO comes from the
    /// backup, and an RTO can only come from somebody with a stopwatch — that
    /// number is the entire point of the exercise. A `blocked` drill must not
    /// carry one, because it never started.
    ///
    /// Takes `resources:write`, not a settings permission: recording a drill is
    /// reporting what you did, and the person who spent Saturday restoring a
    /// database is rarely the person who set the recovery objective.
    ///
    /// POST /api/org/{orgId}/backups/drills
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: RestoreDrillCreate? = nil,
        options: RequestOptions? = nil
    ) async throws -> RestoreDrill {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/backups/drills",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Delete a recorded drill
    ///
    /// For one recorded against the wrong resource or the wrong date. Audited —
    /// deleting evidence that a restore failed is exactly the edit a reviewer
    /// would want to know about.
    ///
    /// DELETE /api/org/{orgId}/backups/drills/{drillId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        drillId: String,
        options: RequestOptions? = nil
    ) async throws {
        try await transport.sendVoid(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/backups/drills/{drillId}",
                pathParameters: ["orgId": orgId?.parameterValue, "drillId": drillId.parameterValue]
            ),
            options: options
        )
    }

    /// Where every protected resource stands on restore
    ///
    /// Backup coverage answers 'is there a backup'. This answers 'does it
    /// restore, and how long does it take' — a different question, and the one
    /// routinely answered wrongly on the day.
    ///
    /// A drill is a **record that somebody tried**, not an automated restore:
    /// restoring a customer's database unattended costs real money, can collide
    /// with production, and cannot be generically verified. What the product can
    /// do is make the exercise scheduled, recorded and visible when it lapses.
    ///
    /// GET /api/org/{orgId}/backups/drills
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter validDays: How long a verified drill counts for. Defaults to
    /// 180 days.
    public func get(
        orgId: String? = nil,
        validDays: Int? = nil,
        options: RequestOptions? = nil
    ) async throws -> DrillCoverageResponse {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/backups/drills",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("validDays", validDays)]
            ),
            options: options
        )
    }

    /// List recorded restore drills
    ///
    /// GET /api/org/{orgId}/backups/drills/log
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func log(
        orgId: String? = nil,
        resourceId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> BackupsDrillsLogResult {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/backups/drills/log",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("resourceId", resourceId)]
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
