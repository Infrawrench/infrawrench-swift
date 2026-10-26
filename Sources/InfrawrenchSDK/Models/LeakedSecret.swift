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

public struct LeakedSecret: Codable, Hashable, Sendable {
    public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case open
        case rotated
        case dismissed
        case resolved
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "open": self = .open
            case "rotated": self = .rotated
            case "dismissed": self = .dismissed
            case "resolved": self = .resolved
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .open: return "open"
            case .rotated: return "rotated"
            case .dismissed: return "dismissed"
            case .resolved: return "resolved"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .open,
            .rotated,
            .dismissed,
            .resolved,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum UpstreamState: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case open
        case resolved
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "open": self = .open
            case "resolved": self = .resolved
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .open: return "open"
            case .resolved: return "resolved"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [UpstreamState] = [
            .open,
            .resolved,
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

    public struct Rotation: Codable, Hashable, Sendable {
        public enum Mode: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case reissue
            case replace
            case account
            case manual
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "reissue": self = .reissue
                case "replace": self = .replace
                case "account": self = .account
                case "manual": self = .manual
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .reissue: return "reissue"
                case .replace: return "replace"
                case .account: return "account"
                case .manual: return "manual"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Mode] = [
                .reissue,
                .replace,
                .account,
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

        /// `reissue`: one call rotates it. `replace`: send the new value.
        /// `account`: rotate it at the provider and update the account; the
        /// change is detected. `manual`: rotate it at the provider and mark it
        /// rotated.
        public var mode: Mode
        /// The provider's own key management page.
        public var manageUrl: String?

        public init(
            mode: Mode,
            manageUrl: String? = nil
        ) {
            self.mode = mode
            self.manageUrl = manageUrl
        }
    }

    public enum RotationMethod: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
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
        public static let allKnownCases: [RotationMethod] = [
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

    public enum DismissedReason: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case falsePositive
        case wontFix
        case usedInTests
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "false-positive": self = .falsePositive
            case "wont-fix": self = .wontFix
            case "used-in-tests": self = .usedInTests
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .falsePositive: return "false-positive"
            case .wontFix: return "wont-fix"
            case .usedInTests: return "used-in-tests"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [DismissedReason] = [
            .falsePositive,
            .wontFix,
            .usedInTests,
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
    /// `open` needs rotating; `rotated` was rotated through Infrawrench or
    /// detected because the stored value changed; `dismissed` was accepted as not
    /// a risk; `resolved` was closed on the scanner by someone else before it was
    /// rotated here.
    public var status: Status
    /// The scanner account (GitHub, GitLab) the finding came from.
    public var scannerAccountId: String
    public var scannerAccountName: String
    public var scannerPluginId: String
    /// The scanner's identifier for the token type.
    public var tokenType: String
    public var tokenTypeLabel: String
    /// The plugin that issues this kind of token.
    public var ownerPluginId: String?
    public var ownerPluginName: String?
    /// At most the first and last four characters. The secret itself is never
    /// stored or returned.
    public var secretHint: String?
    public var repository: String?
    public var path: String?
    public var line: Int?
    public var commitSha: String?
    /// The finding on the scanner.
    public var url: String?
    public var upstreamState: UpstreamState
    public var upstreamResolution: String?
    public var validity: Validity?
    public var publiclyLeaked: Bool
    public var detectedAt: String
    public var firstSeenAt: String
    /// What the leak was matched to: an account credential, a secret stored on a
    /// resource, a resource output other resources reference, or nothing
    /// Infrawrench holds.
    public var matchKind: MatchKind
    /// `fingerprint`: the leaked value equals a stored one (compared by keyed
    /// hash, never by value). `token-type`: the scanner withheld the value, so
    /// only the token's issuer is known.
    public var matchConfidence: MatchConfidence
    public var matchedAccountId: String?
    public var matchedAccountName: String?
    public var matchedResourceId: String?
    public var matchedResourceName: String?
    public var matchedResourceTypeId: String?
    public var matchedPluginId: String?
    public var matchedFieldKey: String?
    /// Accounts it may belong to when a token-type match is ambiguous.
    public var candidateAccountIds: [String]
    public var rotation: Rotation
    public var rotatedAt: String?
    public var rotatedBy: String?
    public var rotationMethod: RotationMethod?
    public var dismissedReason: DismissedReason?
    public var dismissedComment: String?
    public var dismissedAt: String?
    public var dismissedBy: String?
    public var upstreamResolvedAt: String?
    public var upstreamResolveError: String?
    public var canResolveUpstream: Bool

    public init(
        id: String,
        status: Status,
        scannerAccountId: String,
        scannerAccountName: String,
        scannerPluginId: String,
        tokenType: String,
        tokenTypeLabel: String,
        ownerPluginId: String? = nil,
        ownerPluginName: String? = nil,
        secretHint: String? = nil,
        repository: String? = nil,
        path: String? = nil,
        line: Int? = nil,
        commitSha: String? = nil,
        url: String? = nil,
        upstreamState: UpstreamState,
        upstreamResolution: String? = nil,
        validity: Validity? = nil,
        publiclyLeaked: Bool,
        detectedAt: String,
        firstSeenAt: String,
        matchKind: MatchKind,
        matchConfidence: MatchConfidence,
        matchedAccountId: String? = nil,
        matchedAccountName: String? = nil,
        matchedResourceId: String? = nil,
        matchedResourceName: String? = nil,
        matchedResourceTypeId: String? = nil,
        matchedPluginId: String? = nil,
        matchedFieldKey: String? = nil,
        candidateAccountIds: [String],
        rotation: Rotation,
        rotatedAt: String? = nil,
        rotatedBy: String? = nil,
        rotationMethod: RotationMethod? = nil,
        dismissedReason: DismissedReason? = nil,
        dismissedComment: String? = nil,
        dismissedAt: String? = nil,
        dismissedBy: String? = nil,
        upstreamResolvedAt: String? = nil,
        upstreamResolveError: String? = nil,
        canResolveUpstream: Bool
    ) {
        self.id = id
        self.status = status
        self.scannerAccountId = scannerAccountId
        self.scannerAccountName = scannerAccountName
        self.scannerPluginId = scannerPluginId
        self.tokenType = tokenType
        self.tokenTypeLabel = tokenTypeLabel
        self.ownerPluginId = ownerPluginId
        self.ownerPluginName = ownerPluginName
        self.secretHint = secretHint
        self.repository = repository
        self.path = path
        self.line = line
        self.commitSha = commitSha
        self.url = url
        self.upstreamState = upstreamState
        self.upstreamResolution = upstreamResolution
        self.validity = validity
        self.publiclyLeaked = publiclyLeaked
        self.detectedAt = detectedAt
        self.firstSeenAt = firstSeenAt
        self.matchKind = matchKind
        self.matchConfidence = matchConfidence
        self.matchedAccountId = matchedAccountId
        self.matchedAccountName = matchedAccountName
        self.matchedResourceId = matchedResourceId
        self.matchedResourceName = matchedResourceName
        self.matchedResourceTypeId = matchedResourceTypeId
        self.matchedPluginId = matchedPluginId
        self.matchedFieldKey = matchedFieldKey
        self.candidateAccountIds = candidateAccountIds
        self.rotation = rotation
        self.rotatedAt = rotatedAt
        self.rotatedBy = rotatedBy
        self.rotationMethod = rotationMethod
        self.dismissedReason = dismissedReason
        self.dismissedComment = dismissedComment
        self.dismissedAt = dismissedAt
        self.dismissedBy = dismissedBy
        self.upstreamResolvedAt = upstreamResolvedAt
        self.upstreamResolveError = upstreamResolveError
        self.canResolveUpstream = canResolveUpstream
    }
}
