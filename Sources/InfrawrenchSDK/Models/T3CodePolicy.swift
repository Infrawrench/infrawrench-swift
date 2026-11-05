/*
 * InfrawrenchSDK v1.91.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.91.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// The organization's T3 Code managed policy, installed on every T3 Code server
/// (`/etc/t3code/policy.json`). On save: omit to keep the stored policy, `null`
/// to remove it. A new T3 Code session is refused when the policy does not allow
/// its tool or turns off the T3 Connect it is reached through.
///
/// The API may send `null` in place of this, which is why references to it are
/// optional.
public struct T3CodePolicy: Codable, Hashable, Sendable {
    public struct SettingsValue: Codable, Hashable, Sendable {
        public var value: JSONValue?
        public var locked: Bool

        public init(
            value: JSONValue? = nil,
            locked: Bool
        ) {
            self.value = value
            self.locked = locked
        }
    }

    public struct Limits: Codable, Hashable, Sendable {
        public enum MaxRuntimeMode: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case approvalRequired
            case autoAcceptEdits
            case auto
            case fullAccess
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "approval-required": self = .approvalRequired
                case "auto-accept-edits": self = .autoAcceptEdits
                case "auto": self = .auto
                case "full-access": self = .fullAccess
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .approvalRequired: return "approval-required"
                case .autoAcceptEdits: return "auto-accept-edits"
                case .auto: return "auto"
                case .fullAccess: return "full-access"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [MaxRuntimeMode] = [
                .approvalRequired,
                .autoAcceptEdits,
                .auto,
                .fullAccess,
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
            case desktop
            case localBrowser
            case remote
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "desktop": self = .desktop
                case "local-browser": self = .localBrowser
                case "remote": self = .remote
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .desktop: return "desktop"
                case .localBrowser: return "local-browser"
                case .remote: return "remote"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Client2] = [
                .desktop,
                .localBrowser,
                .remote,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public struct Providers: Codable, Hashable, Sendable {
            public var allowedDrivers: [String]?
            public var instances: [String: T3CodePolicyProviderInstance]?

            public init(
                allowedDrivers: [String]? = nil,
                instances: [String: T3CodePolicyProviderInstance]? = nil
            ) {
                self.allowedDrivers = allowedDrivers
                self.instances = instances
            }
        }

        public struct Updates: Codable, Hashable, Sendable {
            public enum Mode: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
                case auto
                case off
                /// A value the API added after this SDK was generated. Kept
                /// rather than rejected, so a new server-side value cannot break
                /// decoding.
                case unrecognized(String)

                public init(rawValue: String) {
                    switch rawValue {
                    case "auto": self = .auto
                    case "off": self = .off
                    default: self = .unrecognized(rawValue)
                    }
                }

                public var rawValue: String {
                    switch self {
                    case .auto: return "auto"
                    case .off: return "off"
                    case .unrecognized(let value): return value
                    }
                }

                /// Every value the spec declares. `unrecognized` is deliberately absent.
                public static let allKnownCases: [Mode] = [
                    .auto,
                    .off,
                ]

                public init(from decoder: any Decoder) throws {
                    self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
                }

                public func encode(to encoder: any Encoder) throws {
                    var container = encoder.singleValueContainer()
                    try container.encode(rawValue)
                }
            }

            public var mode: Mode
            public var feedUrl: String?
            public var allowNightly: Bool?

            public init(
                mode: Mode,
                feedUrl: String? = nil,
                allowNightly: Bool? = nil
            ) {
                self.mode = mode
                self.feedUrl = feedUrl
                self.allowNightly = allowNightly
            }
        }

        public var maxRuntimeMode: MaxRuntimeMode?
        /// Must include `remote`: agent VMs are only reachable remotely.
        public var clients: [Client2]?
        public var connect: Bool?
        public var webhookTasks: Bool?
        public var telemetry: Bool?
        public var browserCookieImport: Bool?
        public var providers: Providers?
        public var updates: Updates?

        public init(
            maxRuntimeMode: MaxRuntimeMode? = nil,
            clients: [Client2]? = nil,
            connect: Bool? = nil,
            webhookTasks: Bool? = nil,
            telemetry: Bool? = nil,
            browserCookieImport: Bool? = nil,
            providers: Providers? = nil,
            updates: Updates? = nil
        ) {
            self.maxRuntimeMode = maxRuntimeMode
            self.clients = clients
            self.connect = connect
            self.webhookTasks = webhookTasks
            self.telemetry = telemetry
            self.browserCookieImport = browserCookieImport
            self.providers = providers
            self.updates = updates
        }
    }

    public var schemaVersion: Double
    /// Shown to users as "Managed by <organization>".
    public var organization: String
    public var supportUrl: String?
    /// Keyed by the setting's dot path in T3 Code's settings.json. `locked:
    /// false` sets a default users can change; `locked: true` pins it.
    public var settings: [String: SettingsValue]?
    public var limits: Limits?

    public init(
        schemaVersion: Double,
        organization: String,
        supportUrl: String? = nil,
        settings: [String: SettingsValue]? = nil,
        limits: Limits? = nil
    ) {
        self.schemaVersion = schemaVersion
        self.organization = organization
        self.supportUrl = supportUrl
        self.settings = settings
        self.limits = limits
    }
}
