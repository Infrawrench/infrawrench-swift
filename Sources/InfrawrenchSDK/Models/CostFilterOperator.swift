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

/// `in` / `not_in` compare exactly. `flexible_match` compares after ignoring
/// letter case, whitespace, `_` and `-` (so `Prod_Env` matches `prod-env`).
/// `contains`, `not_contains` and `starts_with` are substring and prefix tests,
/// ignoring letter case. Each matches when any listed value does (`not_in` and
/// `not_contains`: when none does). `is_set` / `is_not_set` test whether a `tag`
/// or `virtual_tag` has a value, and take an empty `values`.
public enum CostFilterOperator: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case `in`
    case notIn
    case flexibleMatch
    case contains
    case notContains
    case startsWith
    case isSet
    case isNotSet
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "in": self = .`in`
        case "not_in": self = .notIn
        case "flexible_match": self = .flexibleMatch
        case "contains": self = .contains
        case "not_contains": self = .notContains
        case "starts_with": self = .startsWith
        case "is_set": self = .isSet
        case "is_not_set": self = .isNotSet
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .`in`: return "in"
        case .notIn: return "not_in"
        case .flexibleMatch: return "flexible_match"
        case .contains: return "contains"
        case .notContains: return "not_contains"
        case .startsWith: return "starts_with"
        case .isSet: return "is_set"
        case .isNotSet: return "is_not_set"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [CostFilterOperator] = [
        .`in`,
        .notIn,
        .flexibleMatch,
        .contains,
        .notContains,
        .startsWith,
        .isSet,
        .isNotSet,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
