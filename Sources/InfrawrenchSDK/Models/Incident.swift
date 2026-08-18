/*
 * InfrawrenchSDK v1.30.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.30.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct Incident: Codable, Hashable, Sendable {
    public enum Severity: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
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
        public static let allKnownCases: [Severity] = [
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

    public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case open
        case mitigated
        case resolved
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "open": self = .open
            case "mitigated": self = .mitigated
            case "resolved": self = .resolved
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .open: return "open"
            case .mitigated: return "mitigated"
            case .resolved: return "resolved"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .open,
            .mitigated,
            .resolved,
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
    public var title: String
    /// Severity in the ordinary sev1..sev4 register. `sev1` is a complete outage;
    /// `sev4` is cosmetic and tracked rather than paged.
    public var severity: Severity
    /// `mitigated` is a real state, not a synonym for resolved: impact has
    /// stopped but the incident is still open for follow-up. Keeping it separate
    /// is what makes time-to-mitigate a measurement rather than a guess.
    /// Resolving runs the resolve path — the change freeze this incident opened
    /// is lifted, and the status-page update it posted is closed.
    public var status: Status
    public var summary: String?
    /// Backdatable — people declare after they start firefighting.
    public var startedAt: String
    public var mitigatedAt: String?
    public var resolvedAt: String?
    public var declaredByUserId: String?
    public var declaredByName: String?
    public var resolvedByUserId: String?
    /// Advisory. Not foreign keys — the claim must survive the resource being
    /// deleted.
    public var affectedResourceIds: [String]
    public var affectedAccountIds: [String]
    /// Where the write-up was filed, once anyone filed it.
    public var issueUrl: String?
    public var createdAt: String
    public var updatedAt: String
    public var artifacts: [IncidentArtifact]
    public var noteCount: Int

    public init(
        id: String,
        title: String,
        severity: Severity,
        status: Status,
        summary: String? = nil,
        startedAt: String,
        mitigatedAt: String? = nil,
        resolvedAt: String? = nil,
        declaredByUserId: String? = nil,
        declaredByName: String? = nil,
        resolvedByUserId: String? = nil,
        affectedResourceIds: [String],
        affectedAccountIds: [String],
        issueUrl: String? = nil,
        createdAt: String,
        updatedAt: String,
        artifacts: [IncidentArtifact],
        noteCount: Int
    ) {
        self.id = id
        self.title = title
        self.severity = severity
        self.status = status
        self.summary = summary
        self.startedAt = startedAt
        self.mitigatedAt = mitigatedAt
        self.resolvedAt = resolvedAt
        self.declaredByUserId = declaredByUserId
        self.declaredByName = declaredByName
        self.resolvedByUserId = resolvedByUserId
        self.affectedResourceIds = affectedResourceIds
        self.affectedAccountIds = affectedAccountIds
        self.issueUrl = issueUrl
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.artifacts = artifacts
        self.noteCount = noteCount
    }
}
