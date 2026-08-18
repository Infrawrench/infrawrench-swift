/*
 * InfrawrenchSDK v1.29.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.29.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct IncidentTimelineEntry: Codable, Hashable, Sendable {
    public enum Source: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case incident
        case note
        case artifact
        case moment
        case probe
        case metricAlert
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "incident": self = .incident
            case "note": self = .note
            case "artifact": self = .artifact
            case "moment": self = .moment
            case "probe": self = .probe
            case "metric-alert": self = .metricAlert
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .incident: return "incident"
            case .note: return "note"
            case .artifact: return "artifact"
            case .moment: return "moment"
            case .probe: return "probe"
            case .metricAlert: return "metric-alert"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Source] = [
            .incident,
            .note,
            .artifact,
            .moment,
            .probe,
            .metricAlert,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum Severity: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case info
        case warning
        case critical
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "info": self = .info
            case "warning": self = .warning
            case "critical": self = .critical
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .info: return "info"
            case .warning: return "warning"
            case .critical: return "critical"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Severity] = [
            .info,
            .warning,
            .critical,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public struct Link: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case resource
            case changes
            case providerIncident
            case costs
            case workflowRun
            case deployment
            case audit
            case freeze
            case expiring
            case probe
            case metricAlert
            case incident
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "resource": self = .resource
                case "changes": self = .changes
                case "provider-incident": self = .providerIncident
                case "costs": self = .costs
                case "workflow-run": self = .workflowRun
                case "deployment": self = .deployment
                case "audit": self = .audit
                case "freeze": self = .freeze
                case "expiring": self = .expiring
                case "probe": self = .probe
                case "metric-alert": self = .metricAlert
                case "incident": self = .incident
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .resource: return "resource"
                case .changes: return "changes"
                case .providerIncident: return "provider-incident"
                case .costs: return "costs"
                case .workflowRun: return "workflow-run"
                case .deployment: return "deployment"
                case .audit: return "audit"
                case .freeze: return "freeze"
                case .expiring: return "expiring"
                case .probe: return "probe"
                case .metricAlert: return "metric-alert"
                case .incident: return "incident"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .resource,
                .changes,
                .providerIncident,
                .costs,
                .workflowRun,
                .deployment,
                .audit,
                .freeze,
                .expiring,
                .probe,
                .metricAlert,
                .incident,
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
        public var id: String?
        public var parentId: String?
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

    public var id: String
    /// `moment` covers everything the moment union already indexes — resource
    /// changes, deployments, cost anomalies, provider status incidents, audit
    /// entries, change freezes and workflow runs. Nothing is copied into the
    /// incident's own tables; the timeline is a join, so re-reading it reflects
    /// the record as it stands today.
    public var source: Source
    /// `<noun>.<verb>`. Open set — render unknown kinds generically.
    public var kind: String
    public var at: String
    public var title: String
    public var detail: String?
    public var severity: Severity
    public var authorName: String?
    public var resourceId: String?
    public var resourceName: String?
    public var pluginId: String?
    public var accountId: String?
    public var link: Link?

    public init(
        id: String,
        source: Source,
        kind: String,
        at: String,
        title: String,
        detail: String? = nil,
        severity: Severity,
        authorName: String? = nil,
        resourceId: String? = nil,
        resourceName: String? = nil,
        pluginId: String? = nil,
        accountId: String? = nil,
        link: Link? = nil
    ) {
        self.id = id
        self.source = source
        self.kind = kind
        self.at = at
        self.title = title
        self.detail = detail
        self.severity = severity
        self.authorName = authorName
        self.resourceId = resourceId
        self.resourceName = resourceName
        self.pluginId = pluginId
        self.accountId = accountId
        self.link = link
    }
}
