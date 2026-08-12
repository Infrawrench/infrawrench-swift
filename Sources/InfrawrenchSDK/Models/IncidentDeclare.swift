/*
 * InfrawrenchSDK v1.20.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.20.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct IncidentDeclare: Codable, Hashable, Sendable {
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

    public var title: String
    /// Severity in the ordinary sev1..sev4 register. `sev1` is a complete outage;
    /// `sev4` is cosmetic and tracked rather than paged.
    public var severity: Severity?
    public var summary: String?
    /// Defaults to now.
    public var startedAt: String?
    public var affectedResourceIds: [String]?
    public var affectedAccountIds: [String]?
    public var actions: IncidentActions?

    public init(
        title: String,
        severity: Severity? = nil,
        summary: String? = nil,
        startedAt: String? = nil,
        affectedResourceIds: [String]? = nil,
        affectedAccountIds: [String]? = nil,
        actions: IncidentActions? = nil
    ) {
        self.title = title
        self.severity = severity
        self.summary = summary
        self.startedAt = startedAt
        self.affectedResourceIds = affectedResourceIds
        self.affectedAccountIds = affectedAccountIds
        self.actions = actions
    }
}
