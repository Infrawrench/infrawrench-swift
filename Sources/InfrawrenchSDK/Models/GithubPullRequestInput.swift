/*
 * InfrawrenchSDK v1.76.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.76.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct GithubPullRequestInput: Codable, Hashable, Sendable {
    /// The spec allows several shapes here. Decoding tries the branches in spec
    /// order, so the most specific match wins.
    public enum Change: Codable, Hashable, Sendable {
        public struct ChangeObject: Codable, Hashable, Sendable {
            public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
                case resize
                /// A value the API added after this SDK was generated. Kept
                /// rather than rejected, so a new server-side value cannot break
                /// decoding.
                case unrecognized(String)

                public init(rawValue: String) {
                    switch rawValue {
                    case "resize": self = .resize
                    default: self = .unrecognized(rawValue)
                    }
                }

                public var rawValue: String {
                    switch self {
                    case .resize: return "resize"
                    case .unrecognized(let value): return value
                    }
                }

                /// Every value the spec declares. `unrecognized` is deliberately absent.
                public static let allKnownCases: [Kind] = [
                    .resize,
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
            public var recommendedSizeId: String

            public init(
                kind: Kind,
                recommendedSizeId: String
            ) {
                self.kind = kind
                self.recommendedSizeId = recommendedSizeId
            }
        }

        public struct ChangeObject2: Codable, Hashable, Sendable {
            public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
                case remove
                /// A value the API added after this SDK was generated. Kept
                /// rather than rejected, so a new server-side value cannot break
                /// decoding.
                case unrecognized(String)

                public init(rawValue: String) {
                    switch rawValue {
                    case "remove": self = .remove
                    default: self = .unrecognized(rawValue)
                    }
                }

                public var rawValue: String {
                    switch self {
                    case .remove: return "remove"
                    case .unrecognized(let value): return value
                    }
                }

                /// Every value the spec declares. `unrecognized` is deliberately absent.
                public static let allKnownCases: [Kind] = [
                    .remove,
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

            public init(
                kind: Kind
            ) {
                self.kind = kind
            }
        }

        case object(ChangeObject)
        case object2(ChangeObject2)
        /// A shape none of the branches above matched.
        case other(JSONValue)

        public init(from decoder: any Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let value = try? container.decode(ChangeObject.self) {
                self = .object(value)
                return
            }
            if let value = try? container.decode(ChangeObject2.self) {
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

    public var sourceKind: GithubIssueSourceKind
    public var sourceId: String
    public var resourceId: String
    public var change: Change

    public init(
        sourceKind: GithubIssueSourceKind,
        sourceId: String,
        resourceId: String,
        change: Change
    ) {
        self.sourceKind = sourceKind
        self.sourceId = sourceId
        self.resourceId = resourceId
        self.change = change
    }
}
