/*
 * InfrawrenchSDK v1.21.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.21.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct TabTarget: Codable, Hashable, Sendable {
    public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case dashboard
        case account
        case resource
        case agents
        case costs
        case savings
        case costReports
        case invoices
        case graph
        case logs
        case changes
        case expiring
        case posture
        case accessReview
        case backups
        case dns
        case iac
        case environmentDiff
        case environments
        case sshFanout
        case metricAlerts
        case probes
        case quotas
        case incidents
        case workflows
        case deployments
        case settings
        case chat
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "dashboard": self = .dashboard
            case "account": self = .account
            case "resource": self = .resource
            case "agents": self = .agents
            case "costs": self = .costs
            case "savings": self = .savings
            case "cost-reports": self = .costReports
            case "invoices": self = .invoices
            case "graph": self = .graph
            case "logs": self = .logs
            case "changes": self = .changes
            case "expiring": self = .expiring
            case "posture": self = .posture
            case "access-review": self = .accessReview
            case "backups": self = .backups
            case "dns": self = .dns
            case "iac": self = .iac
            case "environment-diff": self = .environmentDiff
            case "environments": self = .environments
            case "ssh-fanout": self = .sshFanout
            case "metric-alerts": self = .metricAlerts
            case "probes": self = .probes
            case "quotas": self = .quotas
            case "incidents": self = .incidents
            case "workflows": self = .workflows
            case "deployments": self = .deployments
            case "settings": self = .settings
            case "chat": self = .chat
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .dashboard: return "dashboard"
            case .account: return "account"
            case .resource: return "resource"
            case .agents: return "agents"
            case .costs: return "costs"
            case .savings: return "savings"
            case .costReports: return "cost-reports"
            case .invoices: return "invoices"
            case .graph: return "graph"
            case .logs: return "logs"
            case .changes: return "changes"
            case .expiring: return "expiring"
            case .posture: return "posture"
            case .accessReview: return "access-review"
            case .backups: return "backups"
            case .dns: return "dns"
            case .iac: return "iac"
            case .environmentDiff: return "environment-diff"
            case .environments: return "environments"
            case .sshFanout: return "ssh-fanout"
            case .metricAlerts: return "metric-alerts"
            case .probes: return "probes"
            case .quotas: return "quotas"
            case .incidents: return "incidents"
            case .workflows: return "workflows"
            case .deployments: return "deployments"
            case .settings: return "settings"
            case .chat: return "chat"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Kind] = [
            .dashboard,
            .account,
            .resource,
            .agents,
            .costs,
            .savings,
            .costReports,
            .invoices,
            .graph,
            .logs,
            .changes,
            .expiring,
            .posture,
            .accessReview,
            .backups,
            .dns,
            .iac,
            .environmentDiff,
            .environments,
            .sshFanout,
            .metricAlerts,
            .probes,
            .quotas,
            .incidents,
            .workflows,
            .deployments,
            .settings,
            .chat,
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
    public var dashboardId: String?
    public var accountId: String?
    public var resourceId: ResourceId?
    public var conversationId: String?
    public var reportId: String?
    public var invoiceId: String?

    public init(
        kind: Kind,
        dashboardId: String? = nil,
        accountId: String? = nil,
        resourceId: ResourceId? = nil,
        conversationId: String? = nil,
        reportId: String? = nil,
        invoiceId: String? = nil
    ) {
        self.kind = kind
        self.dashboardId = dashboardId
        self.accountId = accountId
        self.resourceId = resourceId
        self.conversationId = conversationId
        self.reportId = reportId
        self.invoiceId = invoiceId
    }
}
