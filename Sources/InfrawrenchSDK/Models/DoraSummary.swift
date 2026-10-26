/*
 * InfrawrenchSDK v1.84.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.84.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct DoraSummary: Codable, Hashable, Sendable {
    public struct DeploymentFrequency: Codable, Hashable, Sendable {
        public var value: Double?
        public var band: DoraBand?
        /// How many observations the value rests on.
        public var sample: Int
        public var deploys: Int
        public var days: Double

        public init(
            value: Double? = nil,
            band: DoraBand? = nil,
            sample: Int,
            deploys: Int,
            days: Double
        ) {
            self.value = value
            self.band = band
            self.sample = sample
            self.deploys = deploys
            self.days = days
        }
    }

    public struct LeadTime: Codable, Hashable, Sendable {
        public var value: Double?
        public var band: DoraBand?
        /// How many observations the value rests on.
        public var sample: Int
        public var p90Hours: Double?

        public init(
            value: Double? = nil,
            band: DoraBand? = nil,
            sample: Int,
            p90Hours: Double? = nil
        ) {
            self.value = value
            self.band = band
            self.sample = sample
            self.p90Hours = p90Hours
        }
    }

    public struct ChangeFailureRate: Codable, Hashable, Sendable {
        public var value: Double?
        public var band: DoraBand?
        /// How many observations the value rests on.
        public var sample: Int
        public var changes: Int
        public var failures: Int

        public init(
            value: Double? = nil,
            band: DoraBand? = nil,
            sample: Int,
            changes: Int,
            failures: Int
        ) {
            self.value = value
            self.band = band
            self.sample = sample
            self.changes = changes
            self.failures = failures
        }
    }

    public struct TimeToRestore: Codable, Hashable, Sendable {
        public var value: Double?
        public var band: DoraBand?
        /// How many observations the value rests on.
        public var sample: Int
        public var restores: Int

        public init(
            value: Double? = nil,
            band: DoraBand? = nil,
            sample: Int,
            restores: Int
        ) {
            self.value = value
            self.band = band
            self.sample = sample
            self.restores = restores
        }
    }

    /// `value` is successful production deploys per day.
    public var deploymentFrequency: DeploymentFrequency
    /// `value` is the median hours from commit to production.
    public var leadTime: LeadTime
    /// `value` is the share of production changes that failed, 0-1.
    public var changeFailureRate: ChangeFailureRate
    /// `value` is the median hours from failure to recovery.
    public var timeToRestore: TimeToRestore

    public init(
        deploymentFrequency: DeploymentFrequency,
        leadTime: LeadTime,
        changeFailureRate: ChangeFailureRate,
        timeToRestore: TimeToRestore
    ) {
        self.deploymentFrequency = deploymentFrequency
        self.leadTime = leadTime
        self.changeFailureRate = changeFailureRate
        self.timeToRestore = timeToRestore
    }
}
