/*
 * InfrawrenchSDK v1.48.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.48.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// The caller's cost visibility scope. Every cost read enforces it server-side.
public struct CostVisibilitySummary: Codable, Hashable, Sendable {
    /// False means the caller sees every cost row the organization holds.
    public var restricted: Bool
    /// Every scope that applies to the caller. A cost row must match all of them.
    public var sources: [CostVisibilitySource]

    public init(
        restricted: Bool,
        sources: [CostVisibilitySource]
    ) {
        self.restricted = restricted
        self.sources = sources
    }
}
