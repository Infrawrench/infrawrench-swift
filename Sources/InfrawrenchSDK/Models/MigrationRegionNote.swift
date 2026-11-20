/*
 * InfrawrenchSDK v1.123.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.123.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct MigrationRegionNote: Codable, Hashable, Sendable {
    public enum Choice: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case user
        case nearest
        case `default`
        case none
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "user": self = .user
            case "nearest": self = .nearest
            case "default": self = .`default`
            case "none": self = .none
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .user: return "user"
            case .nearest: return "nearest"
            case .`default`: return "default"
            case .none: return "none"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Choice] = [
            .user,
            .nearest,
            .`default`,
            .none,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var region: String?
    public var regionLabel: String?
    public var area: MigrationArea?
    public var sourceAreas: [MigrationArea]
    public var choice: Choice
    /// Some sources are in another area than the target region; null if unknown.
    public var crossesArea: Bool?

    public init(
        region: String? = nil,
        regionLabel: String? = nil,
        area: MigrationArea? = nil,
        sourceAreas: [MigrationArea],
        choice: Choice,
        crossesArea: Bool? = nil
    ) {
        self.region = region
        self.regionLabel = regionLabel
        self.area = area
        self.sourceAreas = sourceAreas
        self.choice = choice
        self.crossesArea = crossesArea
    }
}
