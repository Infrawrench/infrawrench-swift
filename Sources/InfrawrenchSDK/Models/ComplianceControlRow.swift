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

public struct ComplianceControlRow: Codable, Hashable, Sendable {
    public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case evidence
        case gaps
        case notApplicable
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "evidence": self = .evidence
            case "gaps": self = .gaps
            case "not-applicable": self = .notApplicable
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .evidence: return "evidence"
            case .gaps: return "gaps"
            case .notApplicable: return "not-applicable"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .evidence,
            .gaps,
            .notApplicable,
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
    /// Short paraphrase of the control, not the framework's own text.
    public var title: String
    public var group: String
    public var sources: [String]
    /// `evidence`: at least one mapped source has evidence and none shows a gap.
    /// `gaps`: a source shows a gap, or no mapped source produced evidence.
    /// `not-applicable`: the org said so, with a justification.
    public var status: Status
    public var reasons: [String]
    public var missingSources: [String]
    public var applicable: Bool
    public var justification: String?
    public var owner: ComplianceControlOwner?
    public var notes: String?
    public var settingUpdatedAt: String?

    public init(
        id: String,
        title: String,
        group: String,
        sources: [String],
        status: Status,
        reasons: [String],
        missingSources: [String],
        applicable: Bool,
        justification: String? = nil,
        owner: ComplianceControlOwner? = nil,
        notes: String? = nil,
        settingUpdatedAt: String? = nil
    ) {
        self.id = id
        self.title = title
        self.group = group
        self.sources = sources
        self.status = status
        self.reasons = reasons
        self.missingSources = missingSources
        self.applicable = applicable
        self.justification = justification
        self.owner = owner
        self.notes = notes
        self.settingUpdatedAt = settingUpdatedAt
    }
}
