/*
 * InfrawrenchSDK v1.68.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.68.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct KubernetesNetworkSettings: Codable, Hashable, Sendable {
    public var accountId: String
    /// Cost query language text selecting this cluster's billed data-transfer
    /// rows, for example `account = 'prod-aws' AND service = 'AWS Data
    /// Transfer'`. Null: none.
    public var billedQuery: String?
    public var updatedAt: String?

    public init(
        accountId: String,
        billedQuery: String? = nil,
        updatedAt: String? = nil
    ) {
        self.accountId = accountId
        self.billedQuery = billedQuery
        self.updatedAt = updatedAt
    }
}
