/*
 * InfrawrenchSDK v1.20.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.20.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Supply all three to test credentials that have not been saved yet; send an
/// empty object to re-test the stored ones.
public struct JiraVerifyInput: Codable, Hashable, Sendable {
    public var siteUrl: String?
    public var accountEmail: String?
    public var apiToken: String?

    public init(
        siteUrl: String? = nil,
        accountEmail: String? = nil,
        apiToken: String? = nil
    ) {
        self.siteUrl = siteUrl
        self.accountEmail = accountEmail
        self.apiToken = apiToken
    }
}
