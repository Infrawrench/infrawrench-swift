/*
 * InfrawrenchSDK v1.38.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.38.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct WallboardResponse: Codable, Hashable, Sendable {
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

    /// Three states rather than five, because at four metres a person
    /// distinguishes three colours reliably and nothing more. `down` is reserved
    /// for the two things that mean customers are affected now — a sev1 incident
    /// or a probe that is down; everything else that is wrong is `degraded`. A
    /// source that could not be read is `degraded` and never `ok`.
    public var status: Status
    public var tiles: [WallboardTile]
    /// Unresolved incidents, newest first.
    public var incidents: [WallboardIncidentLine]
    /// Probes that are down, query monitors breaching or unable to run, accounts
    /// that stopped syncing.
    public var failures: [WallboardFailureLine]
    /// Sources that could not be read, **named on the screen**. A wallboard
    /// showing green because a query failed is worse than a blank one — it is
    /// actively telling the room the wrong thing.
    public var failedSources: [String]
    public var generatedAt: String

    public init(
        status: Status,
        tiles: [WallboardTile],
        incidents: [WallboardIncidentLine],
        failures: [WallboardFailureLine],
        failedSources: [String],
        generatedAt: String
    ) {
        self.status = status
        self.tiles = tiles
        self.incidents = incidents
        self.failures = failures
        self.failedSources = failedSources
        self.generatedAt = generatedAt
    }
}
