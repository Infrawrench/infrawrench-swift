/*
 * InfrawrenchSDK v1.26.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.26.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct EnvironmentDiffTypeSummary: Codable, Hashable, Sendable {
    public enum MissingFrom: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case a
        case b
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "a": self = .a
            case "b": self = .b
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .a: return "a"
            case .b: return "b"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [MissingFrom] = [
            .a,
            .b,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var resourceTypeId: String
    public var resourceTypeName: String
    public var countA: Int
    public var countB: Int
    /// `countB - countA`.
    public var delta: Int
    public var onlyInA: Int
    public var onlyInB: Int
    /// Matched pairs that disagree on at least one field.
    public var changed: Int
    /// Matched pairs with no visible divergence.
    public var identical: Int
    /// Set when the resource type is absent from that side entirely.
    public var missingFrom: MissingFrom?

    public init(
        resourceTypeId: String,
        resourceTypeName: String,
        countA: Int,
        countB: Int,
        delta: Int,
        onlyInA: Int,
        onlyInB: Int,
        changed: Int,
        identical: Int,
        missingFrom: MissingFrom? = nil
    ) {
        self.resourceTypeId = resourceTypeId
        self.resourceTypeName = resourceTypeName
        self.countA = countA
        self.countB = countB
        self.delta = delta
        self.onlyInA = onlyInA
        self.onlyInB = onlyInB
        self.changed = changed
        self.identical = identical
        self.missingFrom = missingFrom
    }
}
