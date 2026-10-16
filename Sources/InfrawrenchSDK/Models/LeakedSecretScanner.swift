/*
 * InfrawrenchSDK v1.82.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.82.0).
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

    public init(
        accountId: String,
        accountName: String,
        pluginId: String,
        label: String,
        canResolve: Bool,
        returnsSecretValue: Bool,
        lastScannedAt: String? = nil,
        lastError: String? = nil,
        lastCount: Int? = nil
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
    }
}
