/*
 * InfrawrenchSDK v1.100.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.100.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct TunnelSshAttachRequest: Codable, Hashable, Sendable {
    public struct Tunnel: Codable, Hashable, Sendable {
        public var accountId: String
        public var pluginId: String
        public var resourceId: String

        public init(
            accountId: String,
            pluginId: String,
            resourceId: String
        ) {
            self.accountId = accountId
            self.pluginId = pluginId
            self.resourceId = resourceId
        }
    }

    public struct Host: Codable, Hashable, Sendable {
        public var accountId: String
        public var pluginId: String
        public var resourceTypeId: String
        public var resourceId: String

        public init(
            accountId: String,
            pluginId: String,
            resourceTypeId: String,
            resourceId: String
        ) {
            self.accountId = accountId
            self.pluginId = pluginId
            self.resourceTypeId = resourceTypeId
            self.resourceId = resourceId
        }
    }

    public enum ServiceType: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case http
        case https
        case ssh
        case tcp
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "http": self = .http
            case "https": self = .https
            case "ssh": self = .ssh
            case "tcp": self = .tcp
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .http: return "http"
            case .https: return "https"
            case .ssh: return "ssh"
            case .tcp: return "tcp"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [ServiceType] = [
            .http,
            .https,
            .ssh,
            .tcp,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var tunnel: Tunnel
    public var host: Host
    public var hostname: String
    public var zoneId: String
    public var serviceType: ServiceType?
    public var port: String?
    public var sshUsername: String
    public var sshKeyId: String?

    public init(
        tunnel: Tunnel,
        host: Host,
        hostname: String,
        zoneId: String,
        serviceType: ServiceType? = nil,
        port: String? = nil,
        sshUsername: String,
        sshKeyId: String? = nil
    ) {
        self.tunnel = tunnel
        self.host = host
        self.hostname = hostname
        self.zoneId = zoneId
        self.serviceType = serviceType
        self.port = port
        self.sshUsername = sshUsername
        self.sshKeyId = sshKeyId
    }
}
