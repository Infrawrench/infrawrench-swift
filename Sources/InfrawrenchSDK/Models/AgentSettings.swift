/*
 * InfrawrenchSDK v1.50.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.50.0).
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

    public enum Surface: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case terminal
        case t3Code
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "terminal": self = .terminal
            case "t3-code": self = .t3Code
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .terminal: return "terminal"
            case .t3Code: return "t3-code"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Surface] = [
            .terminal,
            .t3Code,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum T3Access: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case t3Connect
        case tailscale
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "t3-connect": self = .t3Connect
            case "tailscale": self = .tailscale
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .t3Connect: return "t3-connect"
            case .tailscale: return "tailscale"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [T3Access] = [
            .t3Connect,
            .tailscale,
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
    public var surface: Surface?
    public var fields: [String: String]
    /// Accounts whose plugin installs a service on the VM over SSH after setup
    /// (e.g. Tailscale). See GET /resources/ssh-install/accounts.
    public var serviceAccountIds: [String]?
    public var t3Access: T3Access?

    public init(
        accountId: String,
        pluginId: String,
        resourceTypeId: String,
        tool: Tool,
        surface: Surface? = nil,
        fields: [String: String],
        serviceAccountIds: [String]? = nil,
        t3Access: T3Access? = nil
    ) {
        self.accountId = accountId
        self.pluginId = pluginId
        self.resourceTypeId = resourceTypeId
        self.tool = tool
        self.surface = surface
        self.fields = fields
        self.serviceAccountIds = serviceAccountIds
        self.t3Access = t3Access
    }
}
