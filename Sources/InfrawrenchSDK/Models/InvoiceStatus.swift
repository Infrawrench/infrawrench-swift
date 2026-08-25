/*
 * InfrawrenchSDK v1.35.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.35.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `draft` → `approved` → `sent`, plus `void` from either issued state.
///
/// **A draft recomputes its figures from live spend on every read; an approved,
/// sent or void invoice never does.** Approval is the freeze: the lines, the
/// totals, the exchange rates and the day they were read, the billing rules in
/// force and the names of everything in scope are written onto the invoice, and
/// no later restatement of spend, change of rate, edit of a rule or rename can
/// alter what the document says.
///
/// An issued invoice is never edited and never deleted. A wrong one is voided
/// with a reason and superseded by a corrective invoice; both survive. The server
/// enforces this, not just the UI.
public enum InvoiceStatus: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case draft
    case approved
    case sent
    case void
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "draft": self = .draft
        case "approved": self = .approved
        case "sent": self = .sent
        case "void": self = .void
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .draft: return "draft"
        case .approved: return "approved"
        case .sent: return "sent"
        case .void: return "void"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [InvoiceStatus] = [
        .draft,
        .approved,
        .sent,
        .void,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
