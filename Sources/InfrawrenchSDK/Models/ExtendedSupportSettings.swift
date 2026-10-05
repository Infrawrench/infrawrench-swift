/*
 * InfrawrenchSDK v1.74.1 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.74.1).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ExtendedSupportSettings: Codable, Hashable, Sendable {
    /// Whether the weekly extended-support alert is sent.
    public var enabled: Bool
    /// Days ahead an upcoming surcharge is listed for. Default 90.
    public var leadDays: Int
    /// When the last weekly alert scan completed. Owned by the poller; read-only.
    public var lastNotifiedAt: String?

    public init(
        enabled: Bool,
        leadDays: Int,
        lastNotifiedAt: String? = nil
    ) {
        self.enabled = enabled
        self.leadDays = leadDays
        self.lastNotifiedAt = lastNotifiedAt
    }
}
