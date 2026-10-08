/*
 * InfrawrenchSDK v1.79.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.79.0).
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
public struct PrCheckReport: Codable, Hashable, Sendable {
    public struct File: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case terraform
            case infrafile
            case kubernetes
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "terraform": self = .terraform
                case "infrafile": self = .infrafile
                case "kubernetes": self = .kubernetes
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .terraform: return "terraform"
                case .infrafile: return "infrafile"
                case .kubernetes: return "kubernetes"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .terraform,
                .infrafile,
                .kubernetes,
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
            case added
            case modified
            case removed
            case renamed
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "added": self = .added
                case "modified": self = .modified
                case "removed": self = .removed
                case "renamed": self = .renamed
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .added: return "added"
                case .modified: return "modified"
                case .removed: return "removed"
                case .renamed: return "renamed"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Status] = [
                .added,
                .modified,
                .removed,
                .renamed,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var path: String
        public var kind: Kind
        public var status: Status
        public var analysed: Bool
        public var note: String?

        public init(
            path: String,
            kind: Kind,
            status: Status,
            analysed: Bool,
            note: String? = nil
        ) {
            self.path = path
            self.kind = kind
            self.status = status
            self.analysed = analysed
            self.note = note
        }
    }

    public struct Totals: Codable, Hashable, Sendable {
        public var monthlyDelta: Double?
        public var currency: String?
        public var partial: Bool
        public var pricedChanges: Int
        public var unpricedChanges: Int
        public var otherCurrencyChanges: Int

        public init(
            monthlyDelta: Double? = nil,
            currency: String? = nil,
            partial: Bool,
            pricedChanges: Int,
            unpricedChanges: Int,
            otherCurrencyChanges: Int
        ) {
            self.monthlyDelta = monthlyDelta
            self.currency = currency
            self.partial = partial
            self.pricedChanges = pricedChanges
            self.unpricedChanges = unpricedChanges
            self.otherCurrencyChanges = otherCurrencyChanges
        }
    }

    public struct Blast: Codable, Hashable, Sendable {
        public enum HighestSeverity: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case none
            case low
            case medium
            case high
            case unknown
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "none": self = .none
                case "low": self = .low
                case "medium": self = .medium
                case "high": self = .high
                case "unknown": self = .unknown
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .none: return "none"
                case .low: return "low"
                case .medium: return "medium"
                case .high: return "high"
                case .unknown: return "unknown"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [HighestSeverity] = [
                .none,
                .low,
                .medium,
                .high,
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

        public var touchedResources: Int
        public var dependants: Int
        public var highestSeverity: HighestSeverity?

        public init(
            touchedResources: Int,
            dependants: Int,
            highestSeverity: HighestSeverity? = nil
        ) {
            self.touchedResources = touchedResources
            self.dependants = dependants
            self.highestSeverity = highestSeverity
        }
    }

    public var generatedAt: String
    public var files: [File]
    public var changes: [PrCheckChange]
    public var totals: Totals
    public var blast: Blast
    public var notes: [String]
    public var truncated: Bool

    public init(
        generatedAt: String,
        files: [File],
        changes: [PrCheckChange],
        totals: Totals,
        blast: Blast,
        notes: [String],
        truncated: Bool
    ) {
        self.generatedAt = generatedAt
        self.files = files
        self.changes = changes
        self.totals = totals
        self.blast = blast
        self.notes = notes
        self.truncated = truncated
    }
}
