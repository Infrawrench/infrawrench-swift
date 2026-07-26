/*
 * InfrawrenchSDK v0.3.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.3.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct Bastion: Codable, Hashable, Sendable {
    public var id: String
    public var name: String
    public var tokenPrefix: String
    public var agentVersion: String?
    public var lastSeenAt: String?
    public var status: BastionStatus
    public var revokedAt: String?
    public var createdAt: String
    public var createdByUserId: String
    public var connected: Bool
    public var accountCount: Int

    public init(
        id: String,
        name: String,
        tokenPrefix: String,
        agentVersion: String? = nil,
        lastSeenAt: String? = nil,
        status: BastionStatus,
        revokedAt: String? = nil,
        createdAt: String,
        createdByUserId: String,
        connected: Bool,
        accountCount: Int
    ) {
        self.id = id
        self.name = name
        self.tokenPrefix = tokenPrefix
        self.agentVersion = agentVersion
        self.lastSeenAt = lastSeenAt
        self.status = status
        self.revokedAt = revokedAt
        self.createdAt = createdAt
        self.createdByUserId = createdByUserId
        self.connected = connected
        self.accountCount = accountCount
    }
}
