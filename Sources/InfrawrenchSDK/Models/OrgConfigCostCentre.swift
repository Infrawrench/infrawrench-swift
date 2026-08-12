/*
 * InfrawrenchSDK v1.18.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.18.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct OrgConfigCostCentre: Codable, Hashable, Sendable {
    public struct Rule: Codable, Hashable, Sendable {
        public struct Match: Codable, Hashable, Sendable {
            public var tagKey: String?
            public var tagValue: String?
            /// Account display name.
            public var account: String?
            public var pluginId: String?
            public var service: String?

            public init(
                tagKey: String? = nil,
                tagValue: String? = nil,
                account: String? = nil,
                pluginId: String? = nil,
                service: String? = nil
            ) {
                self.tagKey = tagKey
                self.tagValue = tagValue
                self.account = account
                self.pluginId = pluginId
                self.service = service
            }
        }

        public var priority: Int
        public var match: Match?

        public init(
            priority: Int,
            match: Match? = nil
        ) {
            self.priority = priority
            self.match = match
        }
    }

    /// Stable slug identifying this entity across organizations. Derived from the
    /// name on export; it is what an apply matches on, so renaming an entity
    /// while keeping its key is a rename rather than a delete-and-create.
    public var key: String
    public var name: String
    public var description: String?
    public var rules: [Rule]?

    public init(
        key: String,
        name: String,
        description: String? = nil,
        rules: [Rule]? = nil
    ) {
        self.key = key
        self.name = name
        self.description = description
        self.rules = rules
    }
}
