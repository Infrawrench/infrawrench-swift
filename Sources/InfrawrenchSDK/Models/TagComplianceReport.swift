/*
 * InfrawrenchSDK v1.30.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.30.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct TagComplianceReport: Codable, Hashable, Sendable {
    public var policy: TagPolicy
    public var accounts: [AccountTagCompliance]

    public init(
        policy: TagPolicy,
        accounts: [AccountTagCompliance]
    ) {
        self.policy = policy
        self.accounts = accounts
    }
}
