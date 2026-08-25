/*
 * InfrawrenchSDK v1.36.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.36.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct DrillSummary: Codable, Hashable, Sendable {
    /// Resources with something to restore from. A resource with no backup cannot
    /// be drilled, and listing it here would duplicate the coverage page's own
    /// unprotected finding.
    public var eligibleCount: Int
    public var verifiedCount: Int
    public var staleCount: Int
    public var failedCount: Int
    public var neverCount: Int
    /// Over currently-verified rows only; null when nothing is verified, never
    /// zero.
    public var worstRtoMinutes: Int?
    public var medianRtoMinutes: Int?

    public init(
        eligibleCount: Int,
        verifiedCount: Int,
        staleCount: Int,
        failedCount: Int,
        neverCount: Int,
        worstRtoMinutes: Int? = nil,
        medianRtoMinutes: Int? = nil
    ) {
        self.eligibleCount = eligibleCount
        self.verifiedCount = verifiedCount
        self.staleCount = staleCount
        self.failedCount = failedCount
        self.neverCount = neverCount
        self.worstRtoMinutes = worstRtoMinutes
        self.medianRtoMinutes = medianRtoMinutes
    }
}
