/*
 * InfrawrenchSDK v1.69.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.69.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostAnomalyFeedbackInput: Codable, Hashable, Sendable {
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

    public struct Suppress: Codable, Hashable, Sendable {
        public var recurrence: CostAnomalyRecurrence
        public var scope: CostAnomalySuppressionScope?
        public var scopeKey: String?
        public var tagKey: String?
        /// Defaults by recurrence: 7 days (one-off), 90 (weekly), 180 (monthly),
        /// 730 (seasonal), counted from the later of the anomaly's day and today.
        public var expiresOn: String?

        public init(
            recurrence: CostAnomalyRecurrence,
            scope: CostAnomalySuppressionScope? = nil,
            scopeKey: String? = nil,
            tagKey: String? = nil,
            expiresOn: String? = nil
        ) {
            self.recurrence = recurrence
            self.scope = scope
            self.scopeKey = scopeKey
            self.tagKey = tagKey
            self.expiresOn = expiresOn
        }
    }

    /// `expected`: planned or known. `unexpected`: a real problem.
    public var verdict: Verdict
    public var reason: CostAnomalyFeedbackReason?
    public var note: String?
    /// Also record the note as the anomaly's explanation, which publishes it as
    /// an annotation on every chart covering the day (the same as POST
    /// …/acknowledge). Ignored without a note.
    public var explain: Bool?
    /// Only with `verdict: expected`. Creates a suppression anchored to the
    /// anomaly's day so the same pattern does not alert again; re-sending updates
    /// it rather than adding another.
    public var suppress: Suppress?

    public init(
        verdict: Verdict,
        reason: CostAnomalyFeedbackReason? = nil,
        note: String? = nil,
        explain: Bool? = nil,
        suppress: Suppress? = nil
    ) {
        self.verdict = verdict
        self.reason = reason
        self.note = note
        self.explain = explain
        self.suppress = suppress
    }
}
