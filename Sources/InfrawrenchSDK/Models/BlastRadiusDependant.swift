/*
 * InfrawrenchSDK v1.27.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.27.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct BlastRadiusDependant: Codable, Hashable, Sendable {
    public struct Via: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case outputRef
            case declared
            case containment
            case fieldMatch
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "output-ref": self = .outputRef
                case "declared": self = .declared
                case "containment": self = .containment
                case "field-match": self = .fieldMatch
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .outputRef: return "output-ref"
                case .declared: return "declared"
                case .containment: return "containment"
                case .fieldMatch: return "field-match"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .outputRef,
                .declared,
                .containment,
                .fieldMatch,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        /// The dependant's field holding the reference.
        public var fieldKey: String
        /// The output or identity the reference reads.
        public var outputKey: String
        /// Where the edge came from. Absent means `output-ref` — a reference
        /// wired by hand.
        public var kind: Kind?
        /// How the plugin words the relationship ("in VPC"), when it declared
        /// one.
        public var label: String?

        public init(
            fieldKey: String,
            outputKey: String,
            kind: Kind? = nil,
            label: String? = nil
        ) {
            self.fieldKey = fieldKey
            self.outputKey = outputKey
            self.kind = kind
            self.label = label
        }
    }

    public var node: BlastRadiusNode?
    /// Shortest hop count from the resource: 1 is a direct dependant, 2 or more
    /// reached it through something else. The resource itself is never listed.
    public var depth: Int
    /// How a direct dependant reaches the resource. Absent for transitive
    /// dependants, whose path is several edges and has no single caption.
    public var via: Via?

    public init(
        node: BlastRadiusNode? = nil,
        depth: Int,
        via: Via? = nil
    ) {
        self.node = node
        self.depth = depth
        self.via = via
    }
}
