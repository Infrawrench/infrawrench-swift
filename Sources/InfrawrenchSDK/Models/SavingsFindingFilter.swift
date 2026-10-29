/*
 * InfrawrenchSDK v1.85.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.85.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Empty lists and blank fields are dropped on write.
public struct SavingsFindingFilter: Codable, Hashable, Sendable {
    public struct Tag: Codable, Hashable, Sendable {
        public var key: String
        public var values: [String]?

        public init(
            key: String,
            values: [String]? = nil
        ) {
            self.key = key
            self.values = values
        }
    }

    public var kinds: [SavingsFindingKind]?
    public var pluginIds: [String]?
    public var accountIds: [String]?
    public var regions: [String]?
    /// Every term must match; a term without values matches any value of the key.
    public var tags: [Tag]?
    public var minMonthlySavings: Double?
    public var detectedFrom: String?
    public var detectedTo: String?
    public var search: String?

    public init(
        kinds: [SavingsFindingKind]? = nil,
        pluginIds: [String]? = nil,
        accountIds: [String]? = nil,
        regions: [String]? = nil,
        tags: [Tag]? = nil,
        minMonthlySavings: Double? = nil,
        detectedFrom: String? = nil,
        detectedTo: String? = nil,
        search: String? = nil
    ) {
        self.kinds = kinds
        self.pluginIds = pluginIds
        self.accountIds = accountIds
        self.regions = regions
        self.tags = tags
        self.minMonthlySavings = minMonthlySavings
        self.detectedFrom = detectedFrom
        self.detectedTo = detectedTo
        self.search = search
    }
}
