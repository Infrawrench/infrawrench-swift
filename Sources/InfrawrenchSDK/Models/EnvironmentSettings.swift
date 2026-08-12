/*
 * InfrawrenchSDK v1.22.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.22.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct EnvironmentSettings: Codable, Hashable, Sendable {
    public var maxTtlHours: Int
    public var defaultTtlHours: Int

    public init(
        maxTtlHours: Int,
        defaultTtlHours: Int
    ) {
        self.maxTtlHours = maxTtlHours
        self.defaultTtlHours = defaultTtlHours
    }
}
