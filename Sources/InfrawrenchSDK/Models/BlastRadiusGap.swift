/*
 * InfrawrenchSDK v1.22.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.22.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct BlastRadiusGap: Codable, Hashable, Sendable {
    public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case networkFlows
        case dependencyGraph
        case references
        case workflowSource
        case customGraphSource
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "network-flows": self = .networkFlows
            case "dependency-graph": self = .dependencyGraph
            case "references": self = .references
            case "workflow-source": self = .workflowSource
            case "custom-graph-source": self = .customGraphSource
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .networkFlows: return "network-flows"
            case .dependencyGraph: return "dependency-graph"
            case .references: return "references"
            case .workflowSource: return "workflow-source"
            case .customGraphSource: return "custom-graph-source"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Kind] = [
            .networkFlows,
            .dependencyGraph,
            .references,
            .workflowSource,
            .customGraphSource,
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
    /// A full sentence, written to be rendered verbatim to the person deleting.
    public var reason: String

    public init(
        kind: Kind,
        reason: String
    ) {
        self.kind = kind
        self.reason = reason
    }
}
