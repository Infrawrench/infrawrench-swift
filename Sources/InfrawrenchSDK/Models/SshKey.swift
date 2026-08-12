/*
 * InfrawrenchSDK v1.22.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.22.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SshKey: Codable, Hashable, Sendable {
    public var id: String
    public var name: String
    public var keyType: SshKeyType
    public var isImported: Bool
    public var fingerprint: String?
    public var publicKey: String
    public var userId: String
    public var ownerEmail: String
    public var ownerName: String
    public var createdAt: String

    public init(
        id: String,
        name: String,
        keyType: SshKeyType,
        isImported: Bool,
        fingerprint: String? = nil,
        publicKey: String,
        userId: String,
        ownerEmail: String,
        ownerName: String,
        createdAt: String
    ) {
        self.id = id
        self.name = name
        self.keyType = keyType
        self.isImported = isImported
        self.fingerprint = fingerprint
        self.publicKey = publicKey
        self.userId = userId
        self.ownerEmail = ownerEmail
        self.ownerName = ownerName
        self.createdAt = createdAt
    }
}
