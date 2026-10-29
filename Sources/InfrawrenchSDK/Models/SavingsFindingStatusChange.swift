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

public struct SavingsFindingStatusChange: Codable, Hashable, Sendable {
    public enum Resolution: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case manual
        case resolved
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "manual": self = .manual
            case "resolved": self = .resolved
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .manual: return "manual"
            case .resolved: return "resolved"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Resolution] = [
            .manual,
            .resolved,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var key: String
    public var status: SavingsFindingStatus
    public var statusChangedAt: String
    public var statusChangedBy: SavingsFindingActor?
    public var statusNote: String?
    public var resolution: Resolution?

    public init(
        key: String,
        status: SavingsFindingStatus,
        statusChangedAt: String,
        statusChangedBy: SavingsFindingActor? = nil,
        statusNote: String? = nil,
        resolution: Resolution? = nil
    ) {
        self.key = key
        self.status = status
        self.statusChangedAt = statusChangedAt
        self.statusChangedBy = statusChangedBy
        self.statusNote = statusNote
        self.resolution = resolution
    }
}
