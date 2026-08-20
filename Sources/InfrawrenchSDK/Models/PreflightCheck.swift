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

public struct PreflightCheck: Codable, Hashable, Sendable {
    public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case ok
        case missing
        case unknown
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "ok": self = .ok
            case "missing": self = .missing
            case "unknown": self = .unknown
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .ok: return "ok"
            case .missing: return "missing"
            case .unknown: return "unknown"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .ok,
            .missing,
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

    public struct HelpLink: Codable, Hashable, Sendable {
        public var label: String
        public var url: String

        public init(
            label: String,
            url: String
        ) {
            self.label = label
            self.url = url
        }
    }

    public var capabilityId: String
    public var status: Status
    public var missingPermissions: [PreflightPermission]
    public var message: String?
    public var helpLink: HelpLink?

    public init(
        capabilityId: String,
        status: Status,
        missingPermissions: [PreflightPermission],
        message: String? = nil,
        helpLink: HelpLink? = nil
    ) {
        self.capabilityId = capabilityId
        self.status = status
        self.missingPermissions = missingPermissions
        self.message = message
        self.helpLink = helpLink
    }
}
