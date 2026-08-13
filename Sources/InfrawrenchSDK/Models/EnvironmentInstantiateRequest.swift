/*
 * InfrawrenchSDK v1.24.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.24.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct EnvironmentInstantiateRequest: Codable, Hashable, Sendable {
    public var name: String
    public var parameters: [String: String]?
    /// Required. Capped by the org's `maxTtlHours` setting and by a 720-hour
    /// ceiling.
    public var ttlHours: Double
    public var accountOverrides: [String: String]?
    public var note: String?

    public init(
        name: String,
        parameters: [String: String]? = nil,
        ttlHours: Double,
        accountOverrides: [String: String]? = nil,
        note: String? = nil
    ) {
        self.name = name
        self.parameters = parameters
        self.ttlHours = ttlHours
        self.accountOverrides = accountOverrides
        self.note = note
    }
}
