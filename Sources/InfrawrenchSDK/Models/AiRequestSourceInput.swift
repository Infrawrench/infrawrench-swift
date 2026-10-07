/*
 * InfrawrenchSDK v1.76.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.76.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AiRequestSourceInput: Codable, Hashable, Sendable {
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

    public var name: String
    public var kind: Kind
    /// Required for `plugin` sources.
    public var accountId: String?
    public var sourceKindId: String
    /// What the location picker returned, plus `prefix` where the kind accepts
    /// one.
    public var location: [String: String]
    public var enabled: Bool
    public var lookbackDays: Int
    /// LiteLLM only: the proxy's https URL.
    public var baseUrl: String?
    /// LiteLLM only. Write-only; omit on update to keep the stored key.
    public var apiKey: String?

    public init(
        name: String,
        kind: Kind,
        accountId: String? = nil,
        sourceKindId: String,
        location: [String: String],
        enabled: Bool,
        lookbackDays: Int,
        baseUrl: String? = nil,
        apiKey: String? = nil
    ) {
        self.name = name
        self.kind = kind
        self.accountId = accountId
        self.sourceKindId = sourceKindId
        self.location = location
        self.enabled = enabled
        self.lookbackDays = lookbackDays
        self.baseUrl = baseUrl
        self.apiKey = apiKey
    }
}
