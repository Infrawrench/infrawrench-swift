/*
 * InfrawrenchSDK v1.124.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.124.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `commitment_type` and `commitment` split the commitment side by holding and
/// put uncovered usage in its own `__on_demand__` group; covered usage the
/// provider did not tie to a commitment (all of AWS, whose Cost Explorer cannot
/// group by commitment) is `__unattributed__`, and a commitment the inventory no
/// longer holds is `__unknown_kind__` under `commitment_type`. Under those two,
/// each group's coverage is its share of the bucket's whole usage, so the groups
/// add up. Instance family is not offered: no collector stores it on cost rows.
public enum CommitmentReportGroupBy: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case none
    case provider
    case commitmentType
    case commitment
    case service
    case account
    case region
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "none": self = .none
        case "provider": self = .provider
        case "commitment_type": self = .commitmentType
        case "commitment": self = .commitment
        case "service": self = .service
        case "account": self = .account
        case "region": self = .region
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .none: return "none"
        case .provider: return "provider"
        case .commitmentType: return "commitment_type"
        case .commitment: return "commitment"
        case .service: return "service"
        case .account: return "account"
        case .region: return "region"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [CommitmentReportGroupBy] = [
        .none,
        .provider,
        .commitmentType,
        .commitment,
        .service,
        .account,
        .region,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
