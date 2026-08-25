/*
 * InfrawrenchSDK v1.37.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.37.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct StatusPageCustomHostnameAttach: Codable, Hashable, Sendable {
    /// Subdomain to attach, e.g. status.example.com. Apex domains are not
    /// supported.
    public var hostname: String

    public init(
        hostname: String
    ) {
        self.hostname = hostname
    }
}
