/*
 * InfrawrenchSDK v1.23.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.23.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct OrgConfigProbe: Codable, Hashable, Sendable {
    /// Stable slug identifying this entity across organizations. Derived from the
    /// name on export; it is what an apply matches on, so renaming an entity
    /// while keeping its key is a rename rather than a delete-and-create.
    public var key: String
    public var name: String
    public var url: String
    public var method: String?
    public var intervalSeconds: Int?
    public var timeoutMs: Int?
    public var failureThreshold: Int?
    public var enabled: Bool?

    public init(
        key: String,
        name: String,
        url: String,
        method: String? = nil,
        intervalSeconds: Int? = nil,
        timeoutMs: Int? = nil,
        failureThreshold: Int? = nil,
        enabled: Bool? = nil
    ) {
        self.key = key
        self.name = name
        self.url = url
        self.method = method
        self.intervalSeconds = intervalSeconds
        self.timeoutMs = timeoutMs
        self.failureThreshold = failureThreshold
        self.enabled = enabled
    }
}
