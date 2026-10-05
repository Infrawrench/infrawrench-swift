/*
 * InfrawrenchSDK v1.55.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.55.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// What sends a finding to this route's repository: the cost centre the
/// organization's allocation rules place its resource in, or a tag on the
/// resource. Allocation rules that match on `service` cannot be judged from a
/// resource and never match here.
///
/// The spec allows several shapes here. Decoding tries the branches in spec
/// order, so the most specific match wins.
public enum GithubIssueRouteMatch: Codable, Hashable, Sendable {
    public struct GithubIssueRouteMatchObject: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case costCentre
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "cost_centre": self = .costCentre
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .costCentre: return "cost_centre"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .costCentre,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var kind: Kind
        /// A cost centre id.
        public var costCentreId: String

        public init(
            kind: Kind,
            costCentreId: String
        ) {
            self.kind = kind
            self.costCentreId = costCentreId
        }
    }

    public struct GithubIssueRouteMatchObject2: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case tag
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "tag": self = .tag
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .tag: return "tag"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .tag,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var kind: Kind
        public var tagKey: String
        /// Null matches any value of the key.
        public var tagValue: String?

        public init(
            kind: Kind,
            tagKey: String,
            tagValue: String? = nil
        ) {
            self.kind = kind
            self.tagKey = tagKey
            self.tagValue = tagValue
        }
    }

    case object(GithubIssueRouteMatchObject)
    case object2(GithubIssueRouteMatchObject2)
    /// A shape none of the branches above matched.
    case other(JSONValue)

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(GithubIssueRouteMatchObject.self) {
            self = .object(value)
            return
        }
        if let value = try? container.decode(GithubIssueRouteMatchObject2.self) {
            self = .object2(value)
            return
        }
        self = .other(try container.decode(JSONValue.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .object(let value): try container.encode(value)
        case .object2(let value): try container.encode(value)
        case .other(let value): try container.encode(value)
        }
    }
}
