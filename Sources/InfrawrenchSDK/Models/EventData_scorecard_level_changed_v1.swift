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

/// `data` of a `scorecard.level_changed` event, version 1. A service moved up or
/// down a level on a scorecard between two evaluations. A service's first
/// evaluation is never sent.
public struct EventData_scorecard_level_changed_v1: Codable, Hashable, Sendable {
    public enum Direction: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case up
        case down
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "up": self = .up
            case "down": self = .down
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .up: return "up"
            case .down: return "down"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Direction] = [
            .up,
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

    /// Scorecard id.
    public var scorecardId: String
    /// Scorecard name.
    public var scorecardName: String
    /// Service id.
    public var serviceId: String
    /// The service's slug.
    public var serviceSlug: String
    /// Service name.
    public var serviceName: String
    /// Whether the service went up or down the ladder.
    public var direction: Direction
    /// Level key before; null for no level.
    public var previousLevel: String?
    /// Level name before; null for no level.
    public var previousLevelName: String?
    /// Level key now; null for no level.
    public var level: String?
    /// Level name now; null for no level.
    public var levelName: String?
    /// Weighted score now, 0-100; null when no check applied.
    public var score: Double?
    /// Names of the checks failing (or erroring) now.
    public var failingChecks: [String]

    public init(
        scorecardId: String,
        scorecardName: String,
        serviceId: String,
        serviceSlug: String,
        serviceName: String,
        direction: Direction,
        previousLevel: String? = nil,
        previousLevelName: String? = nil,
        level: String? = nil,
        levelName: String? = nil,
        score: Double? = nil,
        failingChecks: [String]
    ) {
        self.scorecardId = scorecardId
        self.scorecardName = scorecardName
        self.serviceId = serviceId
        self.serviceSlug = serviceSlug
        self.serviceName = serviceName
        self.direction = direction
        self.previousLevel = previousLevel
        self.previousLevelName = previousLevelName
        self.level = level
        self.levelName = levelName
        self.score = score
        self.failingChecks = failingChecks
    }
}
