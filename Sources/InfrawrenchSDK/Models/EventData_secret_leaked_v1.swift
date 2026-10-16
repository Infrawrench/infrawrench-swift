/*
 * InfrawrenchSDK v1.82.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.82.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `data` of a `secret.leaked` event, version 1. A secret scanner found a
/// credential committed to code. Each finding is sent once; the value itself is
/// never included.
public struct EventData_secret_leaked_v1: Codable, Hashable, Sendable {
    public enum MatchKind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case account
        case secretField
        case output
        case none
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "account": self = .account
            case "secret-field": self = .secretField
            case "output": self = .output
            case "none": self = .none
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .account: return "account"
            case .secretField: return "secret-field"
            case .output: return "output"
            case .none: return "none"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [MatchKind] = [
            .account,
            .secretField,
            .output,
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

    public enum MatchConfidence: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case fingerprint
        case tokenType
        case none
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "fingerprint": self = .fingerprint
            case "token-type": self = .tokenType
            case "none": self = .none
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .fingerprint: return "fingerprint"
            case .tokenType: return "token-type"
            case .none: return "none"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [MatchConfidence] = [
            .fingerprint,
            .tokenType,
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

    public enum Validity: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case active
        case inactive
        case unknown
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "active": self = .active
            case "inactive": self = .inactive
            case "unknown": self = .unknown
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .active: return "active"
            case .inactive: return "inactive"
            case .unknown: return "unknown"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Validity] = [
            .active,
            .inactive,
            .unknown,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// Infrawrench leaked secret id.
    public var leakId: String
    /// The scanner's identifier for the token type.
    public var tokenType: String
    /// Human name of the token type.
    public var tokenTypeLabel: String
    /// Plugin that issues this token type.
    public var ownerPluginId: String?
    /// What the leak was matched to.
    public var matchKind: MatchKind
    /// The connected account the leak belongs to.
    public var matchedAccountId: String?
    /// The resource whose stored secret leaked.
    public var matchedResourceId: String?
    /// Plugin of the scanner that found it.
    public var scannerPluginId: String
    /// Scanner account that found it.
    public var scannerAccountId: String
    /// How the match was made.
    public var matchConfidence: MatchConfidence
    /// Repository the secret was found in.
    public var repository: String?
    /// File the secret was found in.
    public var path: String?
    /// The finding on the scanner.
    public var url: String?
    /// The scanner's validity check.
    public var validity: Validity?
    /// The scanner also found it in a public place.
    public var publiclyLeaked: Bool
    /// When the scanner first saw it.
    public var detectedAt: String

    public init(
        leakId: String,
        tokenType: String,
        tokenTypeLabel: String,
        ownerPluginId: String? = nil,
        matchKind: MatchKind,
        matchedAccountId: String? = nil,
        matchedResourceId: String? = nil,
        scannerPluginId: String,
        scannerAccountId: String,
        matchConfidence: MatchConfidence,
        repository: String? = nil,
        path: String? = nil,
        url: String? = nil,
        validity: Validity? = nil,
        publiclyLeaked: Bool,
        detectedAt: String
    ) {
        self.leakId = leakId
        self.tokenType = tokenType
        self.tokenTypeLabel = tokenTypeLabel
        self.ownerPluginId = ownerPluginId
        self.matchKind = matchKind
        self.matchedAccountId = matchedAccountId
        self.matchedResourceId = matchedResourceId
        self.scannerPluginId = scannerPluginId
        self.scannerAccountId = scannerAccountId
        self.matchConfidence = matchConfidence
        self.repository = repository
        self.path = path
        self.url = url
        self.validity = validity
        self.publiclyLeaked = publiclyLeaked
        self.detectedAt = detectedAt
    }
}
