/*
 * InfrawrenchSDK v1.9.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.9.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct DnsRecord: Codable, Hashable, Sendable {
    public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case owned
        case dangling
        case external
        case notAnalysed
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "owned": self = .owned
            case "dangling": self = .dangling
            case "external": self = .external
            case "not-analysed": self = .notAnalysed
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .owned: return "owned"
            case .dangling: return "dangling"
            case .external: return "external"
            case .notAnalysed: return "not-analysed"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .owned,
            .dangling,
            .external,
            .notAnalysed,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// Infrawrench resource id of the record itself.
    public var resourceId: String
    public var pluginId: PluginId
    public var pluginName: String
    public var resourceTypeId: String
    public var resourceTypeName: String
    public var accountId: String
    public var accountName: String
    /// Owning zone's resource id, or null when the record could not be
    /// attributed.
    public var zoneResourceId: String?
    public var zoneDomain: String?
    /// Fully qualified, lowercased, no trailing dot.
    public var name: String
    public var type: String
    public var ttl: Double?
    public var priority: Double?
    /// Whether the provider proxies the record (Cloudflare's orange cloud).
    public var proxied: Bool
    public var targets: [DnsRecordTarget]
    /// Worst classification across `targets`.
    public var status: Status

    public init(
        resourceId: String,
        pluginId: PluginId,
        pluginName: String,
        resourceTypeId: String,
        resourceTypeName: String,
        accountId: String,
        accountName: String,
        zoneResourceId: String? = nil,
        zoneDomain: String? = nil,
        name: String,
        type: String,
        ttl: Double? = nil,
        priority: Double? = nil,
        proxied: Bool,
        targets: [DnsRecordTarget],
        status: Status
    ) {
        self.resourceId = resourceId
        self.pluginId = pluginId
        self.pluginName = pluginName
        self.resourceTypeId = resourceTypeId
        self.resourceTypeName = resourceTypeName
        self.accountId = accountId
        self.accountName = accountName
        self.zoneResourceId = zoneResourceId
        self.zoneDomain = zoneDomain
        self.name = name
        self.type = type
        self.ttl = ttl
        self.priority = priority
        self.proxied = proxied
        self.targets = targets
        self.status = status
    }
}
