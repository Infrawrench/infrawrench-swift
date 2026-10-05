/*
 * InfrawrenchSDK v1.71.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.71.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `in_app` — recorded when Infrawrench performed the action; `detected` —
/// inferred from an inventory diff on sync (the action was taken in the
/// provider's console); `manual`; `derived` — computed from billing with no
/// stored event (commitments).
public enum SavingsEventSource: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case inApp
    case detected
    case manual
    case derived
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "in_app": self = .inApp
        case "detected": self = .detected
        case "manual": self = .manual
        case "derived": self = .derived
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .inApp: return "in_app"
        case .detected: return "detected"
        case .manual: return "manual"
        case .derived: return "derived"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [SavingsEventSource] = [
        .inApp,
        .detected,
        .manual,
        .derived,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
