/*
 * InfrawrenchSDK v1.34.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.34.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct WallboardTile: Codable, Hashable, Sendable {
    public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case ok
        case degraded
        case down
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "ok": self = .ok
            case "degraded": self = .degraded
            case "down": self = .down
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .ok: return "ok"
            case .degraded: return "degraded"
            case .down: return "down"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .ok,
            .degraded,
            .down,
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
    public var label: String
    /// The number or short phrase, rendered in large type.
    public var value: String
    public var detail: String?
    /// Three states rather than five, because at four metres a person
    /// distinguishes three colours reliably and nothing more. `down` is reserved
    /// for the two things that mean customers are affected now — a sev1 incident
    /// or a probe that is down; everything else that is wrong is `degraded`. A
    /// source that could not be read is `degraded` and never `ok`.
    public var status: Status

    public init(
        id: String,
        label: String,
        value: String,
        detail: String? = nil,
        status: Status
    ) {
        self.id = id
        self.label = label
        self.value = value
        self.detail = detail
        self.status = status
    }
}
