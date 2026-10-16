/*
 * InfrawrenchSDK v1.82.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.82.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// What a search hit is. `resource` and `workflow` are the original kinds; the
/// rest are saved objects (cost_report, cost_report_folder, dashboard, budget,
/// cost_canvas, saved_cost_filter, virtual_tag, business_metric, scenario_model,
/// slo, service, runbook, status_page, probe, log_query, query_monitor), returned
/// only when asked for with `kinds`.
public enum SearchResultKind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case resource
    case workflow
    case costReport
    case costReportFolder
    case dashboard
    case budget
    case costCanvas
    case savedCostFilter
    case virtualTag
    case businessMetric
    case scenarioModel
    case slo
    case service
    case runbook
    case statusPage
    case probe
    case logQuery
    case queryMonitor
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "resource": self = .resource
        case "workflow": self = .workflow
        case "cost_report": self = .costReport
        case "cost_report_folder": self = .costReportFolder
        case "dashboard": self = .dashboard
        case "budget": self = .budget
        case "cost_canvas": self = .costCanvas
        case "saved_cost_filter": self = .savedCostFilter
        case "virtual_tag": self = .virtualTag
        case "business_metric": self = .businessMetric
        case "scenario_model": self = .scenarioModel
        case "slo": self = .slo
        case "service": self = .service
        case "runbook": self = .runbook
        case "status_page": self = .statusPage
        case "probe": self = .probe
        case "log_query": self = .logQuery
        case "query_monitor": self = .queryMonitor
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .resource: return "resource"
        case .workflow: return "workflow"
        case .costReport: return "cost_report"
        case .costReportFolder: return "cost_report_folder"
        case .dashboard: return "dashboard"
        case .budget: return "budget"
        case .costCanvas: return "cost_canvas"
        case .savedCostFilter: return "saved_cost_filter"
        case .virtualTag: return "virtual_tag"
        case .businessMetric: return "business_metric"
        case .scenarioModel: return "scenario_model"
        case .slo: return "slo"
        case .service: return "service"
        case .runbook: return "runbook"
        case .statusPage: return "status_page"
        case .probe: return "probe"
        case .logQuery: return "log_query"
        case .queryMonitor: return "query_monitor"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [SearchResultKind] = [
        .resource,
        .workflow,
        .costReport,
        .costReportFolder,
        .dashboard,
        .budget,
        .costCanvas,
        .savedCostFilter,
        .virtualTag,
        .businessMetric,
        .scenarioModel,
        .slo,
        .service,
        .runbook,
        .statusPage,
        .probe,
        .logQuery,
        .queryMonitor,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
