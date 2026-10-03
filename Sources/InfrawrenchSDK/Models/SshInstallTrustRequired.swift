/*
 * InfrawrenchSDK v1.40.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.40.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SshInstallTrustRequired: Codable, Hashable, Sendable {
    public enum Error2: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case sshHostKeyTrustRequired
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "ssh_host_key_trust_required": self = .sshHostKeyTrustRequired
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .sshHostKeyTrustRequired: return "ssh_host_key_trust_required"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Error2] = [
            .sshHostKeyTrustRequired,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case unknown
        case mismatch
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "unknown": self = .unknown
            case "mismatch": self = .mismatch
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .unknown: return "unknown"
            case .mismatch: return "mismatch"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Kind] = [
            .unknown,
            .mismatch,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var error: Error2
    public var message: String
    public var kind: Kind
    public var host: String
    public var port: Int
    public var presentedFingerprint: String
    public var storedFingerprint: String?

    public init(
        error: Error2,
        message: String,
        kind: Kind,
        host: String,
        port: Int,
        presentedFingerprint: String,
        storedFingerprint: String? = nil
    ) {
        self.error = error
        self.message = message
        self.kind = kind
        self.host = host
        self.port = port
        self.presentedFingerprint = presentedFingerprint
        self.storedFingerprint = storedFingerprint
    }
}
