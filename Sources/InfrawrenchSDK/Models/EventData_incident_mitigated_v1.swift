/*
 * InfrawrenchSDK v1.81.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.81.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `data` of a `incident.mitigated` event, version 1. A declared incident was
/// marked mitigated.
public struct EventData_incident_mitigated_v1: Codable, Hashable, Sendable {
    public enum IncidentSeverity: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case sev1
        case sev2
        case sev3
        case sev4
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "sev1": self = .sev1
            case "sev2": self = .sev2
            case "sev3": self = .sev3
            case "sev4": self = .sev4
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .sev1: return "sev1"
            case .sev2: return "sev2"
            case .sev3: return "sev3"
            case .sev4: return "sev4"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [IncidentSeverity] = [
            .sev1,
            .sev2,
            .sev3,
            .sev4,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// Incident id.
    public var incidentId: String
    /// Incident title.
    public var title: String
    /// Declared severity.
    public var incidentSeverity: IncidentSeverity
    /// Status after this change.
    public var status: String
    /// Summary, if one was given.
    public var summary: String?
    /// When the incident started.
    public var startedAt: String
    /// When it was resolved.
    public var resolvedAt: String?
    /// Who declared it.
    public var declaredByName: String?
    /// Resources named as affected.
    public var affectedResourceIds: [String]

    public init(
        incidentId: String,
        title: String,
        incidentSeverity: IncidentSeverity,
        status: String,
        summary: String? = nil,
        startedAt: String,
        resolvedAt: String? = nil,
        declaredByName: String? = nil,
        affectedResourceIds: [String]
    ) {
        self.incidentId = incidentId
        self.title = title
        self.incidentSeverity = incidentSeverity
        self.status = status
        self.summary = summary
        self.startedAt = startedAt
        self.resolvedAt = resolvedAt
        self.declaredByName = declaredByName
        self.affectedResourceIds = affectedResourceIds
    }
}
