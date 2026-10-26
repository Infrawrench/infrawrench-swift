/*
 * InfrawrenchSDK v1.84.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.84.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `data` of a `secret.rotated` event, version 1. A leaked credential was
/// rotated, or its stored value was seen to change.
public struct EventData_secret_rotated_v1: Codable, Hashable, Sendable {
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

    public enum Method: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case reissued
        case replaced
        case detected
        case manual
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "reissued": self = .reissued
            case "replaced": self = .replaced
            case "detected": self = .detected
            case "manual": self = .manual
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .reissued: return "reissued"
            case .replaced: return "replaced"
            case .detected: return "detected"
            case .manual: return "manual"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Method] = [
            .reissued,
            .replaced,
            .detected,
            .manual,
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
    /// How the rotation was recorded.
    public var method: Method
    /// Who rotated it, when a person did.
    public var rotatedBy: String?
    /// The finding was closed on the scanner as revoked.
    public var upstreamResolved: Bool

    public init(
        leakId: String,
        tokenType: String,
        tokenTypeLabel: String,
        ownerPluginId: String? = nil,
        matchKind: MatchKind,
        matchedAccountId: String? = nil,
        matchedResourceId: String? = nil,
        method: Method,
        rotatedBy: String? = nil,
        upstreamResolved: Bool
    ) {
        self.leakId = leakId
        self.tokenType = tokenType
        self.tokenTypeLabel = tokenTypeLabel
        self.ownerPluginId = ownerPluginId
        self.matchKind = matchKind
        self.matchedAccountId = matchedAccountId
        self.matchedResourceId = matchedResourceId
        self.method = method
        self.rotatedBy = rotatedBy
        self.upstreamResolved = upstreamResolved
    }
}
