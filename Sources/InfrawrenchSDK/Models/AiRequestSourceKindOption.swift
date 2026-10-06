/*
 * InfrawrenchSDK v1.75.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.75.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AiRequestSourceKindOption: Codable, Hashable, Sendable {
    public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case plugin
        case litellm
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "plugin": self = .plugin
            case "litellm": self = .litellm
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .plugin: return "plugin"
            case .litellm: return "litellm"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Kind] = [
            .plugin,
            .litellm,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public struct Account2: Codable, Hashable, Sendable {
        public var id: String
        public var name: String

        public init(
            id: String,
            name: String
        ) {
            self.id = id
            self.name = name
        }
    }

    public var kind: Kind
    public var pluginId: String?
    public var pluginName: String?
    public var sourceKindId: String
    public var label: String
    public var description: String
    public var locationLabel: String
    public var maxHistoryDays: Int
    /// Reading this source is billed to the account's own provider (Logs
    /// Insights).
    public var queriesBillable: Bool
    public var acceptsPrefix: Bool
    public var helpUrl: String?
    public var accounts: [Account2]

    public init(
        kind: Kind,
        pluginId: String? = nil,
        pluginName: String? = nil,
        sourceKindId: String,
        label: String,
        description: String,
        locationLabel: String,
        maxHistoryDays: Int,
        queriesBillable: Bool,
        acceptsPrefix: Bool,
        helpUrl: String? = nil,
        accounts: [Account2]
    ) {
        self.kind = kind
        self.pluginId = pluginId
        self.pluginName = pluginName
        self.sourceKindId = sourceKindId
        self.label = label
        self.description = description
        self.locationLabel = locationLabel
        self.maxHistoryDays = maxHistoryDays
        self.queriesBillable = queriesBillable
        self.acceptsPrefix = acceptsPrefix
        self.helpUrl = helpUrl
        self.accounts = accounts
    }
}
