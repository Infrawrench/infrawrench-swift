/*
 * InfrawrenchSDK v1.79.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.79.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SavingsEventResult: Codable, Hashable, Sendable {
    public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case pending
        case accruing
        case complete
        case ended
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "pending": self = .pending
            case "accruing": self = .accruing
            case "complete": self = .complete
            case "ended": self = .ended
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .pending: return "pending"
            case .accruing: return "accruing"
            case .complete: return "complete"
            case .ended: return "ended"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .pending,
            .accruing,
            .complete,
            .ended,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum Editable: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case full
        case annotate
        case none
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "full": self = .full
            case "annotate": self = .annotate
            case "none": self = .none
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .full: return "full"
            case .annotate: return "annotate"
            case .none: return "none"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Editable] = [
            .full,
            .annotate,
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

    /// A UUID for stored events; `commitment:<accountId>:<currency>` for derived
    /// rows.
    public var id: String
    public var kind: SavingsEventKind
    public var source: SavingsEventSource
    public var title: String
    public var note: String?
    /// The day the action took effect (UTC).
    public var occurredOn: String
    /// Last day in force, inclusive; null while it still is.
    public var endedOn: String?
    public var accountId: String?
    public var accountName: String?
    public var pluginId: String?
    public var resourceTypeId: String?
    /// Kept after the resource is deleted.
    public var resourceId: String?
    public var resourceName: String?
    /// Explicit attribution; null means attributed by the allocation rules.
    public var costCentreId: String?
    /// What the action was projected to save per month.
    public var projectedMonthlyAmount: Double?
    public var currency: String?
    /// Per-entry horizon override; null uses the org setting.
    public var horizonMonths: Int?
    /// The cost annotation marking the action on charts.
    public var costAnnotationId: String?
    public var createdByUserId: String?
    public var createdAt: String
    public var updatedAt: String
    public var basis: RealizedSavingsBasis
    public var status: Status
    public var realizedCurrency: String?
    /// Spend per day before the action.
    public var baselinePerDay: Double?
    /// Spend per day over the trailing measured days since.
    public var currentPerDay: Double?
    /// Currency units (not cents), in the row's currency.
    public var realizedToDate: Double?
    /// Currency units (not cents), in the row's currency.
    public var realizedInRange: Double?
    /// Projected over the same accrued days in the range.
    public var projectedInRange: Double?
    public var accruedDays: Int
    /// Last day a one-off action accrues on; null for recurring ones.
    public var horizonEndsOn: String?
    public var attributedCostCentreId: String?
    public var attributedCostCentreName: String?
    public var shortfall: SavingsShortfall?
    /// `full`: a manual entry (PUT); `annotate`: an automatic event takes a note,
    /// a cost centre, a horizon and an end date (PATCH); `none`: derived rows.
    public var editable: Editable

    public init(
        id: String,
        kind: SavingsEventKind,
        source: SavingsEventSource,
        title: String,
        note: String? = nil,
        occurredOn: String,
        endedOn: String? = nil,
        accountId: String? = nil,
        accountName: String? = nil,
        pluginId: String? = nil,
        resourceTypeId: String? = nil,
        resourceId: String? = nil,
        resourceName: String? = nil,
        costCentreId: String? = nil,
        projectedMonthlyAmount: Double? = nil,
        currency: String? = nil,
        horizonMonths: Int? = nil,
        costAnnotationId: String? = nil,
        createdByUserId: String? = nil,
        createdAt: String,
        updatedAt: String,
        basis: RealizedSavingsBasis,
        status: Status,
        realizedCurrency: String? = nil,
        baselinePerDay: Double? = nil,
        currentPerDay: Double? = nil,
        realizedToDate: Double? = nil,
        realizedInRange: Double? = nil,
        projectedInRange: Double? = nil,
        accruedDays: Int,
        horizonEndsOn: String? = nil,
        attributedCostCentreId: String? = nil,
        attributedCostCentreName: String? = nil,
        shortfall: SavingsShortfall? = nil,
        editable: Editable
    ) {
        self.id = id
        self.kind = kind
        self.source = source
        self.title = title
        self.note = note
        self.occurredOn = occurredOn
        self.endedOn = endedOn
        self.accountId = accountId
        self.accountName = accountName
        self.pluginId = pluginId
        self.resourceTypeId = resourceTypeId
        self.resourceId = resourceId
        self.resourceName = resourceName
        self.costCentreId = costCentreId
        self.projectedMonthlyAmount = projectedMonthlyAmount
        self.currency = currency
        self.horizonMonths = horizonMonths
        self.costAnnotationId = costAnnotationId
        self.createdByUserId = createdByUserId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.basis = basis
        self.status = status
        self.realizedCurrency = realizedCurrency
        self.baselinePerDay = baselinePerDay
        self.currentPerDay = currentPerDay
        self.realizedToDate = realizedToDate
        self.realizedInRange = realizedInRange
        self.projectedInRange = projectedInRange
        self.accruedDays = accruedDays
        self.horizonEndsOn = horizonEndsOn
        self.attributedCostCentreId = attributedCostCentreId
        self.attributedCostCentreName = attributedCostCentreName
        self.shortfall = shortfall
        self.editable = editable
    }
}
