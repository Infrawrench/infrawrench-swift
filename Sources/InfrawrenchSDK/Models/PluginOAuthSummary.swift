/*
 * InfrawrenchSDK v1.81.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.81.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Present only when this server can connect the plugin through provider OAuth
/// (the plugin supports it and the server has a client configured). See `POST
/// /provider-oauth/{pluginId}/authorize`.
public struct PluginOAuthSummary: Codable, Hashable, Sendable {
    public enum Access: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case readOnly
        case readWrite
        case full
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "read-only": self = .readOnly
            case "read-write": self = .readWrite
            case "full": self = .full
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .readOnly: return "read-only"
            case .readWrite: return "read-write"
            case .full: return "full"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Access] = [
            .readOnly,
            .readWrite,
            .full,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum Refresh: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case rotating
        case reusable
        case none
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "rotating": self = .rotating
            case "reusable": self = .reusable
            case "none": self = .none
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .rotating: return "rotating"
            case .reusable: return "reusable"
            case .none: return "none"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Refresh] = [
            .rotating,
            .reusable,
            .none,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum Client2: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case server
        case desktop
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "server": self = .server
            case "desktop": self = .desktop
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .server: return "server"
            case .desktop: return "desktop"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Client2] = [
            .server,
            .desktop,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// What the granted token can do. `full` means the provider offers no
    /// narrower scope.
    public var access: Access
    /// How the server keeps the access token valid: `rotating` and `reusable`
    /// refresh it before expiry, `none` means it does not expire.
    public var refresh: Refresh
    public var docsUrl: String?
    /// The credential field the connection fills with the access token.
    public var tokenField: String
    /// OAuth clients the plugin declares. Always contains `server` here;
    /// `desktop` means the desktop app can also connect accounts it stores
    /// locally.
    public var clients: [Client2]

    public init(
        access: Access,
        refresh: Refresh,
        docsUrl: String? = nil,
        tokenField: String,
        clients: [Client2]
    ) {
        self.access = access
        self.refresh = refresh
        self.docsUrl = docsUrl
        self.tokenField = tokenField
        self.clients = clients
    }
}
