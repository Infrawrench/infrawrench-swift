/*
 * InfrawrenchSDK v1.9.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.9.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SshFanoutHostResult: Codable, Hashable, Sendable {
    public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case account
        case resource
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "account": self = .account
            case "resource": self = .resource
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .account: return "account"
            case .resource: return "resource"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Kind] = [
            .account,
            .resource,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case done
        case error
        case blocked
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "done": self = .done
            case "error": self = .error
            case "blocked": self = .blocked
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .done: return "done"
            case .error: return "error"
            case .blocked: return "blocked"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .done,
            .error,
            .blocked,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public struct HostKeyTrust: Codable, Hashable, Sendable {
        public enum Kind2: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case unknown
            case mismatch
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
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
            public static let allKnownCases: [Kind2] = [
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

        public var kind: Kind2
        public var host: String
        public var port: Int
        public var presentedFingerprint: String
        public var storedFingerprint: String?

        public init(
            kind: Kind2,
            host: String,
            port: Int,
            presentedFingerprint: String,
            storedFingerprint: String? = nil
        ) {
            self.kind = kind
            self.host = host
            self.port = port
            self.presentedFingerprint = presentedFingerprint
            self.storedFingerprint = storedFingerprint
        }
    }

    public var kind: Kind
    public var targetId: String
    public var label: String
    public var status: Status
    public var exitCode: Int?
    public var stdout: String
    public var stderr: String
    public var error: String?
    public var durationMs: Double
    public var hostKeyTrust: HostKeyTrust?

    public init(
        kind: Kind,
        targetId: String,
        label: String,
        status: Status,
        exitCode: Int? = nil,
        stdout: String,
        stderr: String,
        error: String? = nil,
        durationMs: Double,
        hostKeyTrust: HostKeyTrust? = nil
    ) {
        self.kind = kind
        self.targetId = targetId
        self.label = label
        self.status = status
        self.exitCode = exitCode
        self.stdout = stdout
        self.stderr = stderr
        self.error = error
        self.durationMs = durationMs
        self.hostKeyTrust = hostKeyTrust
    }
}
