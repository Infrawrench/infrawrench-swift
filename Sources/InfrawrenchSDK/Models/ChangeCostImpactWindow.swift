/*
 * InfrawrenchSDK v1.21.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.21.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// The API may send `null` in place of this, which is why references to it are
/// optional.
public struct ChangeCostImpactWindow: Codable, Hashable, Sendable {
    /// Inclusive first UTC day, `YYYY-MM-DD`.
    public var from: String
    /// Inclusive last UTC day.
    public var to: String

    public init(
        from: String,
        to: String
    ) {
        self.from = from
        self.to = to
    }
}
