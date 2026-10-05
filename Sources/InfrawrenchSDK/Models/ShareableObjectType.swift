/*
 * InfrawrenchSDK v1.74.1 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.74.1).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public enum ShareableObjectType: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case costReport
    case costReportFolder
    case dashboard
    case costCanvas
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "cost_report": self = .costReport
        case "cost_report_folder": self = .costReportFolder
        case "dashboard": self = .dashboard
        case "cost_canvas": self = .costCanvas
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .costReport: return "cost_report"
        case .costReportFolder: return "cost_report_folder"
        case .dashboard: return "dashboard"
        case .costCanvas: return "cost_canvas"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [ShareableObjectType] = [
        .costReport,
        .costReportFolder,
        .dashboard,
        .costCanvas,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
