/*
 * InfrawrenchSDK v1.103.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.103.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct LeakedSecretScanner: Codable, Hashable, Sendable {
    public var accountId: String
    public var accountName: String
    public var pluginId: String
    public var label: String
    public var canResolve: Bool
    public var returnsSecretValue: Bool
    public var lastScannedAt: String?
    public var lastError: String?
    public var lastCount: Int?
    /// The last scan read only part of the scanner's findings (more than one scan
    /// reads, or some could not be read), so a leak may be missing from the list.
    public var lastPartial: Bool

    public init(
        accountId: String,
        accountName: String,
        pluginId: String,
        label: String,
        canResolve: Bool,
        returnsSecretValue: Bool,
        lastScannedAt: String? = nil,
        lastError: String? = nil,
        lastCount: Int? = nil,
        lastPartial: Bool
    ) {
        self.accountId = accountId
        self.accountName = accountName
        self.pluginId = pluginId
        self.label = label
        self.canResolve = canResolve
        self.returnsSecretValue = returnsSecretValue
        self.lastScannedAt = lastScannedAt
        self.lastError = lastError
        self.lastCount = lastCount
        self.lastPartial = lastPartial
    }
}
