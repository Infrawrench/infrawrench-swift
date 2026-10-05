/*
 * InfrawrenchSDK v1.71.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.71.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct BudgetWithStatus: Codable, Hashable, Sendable {
    public struct CurrentMonthEvent: Codable, Hashable, Sendable {
        public enum ThresholdType: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case actual
            case forecast
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "actual": self = .actual
                case "forecast": self = .forecast
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .actual: return "actual"
                case .forecast: return "forecast"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [ThresholdType] = [
                .actual,
                .forecast,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var id: String
        public var thresholdType: ThresholdType
        public var thresholdPercent: Int
        public var triggeredAt: String
        public var note: BudgetAlertNote?

        public init(
            id: String,
            thresholdType: ThresholdType,
            thresholdPercent: Int,
            triggeredAt: String,
            note: BudgetAlertNote? = nil
        ) {
            self.id = id
            self.thresholdType = thresholdType
            self.thresholdPercent = thresholdPercent
            self.triggeredAt = triggeredAt
            self.note = note
        }
    }

    public struct Placement: Codable, Hashable, Sendable {
        public var widgetId: String
        public var dashboardId: String
        public var dashboardName: String

        public init(
            widgetId: String,
            dashboardId: String,
            dashboardName: String
        ) {
            self.widgetId = widgetId
            self.dashboardId = dashboardId
            self.dashboardName = dashboardName
        }
    }

    public var id: String
    public var name: String
    public var amountCents: Int
    public var currency: String
    public var filters: [BudgetCostFilter]
    public var thresholds: [BudgetThreshold]
    public var costBasis: BudgetCostBasis
    /// A saved cost filter (see /saved-cost-filters) applied by reference and
    /// AND-composed with `filters` when the budget is evaluated. Updates are full
    /// replaces, so omitting it on PUT clears it. A reference that fails to
    /// resolve errors the budget's evaluation rather than silently measuring all
    /// spend.
    public var savedFilterId: String?
    /// A scenario model (see /cost-scenarios) this budget's **forecast**
    /// thresholds are measured against. Null — the default, and the value for
    /// every budget nobody deliberately opts in — keeps them on the bare trend.
    /// Opting in is per-budget on purpose: a hypothesis somebody typed into a
    /// form must not silently change when real people get paged. `actual`
    /// thresholds are never affected; they measure money already spent. Updates
    /// are full replaces, so omitting it on PUT clears the opt-in.
    public var scenarioModelId: String?
    /// The opted-into model's name, so a card can say whose assumptions are in
    /// the number.
    public var scenarioModelName: String?
    /// Measure this budget against billing-rule-adjusted spend — the internal
    /// figure — instead of what the providers charged. False by default, and for
    /// every budget nobody opted in. The default is a deliberate refusal: a
    /// markup is organisation policy and a budget threshold pages a real person,
    /// so adding one settings row must not be able to move every on-call rota at
    /// once. Unlike a scenario this affects `actual` thresholds too — an opted-in
    /// budget is measuring the internal number, and month-to-date internal spend
    /// is as marked up as the forecast is. The alert body says the figure is
    /// adjusted and names the collected one. Updates are full replaces, so
    /// omitting it on PUT clears the opt-in.
    public var useAdjustedSpend: Bool
    /// Month-to-date **collected** spend, non-null only for a budget measuring
    /// adjusted spend. Null on an unadjusted budget rather than a copy of
    /// `actualCents`: "there is no separate collected figure because this one is
    /// it" and "the collected figure happens to equal the adjusted one" are
    /// different facts, and captioning every budget in the organisation would
    /// make the adjusted ones invisible.
    public var rawActualCents: Int?
    public var month: String
    public var actualCents: Int
    /// The **unadjusted trend** forecast, whether or not a scenario is applied —
    /// so both numbers are always comparable.
    public var forecastCents: Int?
    /// The scenario-adjusted month forecast, set only for a budget that opted
    /// into a model, and the number its forecast thresholds are judged against.
    /// Null means the thresholds used `forecastCents`.
    public var scenarioForecastCents: Int?
    public var currentMonthEvents: [CurrentMonthEvent]
    public var placements: [Placement]
    public var measure: BudgetMeasure
    /// The usage unit a usage budget counts, exactly as the providers report it.
    public var usageUnit: String?
    /// A usage budget's limit per period, in `usageUnit`.
    public var usageAmount: Double?
    public var period: BudgetPeriod?
    /// The budget this one rolls up into. A parent's actual and forecast are the
    /// sum of its children's, each measured over the parent's period; parent and
    /// children must count the same thing (one currency, or one usage unit).
    /// Hierarchies are at most 4 levels deep. Deleting a budget moves its
    /// children up to its own parent. Updates are full replaces, so omitting it
    /// on PUT makes the budget a root.
    public var parentBudgetId: String?
    /// First day of the period being measured. Null when the budget's periods do
    /// not cover today (a cadence not started yet, a gap in an explicit list):
    /// nothing is measured.
    public var periodStart: String?
    public var periodEnd: String?
    /// This period's limit in the budget's unit: cents for a spend budget, the
    /// quantity for a usage budget. Null when no period is active.
    public var periodLimit: Double?
    /// Period-to-date usage, for a usage budget (whose `actualCents` is 0).
    public var actualUsage: Double?
    /// Projected period-end usage, for a usage budget.
    public var forecastUsage: Double?
    /// True when the budget has children, so its figures are the sum of theirs
    /// over its period rather than a measurement of its own scope.
    public var rolledUp: Bool
    /// Number of direct child budgets.
    public var childCount: Int
    public var hierarchyWarnings: [BudgetHierarchyWarning]

    public init(
        id: String,
        name: String,
        amountCents: Int,
        currency: String,
        filters: [BudgetCostFilter],
        thresholds: [BudgetThreshold],
        costBasis: BudgetCostBasis,
        savedFilterId: String? = nil,
        scenarioModelId: String? = nil,
        scenarioModelName: String? = nil,
        useAdjustedSpend: Bool,
        rawActualCents: Int? = nil,
        month: String,
        actualCents: Int,
        forecastCents: Int? = nil,
        scenarioForecastCents: Int? = nil,
        currentMonthEvents: [CurrentMonthEvent],
        placements: [Placement],
        measure: BudgetMeasure,
        usageUnit: String? = nil,
        usageAmount: Double? = nil,
        period: BudgetPeriod? = nil,
        parentBudgetId: String? = nil,
        periodStart: String? = nil,
        periodEnd: String? = nil,
        periodLimit: Double? = nil,
        actualUsage: Double? = nil,
        forecastUsage: Double? = nil,
        rolledUp: Bool,
        childCount: Int,
        hierarchyWarnings: [BudgetHierarchyWarning]
    ) {
        self.id = id
        self.name = name
        self.amountCents = amountCents
        self.currency = currency
        self.filters = filters
        self.thresholds = thresholds
        self.costBasis = costBasis
        self.savedFilterId = savedFilterId
        self.scenarioModelId = scenarioModelId
        self.scenarioModelName = scenarioModelName
        self.useAdjustedSpend = useAdjustedSpend
        self.rawActualCents = rawActualCents
        self.month = month
        self.actualCents = actualCents
        self.forecastCents = forecastCents
        self.scenarioForecastCents = scenarioForecastCents
        self.currentMonthEvents = currentMonthEvents
        self.placements = placements
        self.measure = measure
        self.usageUnit = usageUnit
        self.usageAmount = usageAmount
        self.period = period
        self.parentBudgetId = parentBudgetId
        self.periodStart = periodStart
        self.periodEnd = periodEnd
        self.periodLimit = periodLimit
        self.actualUsage = actualUsage
        self.forecastUsage = forecastUsage
        self.rolledUp = rolledUp
        self.childCount = childCount
        self.hierarchyWarnings = hierarchyWarnings
    }
}
