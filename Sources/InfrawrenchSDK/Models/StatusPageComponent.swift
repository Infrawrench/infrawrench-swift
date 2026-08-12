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

public struct StatusPageComponent: Codable, Hashable, Sendable {
    public enum ProbeStatus2: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case up
        case down
        case unknown
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "up": self = .up
            case "down": self = .down
            case "unknown": self = .unknown
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .up: return "up"
            case .down: return "down"
            case .unknown: return "unknown"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [ProbeStatus2] = [
            .up,
            .down,
            .unknown,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var id: String
    public var probeId: String
    /// Public name; null falls back to the probe's own name.
    public var label: String?
    public var groupName: String?
    /// Ascending display order.
    public var position: Int
    /// The probe's internal name — editor-only.
    public var probeName: String
    public var probeStatus: ProbeStatus2
    /// False when the probe is paused.
    public var probeEnabled: Bool

    public init(
        id: String,
        probeId: String,
        label: String? = nil,
        groupName: String? = nil,
        position: Int,
        probeName: String,
        probeStatus: ProbeStatus2,
        probeEnabled: Bool
    ) {
        self.id = id
        self.probeId = probeId
        self.label = label
        self.groupName = groupName
        self.position = position
        self.probeName = probeName
        self.probeStatus = probeStatus
        self.probeEnabled = probeEnabled
    }
}
