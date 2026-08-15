/*
 * InfrawrenchSDK v1.26.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.26.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AgentClaimRequest: Codable, Hashable, Sendable {
    public enum Mode: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case adopt
        case merge
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "adopt": self = .adopt
            case "merge": self = .merge
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .adopt: return "adopt"
            case .merge: return "merge"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Mode] = [
            .adopt,
            .merge,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var code: String
    /// `adopt` keeps the workspace as its own organization and stops the clock.
    /// `merge` moves its cloud accounts into an organization you already belong
    /// to and destroys the trial. Defaults to `adopt`.
    public var mode: Mode?
    /// Required when `mode` is merge.
    public var targetOrganizationId: String?
    /// Merge only: also re-parent the trial's metrics and cost history. Off by
    /// default — it changes numbers the target organization may already be
    /// reporting on. Needs `costs:write`.
    public var moveHistory: Bool?

    public init(
        code: String,
        mode: Mode? = nil,
        targetOrganizationId: String? = nil,
        moveHistory: Bool? = nil
    ) {
        self.code = code
        self.mode = mode
        self.targetOrganizationId = targetOrganizationId
        self.moveHistory = moveHistory
    }
}
