/*
 * InfrawrenchSDK v1.38.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.38.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct RunbookStepInput: Codable, Hashable, Sendable {
    public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case manual
        case workflow
        case link
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "manual": self = .manual
            case "workflow": self = .workflow
            case "link": self = .link
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .manual: return "manual"
            case .workflow: return "workflow"
            case .link: return "link"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Kind] = [
            .manual,
            .workflow,
            .link,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// Omitted for a new step; the server assigns one.
    public var id: String?
    /// What the step does. Three kinds and not a scripting language: a runbook is
    /// written by whoever is on call for whoever is on call next, and the moment
    /// it needs a language it stops being written. `workflow` is the escape hatch
    /// — anything genuinely automated belongs in a workflow, which already has a
    /// sandbox, approvals, secrets and a history.
    public var kind: Kind
    public var title: String
    public var body: String?
    public var workflowId: String?
    public var url: String?

    public init(
        id: String? = nil,
        kind: Kind,
        title: String,
        body: String? = nil,
        workflowId: String? = nil,
        url: String? = nil
    ) {
        self.id = id
        self.kind = kind
        self.title = title
        self.body = body
        self.workflowId = workflowId
        self.url = url
    }
}
