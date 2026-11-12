/*
 * InfrawrenchSDK v1.103.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.103.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct PluginSummary: Codable, Hashable, Sendable {
    public struct SshTunnel: Codable, Hashable, Sendable {
        public var label: String
        public var defaultPort: Int
        /// What an account tunneled to this service stores; `{port}` stands for
        /// the local end of the tunnel.
        public var credentials: [String: String]

        public init(
            label: String,
            defaultPort: Int,
            credentials: [String: String]
        ) {
            self.label = label
            self.defaultPort = defaultPort
            self.credentials = credentials
        }
    }

    public enum KvBrowser: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case keys
        case documents
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "keys": self = .keys
            case "documents": self = .documents
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .keys: return "keys"
            case .documents: return "documents"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [KvBrowser] = [
            .keys,
            .documents,
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
    public var displayName: String
    public var logoSvg: String
    public var credentialFields: [CredentialField]
    public var preflight: JSONValue
    public var oauth: PluginOAuthSummary?
    /// Present when the plugin can be reached through an SSH tunnel to a remote
    /// host.
    public var sshTunnel: SshTunnel?
    /// This plugin's accounts are SSH hosts that other accounts can connect
    /// through.
    public var jumpHost: Bool?
    /// Which browser the plugin's connections open: `documents` for collections
    /// of JSON documents, `keys` for the key-value console. Absent means `keys`,
    /// or that the plugin has no key-value driver.
    public var kvBrowser: KvBrowser?

    public init(
        id: String,
        displayName: String,
        logoSvg: String,
        credentialFields: [CredentialField],
        preflight: JSONValue,
        oauth: PluginOAuthSummary? = nil,
        sshTunnel: SshTunnel? = nil,
        jumpHost: Bool? = nil,
        kvBrowser: KvBrowser? = nil
    ) {
        self.id = id
        self.displayName = displayName
        self.logoSvg = logoSvg
        self.credentialFields = credentialFields
        self.preflight = preflight
        self.oauth = oauth
        self.sshTunnel = sshTunnel
        self.jumpHost = jumpHost
        self.kvBrowser = kvBrowser
    }
}
