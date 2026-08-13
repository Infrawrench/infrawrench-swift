/*
 * InfrawrenchSDK v1.24.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.24.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct IacResourceStatusResponse: Codable, Hashable, Sendable {
    public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case managed
        case drifted
        case unmanaged
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "managed": self = .managed
            case "drifted": self = .drifted
            case "unmanaged": self = .unmanaged
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .managed: return "managed"
            case .drifted: return "drifted"
            case .unmanaged: return "unmanaged"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .managed,
            .drifted,
            .unmanaged,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var status: Status?
    public var stateId: String?
    public var stateLabel: String?
    public var terraformAddress: String?
    public var driftFieldCount: Int

    public init(
        status: Status? = nil,
        stateId: String? = nil,
        stateLabel: String? = nil,
        terraformAddress: String? = nil,
        driftFieldCount: Int
    ) {
        self.status = status
        self.stateId = stateId
        self.stateLabel = stateLabel
        self.terraformAddress = terraformAddress
        self.driftFieldCount = driftFieldCount
    }
}
