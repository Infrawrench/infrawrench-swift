/*
 * InfrawrenchSDK v1.77.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.77.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct JitPolicyInput: Codable, Hashable, Sendable {
    public var name: String
    public var description: String?
    public var enabled: Bool?
    public var accountId: String
    public var targets: [JitPolicyTarget]
    public var maxDurationMinutes: Int
    public var defaultDurationMinutes: Int?
    public var requestTimeoutMinutes: Int?
    public var requesterUserIds: [String]?
    public var requesterRoleIds: [String]?
    public var approverUserIds: [String]?
    public var approverRoleIds: [String]?
    public var approverOnCallScheduleIds: [String]?
    public var allowSelfApprovalDuringIncident: Bool?
    public var requireReason: Bool?
    public var requireTicket: Bool?

    public init(
        name: String,
        description: String? = nil,
        enabled: Bool? = nil,
        accountId: String,
        targets: [JitPolicyTarget],
        maxDurationMinutes: Int,
        defaultDurationMinutes: Int? = nil,
        requestTimeoutMinutes: Int? = nil,
        requesterUserIds: [String]? = nil,
        requesterRoleIds: [String]? = nil,
        approverUserIds: [String]? = nil,
        approverRoleIds: [String]? = nil,
        approverOnCallScheduleIds: [String]? = nil,
        allowSelfApprovalDuringIncident: Bool? = nil,
        requireReason: Bool? = nil,
        requireTicket: Bool? = nil
    ) {
        self.name = name
        self.description = description
        self.enabled = enabled
        self.accountId = accountId
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
    }
}
