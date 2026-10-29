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

public struct ServiceMember: Codable, Hashable, Sendable {
    public enum Source: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case manual
        case rule
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "manual": self = .manual
            case "rule": self = .rule
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .manual: return "manual"
            case .rule: return "rule"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Source] = [
            .manual,
            .rule,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var resourceId: String
    public var accountId: String
    public var accountName: String?
    public var pluginId: PluginId
    public var resourceTypeId: String
    public var resourceName: String
    public var externalId: String?
    public var source: Source
    /// Index into `rules` for `rule` members.
    public var ruleIndex: Int?
    public var owner: ServiceMemberOwner?
    /// The resource was deleted upstream.
    public var missing: Bool

    public init(
        resourceId: String,
        accountId: String,
        accountName: String? = nil,
        pluginId: PluginId,
        resourceTypeId: String,
        resourceName: String,
        externalId: String? = nil,
        source: Source,
        ruleIndex: Int? = nil,
        owner: ServiceMemberOwner? = nil,
        missing: Bool
    ) {
        self.resourceId = resourceId
        self.accountId = accountId
        self.accountName = accountName
        self.pluginId = pluginId
        self.resourceTypeId = resourceTypeId
        self.resourceName = resourceName
        self.externalId = externalId
        self.source = source
        self.ruleIndex = ruleIndex
        self.owner = owner
        self.missing = missing
    }
}
