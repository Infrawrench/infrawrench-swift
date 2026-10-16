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

public struct ProviderOAuthAuthorizeResponse: Codable, Hashable, Sendable {
    /// The provider's consent URL. Open it in a popup (web) or the system browser
    /// (desktop); it is valid for 15 minutes.
    public var url: String

    public init(
        url: String
    ) {
        self.url = url
    }
}
