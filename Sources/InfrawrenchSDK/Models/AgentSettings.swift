/*
 * InfrawrenchSDK v0.14.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.14.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// The API may send `null` in place of this, which is why references to it are
/// optional.
public struct AgentSettings: Codable, Hashable, Sendable {
    public enum Tool: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case codex
        case claudeCode
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "codex": self = .codex
            case "claude-code": self = .claudeCode
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .codex: return "codex"
            case .claudeCode: return "claude-code"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Tool] = [
            .codex,
            .claudeCode,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var accountId: String
    public var pluginId: String
    public var resourceTypeId: String
    public var tool: Tool
    public var fields: [String: String]

    public init(
        accountId: String,
        pluginId: String,
        resourceTypeId: String,
        tool: Tool,
        fields: [String: String]
    ) {
        self.accountId = accountId
        self.pluginId = pluginId
        self.resourceTypeId = resourceTypeId
        self.tool = tool
        self.fields = fields
    }
}
