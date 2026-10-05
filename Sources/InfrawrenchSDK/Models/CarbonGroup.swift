/*
 * InfrawrenchSDK v1.49.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.49.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CarbonGroup: Codable, Hashable, Sendable {
    public var key: String
    public var label: String
    public var kgCo2e: Double
    public var kwh: Double
    public var resourceCount: Int

    public init(
        key: String,
        label: String,
        kgCo2e: Double,
        kwh: Double,
        resourceCount: Int
    ) {
        self.key = key
        self.label = label
        self.kgCo2e = kgCo2e
        self.kwh = kwh
        self.resourceCount = resourceCount
    }
}
