/*
 * InfrawrenchSDK v1.35.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.35.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// What a revert would do to one field. `revertible` — the field still holds the
/// value the change set, and the plugin's edit form can write the old one back.
/// `already-reverted` — it is already at the old value; nothing to do. `conflict`
/// — it changed again since, so reverting would discard the newer value.
/// `not-writable` — outside the plugin's editable surface, or the old value is
/// not something the edit form can submit. `provider-derived` — an `outputs.*`
/// entry, which the provider computes rather than accepts.
public enum RevertFieldStatus: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case revertible
    case alreadyReverted
    case conflict
    case notWritable
    case providerDerived
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "revertible": self = .revertible
        case "already-reverted": self = .alreadyReverted
        case "conflict": self = .conflict
        case "not-writable": self = .notWritable
        case "provider-derived": self = .providerDerived
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .revertible: return "revertible"
        case .alreadyReverted: return "already-reverted"
        case .conflict: return "conflict"
        case .notWritable: return "not-writable"
        case .providerDerived: return "provider-derived"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [RevertFieldStatus] = [
        .revertible,
        .alreadyReverted,
        .conflict,
        .notWritable,
        .providerDerived,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
