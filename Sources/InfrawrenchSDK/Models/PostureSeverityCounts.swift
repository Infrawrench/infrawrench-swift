/*
 * InfrawrenchSDK v1.34.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.34.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Live finding count per severity; every bucket present, zeros included.
public struct PostureSeverityCounts: Codable, Hashable, Sendable {
    public var critical: Int
    public var high: Int
    public var medium: Int
    public var low: Int

    public init(
        critical: Int,
        high: Int,
        medium: Int,
        low: Int
    ) {
        self.critical = critical
        self.high = high
        self.medium = medium
        self.low = low
    }
}
