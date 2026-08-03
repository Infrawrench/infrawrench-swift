/*
 * InfrawrenchSDK v0.29.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.29.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct DependencyGraphEdge: Codable, Hashable, Sendable {
    public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case outputRef
        case declared
        case containment
        case fieldMatch
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
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

    public var consumerResourceId: ResourceId
    /// The consumer field the reference fills. "parent" for containment edges,
    /// where the link is the resource hierarchy itself rather than a field.
    public var consumerFieldKey: String
    public var providerResourceId: ResourceId
    /// The provider output or identity the reference reads — an output key for
    /// output references, the matched identity ("externalId", "name",
    /// "endpoint"…) for inferred edges.
    public var providerOutputKey: String
    /// Where the edge came from: `output-ref` is wired by hand, `declared` from
    /// the plugin's own `dependsOn` rule for the resource type, `containment`
    /// from the synced parent/child link, `field-match` from a field value that
    /// exactly matches another resource's identity. Absent means `output-ref`.
    public var kind: Kind?
    /// How the plugin words the relationship ("in VPC", "guarded by"), when it
    /// declared one.
    public var label: String?

    public init(
        consumerResourceId: ResourceId,
        consumerFieldKey: String,
        providerResourceId: ResourceId,
        providerOutputKey: String,
        kind: Kind? = nil,
        label: String? = nil
    ) {
        self.consumerResourceId = consumerResourceId
        self.consumerFieldKey = consumerFieldKey
        self.providerResourceId = providerResourceId
        self.providerOutputKey = providerOutputKey
        self.kind = kind
        self.label = label
    }
}
