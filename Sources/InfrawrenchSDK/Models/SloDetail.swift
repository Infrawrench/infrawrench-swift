/*
 * InfrawrenchSDK v1.78.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.78.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SloDetail: Codable, Hashable, Sendable {
    public var slo: Slo
    /// Hourly events over the window, oldest first.
    public var buckets: [SloBucket]
    public var activeFreeze: SloActiveFreeze?

    public init(
        slo: Slo,
        buckets: [SloBucket],
        activeFreeze: SloActiveFreeze? = nil
    ) {
        self.slo = slo
        self.buckets = buckets
        self.activeFreeze = activeFreeze
    }
}
