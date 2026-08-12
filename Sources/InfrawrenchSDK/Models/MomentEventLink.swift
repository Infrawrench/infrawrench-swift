/*
 * InfrawrenchSDK v1.14.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.14.0).
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
public struct MomentEventLink: Codable, Hashable, Sendable {
    public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case resource
        case changes
        case incident
        case costs
        case workflowRun
        case deployment
        case audit
        case freeze
        case expiring
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "resource": self = .resource
            case "changes": self = .changes
            case "incident": self = .incident
            case "costs": self = .costs
            case "workflow-run": self = .workflowRun
            case "deployment": self = .deployment
            case "audit": self = .audit
            case "freeze": self = .freeze
            case "expiring": self = .expiring
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .resource: return "resource"
            case .changes: return "changes"
            case .incident: return "incident"
            case .costs: return "costs"
            case .workflowRun: return "workflow-run"
            case .deployment: return "deployment"
            case .audit: return "audit"
            case .freeze: return "freeze"
            case .expiring: return "expiring"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Kind] = [
            .resource,
            .changes,
            .incident,
            .costs,
            .workflowRun,
            .deployment,
            .audit,
            .freeze,
            .expiring,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// Which native screen the event deep-links to.
    public var kind: Kind
    /// Target id where the kind needs one (resource id, run id, freeze id…).
    public var id: String?
    /// Parent id where the target needs one (workflow id for a run).
    public var parentId: String?
    /// Absolute external URL — a provider's incident page. Wins when present.
    public var url: String?

    public init(
        kind: Kind,
        id: String? = nil,
        parentId: String? = nil,
        url: String? = nil
    ) {
        self.kind = kind
        self.id = id
        self.parentId = parentId
        self.url = url
    }
}
