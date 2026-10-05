/*
 * InfrawrenchSDK v1.57.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.57.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AiRequestSource: Codable, Hashable, Sendable {
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

    public var id: String
    public var name: String
    public var kind: Kind
    public var pluginId: String?
    public var accountId: String?
    public var accountName: String?
    public var sourceKindId: String
    public var location: [String: String]
    public var enabled: Bool
    public var lookbackDays: Int
    public var baseUrl: String?
    public var hasApiKey: Bool
    public var collectedThrough: String?
    public var lastRunAt: String?
    public var nextRunAt: String?
    public var lastError: String?
    public var lastErrorHelpUrl: String?
    public var failureCount: Int
    public var observedMetadataKeys: [String: Double]
    public var lastQueryBytesScanned: Double?
    public var createdAt: String
    public var updatedAt: String

    public init(
        id: String,
        name: String,
        kind: Kind,
        pluginId: String? = nil,
        accountId: String? = nil,
        accountName: String? = nil,
        sourceKindId: String,
        location: [String: String],
        enabled: Bool,
        lookbackDays: Int,
        baseUrl: String? = nil,
        hasApiKey: Bool,
        collectedThrough: String? = nil,
        lastRunAt: String? = nil,
        nextRunAt: String? = nil,
        lastError: String? = nil,
        lastErrorHelpUrl: String? = nil,
        failureCount: Int,
        observedMetadataKeys: [String: Double],
        lastQueryBytesScanned: Double? = nil,
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
        self.name = name
        self.kind = kind
        self.pluginId = pluginId
        self.accountId = accountId
        self.accountName = accountName
        self.sourceKindId = sourceKindId
        self.location = location
        self.enabled = enabled
        self.lookbackDays = lookbackDays
        self.baseUrl = baseUrl
        self.hasApiKey = hasApiKey
        self.collectedThrough = collectedThrough
        self.lastRunAt = lastRunAt
        self.nextRunAt = nextRunAt
        self.lastError = lastError
        self.lastErrorHelpUrl = lastErrorHelpUrl
        self.failureCount = failureCount
        self.observedMetadataKeys = observedMetadataKeys
        self.lastQueryBytesScanned = lastQueryBytesScanned
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
