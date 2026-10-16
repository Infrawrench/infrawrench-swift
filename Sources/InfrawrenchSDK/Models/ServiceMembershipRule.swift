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

public struct ServiceMembershipRule: Codable, Hashable, Sendable {
    public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case tag
        case virtualTag
        case name
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "tag": self = .tag
            case "virtual_tag": self = .virtualTag
            case "name": self = .name
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .tag: return "tag"
            case .virtualTag: return "virtual_tag"
            case .name: return "name"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Kind] = [
            .tag,
            .virtualTag,
            .name,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum NameMatch: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case contains
        case `prefix`
        case suffix
        case exact
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "contains": self = .contains
            case "prefix": self = .`prefix`
            case "suffix": self = .suffix
            case "exact": self = .exact
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .contains: return "contains"
            case .`prefix`: return "prefix"
            case .suffix: return "suffix"
            case .exact: return "exact"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [NameMatch] = [
            .contains,
            .`prefix`,
            .suffix,
            .exact,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// `tag`: the resource carries provider tag `key` (with `value` when set).
    /// `virtual_tag`: the org's virtual tag `key` resolves to `value` on the
    /// resource's cost rows over the last 30 days. `name`: the display name
    /// matches `value` per `nameMatch`, case-insensitively.
    public var kind: Kind
    /// `tag` / `virtual_tag`: the key. Null for `name`.
    public var key: String?
    /// `tag`: exact value, null for any. `virtual_tag`: required. `name`: the
    /// pattern.
    public var value: String?
    /// `name` only; defaults to `contains`.
    public var nameMatch: NameMatch?
    /// Narrow the rule to one provider.
    public var pluginId: String?
    /// Narrow the rule to one account.
    public var accountId: String?

    public init(
        kind: Kind,
        key: String? = nil,
        value: String? = nil,
        nameMatch: NameMatch? = nil,
        pluginId: String? = nil,
        accountId: String? = nil
    ) {
        self.kind = kind
        self.key = key
        self.value = value
        self.nameMatch = nameMatch
        self.pluginId = pluginId
        self.accountId = accountId
    }
}
