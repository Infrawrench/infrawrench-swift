/*
 * InfrawrenchSDK v1.12.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.12.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CommitmentRejectedCell: Codable, Hashable, Sendable {
    public enum Gate: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case presence
        case notInDecline
        case floor
        case materiality
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "presence": self = .presence
            case "not_in_decline": self = .notInDecline
            case "floor": self = .floor
            case "materiality": self = .materiality
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .presence: return "presence"
            case .notInDecline: return "not_in_decline"
            case .floor: return "floor"
            case .materiality: return "materiality"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Gate] = [
            .presence,
            .notInDecline,
            .floor,
            .materiality,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var pluginId: PluginId
    public var service: String
    public var region: String
    public var currency: String
    /// First gate the cell failed, in evaluation order — the most actionable
    /// objection.
    public var gate: Gate

    public init(
        pluginId: PluginId,
        service: String,
        region: String,
        currency: String,
        gate: Gate
    ) {
        self.pluginId = pluginId
        self.service = service
        self.region = region
        self.currency = currency
        self.gate = gate
    }
}
