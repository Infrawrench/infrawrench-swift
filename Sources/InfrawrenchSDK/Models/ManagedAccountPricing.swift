/*
 * InfrawrenchSDK v1.63.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.63.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Customer settings to try instead of the saved ones.
///
/// The API may send `null` in place of this, which is why references to it are
/// optional.
public struct ManagedAccountPricing: Codable, Hashable, Sendable {
    public struct Rerate: Codable, Hashable, Sendable {
        public struct Scope: Codable, Hashable, Sendable {
            public var pluginId: String
            /// Absent or null means every service of the provider.
            public var service: String?

            public init(
                pluginId: String,
                service: String? = nil
            ) {
                self.pluginId = pluginId
                self.service = service
            }
        }

        public struct Uplift: Codable, Hashable, Sendable {
            public var pluginId: String
            /// Absent or null means every service of the provider.
            public var service: String?
            public var percent: Double

            public init(
                pluginId: String,
                service: String? = nil,
                percent: Double
            ) {
                self.pluginId = pluginId
                self.service = service
                self.percent = percent
            }
        }

        public var enabled: Bool
        /// Providers or services to re-rate. Empty means every provider.
        public var scope: [Scope]
        /// Applied to in-scope usage the provider reports no list price for: such
        /// a line is billed at collected plus this percentage, and counted as
        /// `fallback` in the coverage.
        public var fallbackUpliftPercent: Double
        /// Per-provider or per-service overrides of the fallback uplift; the most
        /// specific wins.
        public var uplifts: [Uplift]

        public init(
            enabled: Bool,
            scope: [Scope],
            fallbackUpliftPercent: Double,
            uplifts: [Uplift]
        ) {
            self.enabled = enabled
            self.scope = scope
            self.fallbackUpliftPercent = fallbackUpliftPercent
            self.uplifts = uplifts
        }
    }

    /// Present usage at the provider's public on-demand list price instead of
    /// what the organisation actually paid. Applies to usage and
    /// commitment-covered usage lines only.
    public var rerate: Rerate
    public var discounts: DiscountTreatment
    public var credits: DiscountTreatment
    public var commitmentBenefits: DiscountTreatment

    public init(
        rerate: Rerate,
        discounts: DiscountTreatment,
        credits: DiscountTreatment,
        commitmentBenefits: DiscountTreatment
    ) {
        self.rerate = rerate
        self.discounts = discounts
        self.credits = credits
        self.commitmentBenefits = commitmentBenefits
    }
}
