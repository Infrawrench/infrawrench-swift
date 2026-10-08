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

public struct JitPolicy: Codable, Hashable, Sendable {
    public var id: String
    public var name: String
    public var description: String?
    public var enabled: Bool
    public var accountId: String
    public var accountName: String?
    public var pluginId: String
    public var targets: [JitPolicyTarget]
    public var maxDurationMinutes: Int
    public var defaultDurationMinutes: Int
    public var requestTimeoutMinutes: Int
    /// Who may ask. Empty (with requesterRoleIds) means any member with
    /// access:request.
    public var requesterUserIds: [String]
    public var requesterRoleIds: [String]
    public var approverUserIds: [String]
    public var approverRoleIds: [String]
    /// Rotations whose current on-call person may approve.
    public var approverOnCallScheduleIds: [String]
    public var allowSelfApprovalDuringIncident: Bool
    public var requireReason: Bool
    public var requireTicket: Bool
    public var createdAt: String
    public var updatedAt: String
    public var labels: JitProviderLabels?
    /// Caller-relative: whether the caller may ask under this policy.
    public var canRequest: Bool?

    public init(
        id: String,
        name: String,
        description: String? = nil,
        enabled: Bool,
        accountId: String,
        accountName: String? = nil,
        pluginId: String,
        targets: [JitPolicyTarget],
        maxDurationMinutes: Int,
        defaultDurationMinutes: Int,
        requestTimeoutMinutes: Int,
        requesterUserIds: [String],
        requesterRoleIds: [String],
        approverUserIds: [String],
        approverRoleIds: [String],
        approverOnCallScheduleIds: [String],
        allowSelfApprovalDuringIncident: Bool,
        requireReason: Bool,
        requireTicket: Bool,
        createdAt: String,
        updatedAt: String,
        labels: JitProviderLabels? = nil,
        canRequest: Bool? = nil
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.enabled = enabled
        self.accountId = accountId
        self.accountName = accountName
        self.pluginId = pluginId
        self.targets = targets
        self.maxDurationMinutes = maxDurationMinutes
        self.defaultDurationMinutes = defaultDurationMinutes
        self.requestTimeoutMinutes = requestTimeoutMinutes
        self.requesterUserIds = requesterUserIds
        self.requesterRoleIds = requesterRoleIds
        self.approverUserIds = approverUserIds
        self.approverRoleIds = approverRoleIds
        self.approverOnCallScheduleIds = approverOnCallScheduleIds
        self.allowSelfApprovalDuringIncident = allowSelfApprovalDuringIncident
        self.requireReason = requireReason
        self.requireTicket = requireTicket
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.labels = labels
        self.canRequest = canRequest
    }
}
