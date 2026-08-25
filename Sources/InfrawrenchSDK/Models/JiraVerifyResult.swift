/*
 * InfrawrenchSDK v1.35.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.35.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct JiraVerifyResult: Codable, Hashable, Sendable {
    public var ok: Bool
    public var accountId: String
    public var displayName: String
    public var emailAddress: String?

    public init(
        ok: Bool,
        accountId: String,
        displayName: String,
        emailAddress: String? = nil
    ) {
        self.ok = ok
        self.accountId = accountId
        self.displayName = displayName
        self.emailAddress = emailAddress
    }
}
