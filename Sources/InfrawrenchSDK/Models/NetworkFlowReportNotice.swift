/*
 * InfrawrenchSDK v1.85.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.85.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public enum NetworkFlowReportNotice: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case collectionDisabled
    case noFlowAccounts
    case beyondRetention
    case sampledSources
    case recutExcluded
    case unattributedTraffic
    case truncatedTraffic
    case multipleCurrencies
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "collection_disabled": self = .collectionDisabled
        case "no_flow_accounts": self = .noFlowAccounts
        case "beyond_retention": self = .beyondRetention
        case "sampled_sources": self = .sampledSources
        case "recut_excluded": self = .recutExcluded
        case "unattributed_traffic": self = .unattributedTraffic
        case "truncated_traffic": self = .truncatedTraffic
        case "multiple_currencies": self = .multipleCurrencies
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .collectionDisabled: return "collection_disabled"
        case .noFlowAccounts: return "no_flow_accounts"
        case .beyondRetention: return "beyond_retention"
        case .sampledSources: return "sampled_sources"
        case .recutExcluded: return "recut_excluded"
        case .unattributedTraffic: return "unattributed_traffic"
        case .truncatedTraffic: return "truncated_traffic"
        case .multipleCurrencies: return "multiple_currencies"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [NetworkFlowReportNotice] = [
        .collectionDisabled,
        .noFlowAccounts,
        .beyondRetention,
        .sampledSources,
        .recutExcluded,
        .unattributedTraffic,
        .truncatedTraffic,
        .multipleCurrencies,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
