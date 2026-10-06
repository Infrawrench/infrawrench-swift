/*
 * InfrawrenchSDK v1.75.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.75.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Whether somebody marked this finding expected (planned or known) or unexpected
/// (a real problem), with who and when; null while nobody has. See POST
/// /costs/anomalies/{anomalyId}/feedback.
///
/// The API may send `null` in place of this, which is why references to it are
/// optional.
public struct CostAnomalyFeedback: Codable, Hashable, Sendable {
    public enum Verdict: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case expected
        case unexpected
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "expected": self = .expected
            case "unexpected": self = .unexpected
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .expected: return "expected"
            case .unexpected: return "unexpected"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Verdict] = [
            .expected,
            .unexpected,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var verdict: Verdict
    public var reason: CostAnomalyFeedbackReason?
    public var note: String?
    /// When the current verdict was recorded; restamped on every save.
    public var at: String
    public var byUserId: String?
    /// Display name (or email) of whoever gave the verdict, while they are still
    /// known.
    public var byName: String?
    /// The suppression this verdict created, or null (none was asked for, or it
    /// was deleted).
    public var suppressionId: String?

    public init(
        verdict: Verdict,
        reason: CostAnomalyFeedbackReason? = nil,
        note: String? = nil,
        at: String,
        byUserId: String? = nil,
        byName: String? = nil,
        suppressionId: String? = nil
    ) {
        self.verdict = verdict
        self.reason = reason
        self.note = note
        self.at = at
        self.byUserId = byUserId
        self.byName = byName
        self.suppressionId = suppressionId
    }
}
