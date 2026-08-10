/*
 * InfrawrenchSDK v1.7.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.7.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SshFanoutTarget: Codable, Hashable, Sendable {
    public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case account
        case resource
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "account": self = .account
            case "resource": self = .resource
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .account: return "account"
            case .resource: return "resource"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Kind] = [
            .account,
            .resource,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var kind: Kind
    public var id: String
    public var accountId: String
    public var label: String
    public var pluginId: String
    public var resourceTypeId: String?
    public var host: String?
    public var defaultUsername: String?
    public var running: Bool
    public var needsKey: Bool
    public var tags: [String]

    public init(
        kind: Kind,
        id: String,
        accountId: String,
        label: String,
        pluginId: String,
        resourceTypeId: String? = nil,
        host: String? = nil,
        defaultUsername: String? = nil,
        running: Bool,
        needsKey: Bool,
        tags: [String]
    ) {
        self.kind = kind
        self.id = id
        self.accountId = accountId
        self.label = label
        self.pluginId = pluginId
        self.resourceTypeId = resourceTypeId
        self.host = host
        self.defaultUsername = defaultUsername
        self.running = running
        self.needsKey = needsKey
        self.tags = tags
    }
}
