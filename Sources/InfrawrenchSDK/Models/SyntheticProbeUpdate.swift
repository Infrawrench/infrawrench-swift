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

public struct SyntheticProbeUpdate: Codable, Hashable, Sendable {
    public var name: String?
    public var url: String?
    /// HTTP method the probe uses — GET, HEAD or OPTIONS. Unknown values become
    /// GET.
    public var method: String?
    /// Seconds between checks. Clamped server-side to 60–86400.
    public var intervalSeconds: Int?
    /// Per-check timeout in milliseconds. Clamped server-side to 1000–60000.
    public var timeoutMs: Int?
    /// Consecutive failures before the probe flips to `down` and notifies.
    /// Clamped 1–20.
    public var failureThreshold: Int?
    public var enabled: Bool?

    public init(
        name: String? = nil,
        url: String? = nil,
        method: String? = nil,
        intervalSeconds: Int? = nil,
        timeoutMs: Int? = nil,
        failureThreshold: Int? = nil,
        enabled: Bool? = nil
    ) {
        self.name = name
        self.url = url
        self.method = method
        self.intervalSeconds = intervalSeconds
        self.timeoutMs = timeoutMs
        self.failureThreshold = failureThreshold
        self.enabled = enabled
    }
}
