/*
 * InfrawrenchSDK v1.67.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.67.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Which periods the budget covers. Omitted (or null) is the calendar month.
/// `recurring` repeats every `interval` × `unit` from `startDate`; `explicit`
/// lists the periods with an amount each, and the top-level amount is then
/// ignored. Thresholds fire once per period; days outside every period are not
/// measured.
///
/// The API may send `null` in place of this, which is why references to it are
/// optional.
///
/// The spec allows several shapes here. Decoding tries the branches in spec
/// order, so the most specific match wins.
public enum BudgetPeriod: Codable, Hashable, Sendable {
    case budgetRecurringPeriod(BudgetRecurringPeriod)
    case budgetExplicitPeriods(BudgetExplicitPeriods)
    /// A shape none of the branches above matched.
    case other(JSONValue)

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(BudgetRecurringPeriod.self) {
            self = .budgetRecurringPeriod(value)
            return
        }
        if let value = try? container.decode(BudgetExplicitPeriods.self) {
            self = .budgetExplicitPeriods(value)
            return
        }
        self = .other(try container.decode(JSONValue.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .budgetRecurringPeriod(let value): try container.encode(value)
        case .budgetExplicitPeriods(let value): try container.encode(value)
        case .other(let value): try container.encode(value)
        }
    }
}
