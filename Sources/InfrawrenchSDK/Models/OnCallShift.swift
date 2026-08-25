/*
 * InfrawrenchSDK v1.39.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.39.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// The API may send `null` in place of this, which is why references to it are
/// optional.
public struct OnCallShift: Codable, Hashable, Sendable {
    public enum Source: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case rotation
        case `override`
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "rotation": self = .rotation
            case "override": self = .`override`
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .rotation: return "rotation"
            case .`override`: return "override"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Source] = [
            .rotation,
            .`override`,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var startsAt: String
    public var endsAt: String
    public var userId: String
    public var name: String?
    public var email: String?
    public var source: Source
    public var rotationIndex: Int?

    public init(
        startsAt: String,
        endsAt: String,
        userId: String,
        name: String? = nil,
        email: String? = nil,
        source: Source,
        rotationIndex: Int? = nil
    ) {
        self.startsAt = startsAt
        self.endsAt = endsAt
        self.userId = userId
        self.name = name
        self.email = email
        self.source = source
        self.rotationIndex = rotationIndex
    }
}
