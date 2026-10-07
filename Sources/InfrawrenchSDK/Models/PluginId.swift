/*
 * InfrawrenchSDK v1.76.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.76.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Manifest id of an installed plugin.
public enum PluginId: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case aiven
    case algolia
    case alibabaCloud
    case anthropic
    case anyscale
    case assemblyai
    case auth0
    case aws
    case axiom
    case azure
    case backblazeB2
    case baseten
    case betterStack
    case bitbucket
    case buildkite
    case bunny
    case cartesia
    case cerebras
    case checkly
    case chronosphere
    case circleci
    case civo
    case clerk
    case clickhouse
    case cloudflare
    case cloudinary
    case cockroachdbCloud
    case cohere
    case confluentCloud
    case consul
    case convex
    case coralogix
    case coreweave
    case couchbaseCapella
    case crusoe
    case cursor
    case databricks
    case datadog
    case datastaxAstra
    case deepgram
    case deepseek
    case depot
    case devin
    case digitalocean
    case docker
    case dockerHub
    case doppler
    case dynatrace
    case elasticCloud
    case elevenlabs
    case exoscale
    case fal
    case fastly
    case fireworks
    case fly
    case gcp
    case gemini
    case github
    case gitlab
    case gladia
    case grafanaCloud
    case groq
    case hashicorpVault
    case hcpTerraform
    case heroku
    case hetzner
    case honeycomb
    case huggingface
    case ibmCloud
    case incidentIo
    case infisical
    case influxdbCloud
    case jfrog
    case kafka
    case koyeb
    case kubernetes
    case lambdaCloud
    case linode
    case mailgun
    case memcached
    case metronome
    case mistral
    case modal
    case mongodb
    case mongodbAtlas
    case mssql
    case mysql
    case nats
    case neon
    case netlify
    case newrelic
    case nomad
    case northflank
    case okta
    case openai
    case openrouter
    case opensearch
    case openstack
    case oracleCloud
    case ovh
    case pagerduty
    case paperspace
    case perplexity
    case pinecone
    case planetscale
    case postgres
    case posthog
    case postmark
    case prometheus
    case proxmox
    case pulumiCloud
    case qdrantCloud
    case rabbitmq
    case railway
    case redis
    case redisCloud
    case render
    case replicate
    case resend
    case revai
    case runpod
    case s3Compatible
    case sambanova
    case scaleway
    case sendgrid
    case sentry
    case snowflake
    case spacelift
    case speechmatics
    case splunkObservability
    case ssh
    case stripe
    case supabase
    case tailscale
    case temporalCloud
    case timescale
    case together
    case turso
    case twilio
    case upcloud
    case uploadthing
    case upstash
    case vastAi
    case vercel
    case voyage
    case vsphere
    case vultr
    case wasabi
    case weaviateCloud
    case workos
    case xai
    case xata
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "aiven": self = .aiven
        case "algolia": self = .algolia
        case "alibaba-cloud": self = .alibabaCloud
        case "anthropic": self = .anthropic
        case "anyscale": self = .anyscale
        case "assemblyai": self = .assemblyai
        case "auth0": self = .auth0
        case "aws": self = .aws
        case "axiom": self = .axiom
        case "azure": self = .azure
        case "backblaze-b2": self = .backblazeB2
        case "baseten": self = .baseten
        case "better-stack": self = .betterStack
        case "bitbucket": self = .bitbucket
        case "buildkite": self = .buildkite
        case "bunny": self = .bunny
        case "cartesia": self = .cartesia
        case "cerebras": self = .cerebras
        case "checkly": self = .checkly
        case "chronosphere": self = .chronosphere
        case "circleci": self = .circleci
        case "civo": self = .civo
        case "clerk": self = .clerk
        case "clickhouse": self = .clickhouse
        case "cloudflare": self = .cloudflare
        case "cloudinary": self = .cloudinary
        case "cockroachdb-cloud": self = .cockroachdbCloud
        case "cohere": self = .cohere
        case "confluent-cloud": self = .confluentCloud
        case "consul": self = .consul
        case "convex": self = .convex
        case "coralogix": self = .coralogix
        case "coreweave": self = .coreweave
        case "couchbase-capella": self = .couchbaseCapella
        case "crusoe": self = .crusoe
        case "cursor": self = .cursor
        case "databricks": self = .databricks
        case "datadog": self = .datadog
        case "datastax-astra": self = .datastaxAstra
        case "deepgram": self = .deepgram
        case "deepseek": self = .deepseek
        case "depot": self = .depot
        case "devin": self = .devin
        case "digitalocean": self = .digitalocean
        case "docker": self = .docker
        case "docker-hub": self = .dockerHub
        case "doppler": self = .doppler
        case "dynatrace": self = .dynatrace
        case "elastic-cloud": self = .elasticCloud
        case "elevenlabs": self = .elevenlabs
        case "exoscale": self = .exoscale
        case "fal": self = .fal
        case "fastly": self = .fastly
        case "fireworks": self = .fireworks
        case "fly": self = .fly
        case "gcp": self = .gcp
        case "gemini": self = .gemini
        case "github": self = .github
        case "gitlab": self = .gitlab
        case "gladia": self = .gladia
        case "grafana-cloud": self = .grafanaCloud
        case "groq": self = .groq
        case "hashicorp-vault": self = .hashicorpVault
        case "hcp-terraform": self = .hcpTerraform
        case "heroku": self = .heroku
        case "hetzner": self = .hetzner
        case "honeycomb": self = .honeycomb
        case "huggingface": self = .huggingface
        case "ibm-cloud": self = .ibmCloud
        case "incident-io": self = .incidentIo
        case "infisical": self = .infisical
        case "influxdb-cloud": self = .influxdbCloud
        case "jfrog": self = .jfrog
        case "kafka": self = .kafka
        case "koyeb": self = .koyeb
        case "kubernetes": self = .kubernetes
        case "lambda-cloud": self = .lambdaCloud
        case "linode": self = .linode
        case "mailgun": self = .mailgun
        case "memcached": self = .memcached
        case "metronome": self = .metronome
        case "mistral": self = .mistral
        case "modal": self = .modal
        case "mongodb": self = .mongodb
        case "mongodb-atlas": self = .mongodbAtlas
        case "mssql": self = .mssql
        case "mysql": self = .mysql
        case "nats": self = .nats
        case "neon": self = .neon
        case "netlify": self = .netlify
        case "newrelic": self = .newrelic
        case "nomad": self = .nomad
        case "northflank": self = .northflank
        case "okta": self = .okta
        case "openai": self = .openai
        case "openrouter": self = .openrouter
        case "opensearch": self = .opensearch
        case "openstack": self = .openstack
        case "oracle-cloud": self = .oracleCloud
        case "ovh": self = .ovh
        case "pagerduty": self = .pagerduty
        case "paperspace": self = .paperspace
        case "perplexity": self = .perplexity
        case "pinecone": self = .pinecone
        case "planetscale": self = .planetscale
        case "postgres": self = .postgres
        case "posthog": self = .posthog
        case "postmark": self = .postmark
        case "prometheus": self = .prometheus
        case "proxmox": self = .proxmox
        case "pulumi-cloud": self = .pulumiCloud
        case "qdrant-cloud": self = .qdrantCloud
        case "rabbitmq": self = .rabbitmq
        case "railway": self = .railway
        case "redis": self = .redis
        case "redis-cloud": self = .redisCloud
        case "render": self = .render
        case "replicate": self = .replicate
        case "resend": self = .resend
        case "revai": self = .revai
        case "runpod": self = .runpod
        case "s3-compatible": self = .s3Compatible
        case "sambanova": self = .sambanova
        case "scaleway": self = .scaleway
        case "sendgrid": self = .sendgrid
        case "sentry": self = .sentry
        case "snowflake": self = .snowflake
        case "spacelift": self = .spacelift
        case "speechmatics": self = .speechmatics
        case "splunk-observability": self = .splunkObservability
        case "ssh": self = .ssh
        case "stripe": self = .stripe
        case "supabase": self = .supabase
        case "tailscale": self = .tailscale
        case "temporal-cloud": self = .temporalCloud
        case "timescale": self = .timescale
        case "together": self = .together
        case "turso": self = .turso
        case "twilio": self = .twilio
        case "upcloud": self = .upcloud
        case "uploadthing": self = .uploadthing
        case "upstash": self = .upstash
        case "vast-ai": self = .vastAi
        case "vercel": self = .vercel
        case "voyage": self = .voyage
        case "vsphere": self = .vsphere
        case "vultr": self = .vultr
        case "wasabi": self = .wasabi
        case "weaviate-cloud": self = .weaviateCloud
        case "workos": self = .workos
        case "xai": self = .xai
        case "xata": self = .xata
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .aiven: return "aiven"
        case .algolia: return "algolia"
        case .alibabaCloud: return "alibaba-cloud"
        case .anthropic: return "anthropic"
        case .anyscale: return "anyscale"
        case .assemblyai: return "assemblyai"
        case .auth0: return "auth0"
        case .aws: return "aws"
        case .axiom: return "axiom"
        case .azure: return "azure"
        case .backblazeB2: return "backblaze-b2"
        case .baseten: return "baseten"
        case .betterStack: return "better-stack"
        case .bitbucket: return "bitbucket"
        case .buildkite: return "buildkite"
        case .bunny: return "bunny"
        case .cartesia: return "cartesia"
        case .cerebras: return "cerebras"
        case .checkly: return "checkly"
        case .chronosphere: return "chronosphere"
        case .circleci: return "circleci"
        case .civo: return "civo"
        case .clerk: return "clerk"
        case .clickhouse: return "clickhouse"
        case .cloudflare: return "cloudflare"
        case .cloudinary: return "cloudinary"
        case .cockroachdbCloud: return "cockroachdb-cloud"
        case .cohere: return "cohere"
        case .confluentCloud: return "confluent-cloud"
        case .consul: return "consul"
        case .convex: return "convex"
        case .coralogix: return "coralogix"
        case .coreweave: return "coreweave"
        case .couchbaseCapella: return "couchbase-capella"
        case .crusoe: return "crusoe"
        case .cursor: return "cursor"
        case .databricks: return "databricks"
        case .datadog: return "datadog"
        case .datastaxAstra: return "datastax-astra"
        case .deepgram: return "deepgram"
        case .deepseek: return "deepseek"
        case .depot: return "depot"
        case .devin: return "devin"
        case .digitalocean: return "digitalocean"
        case .docker: return "docker"
        case .dockerHub: return "docker-hub"
        case .doppler: return "doppler"
        case .dynatrace: return "dynatrace"
        case .elasticCloud: return "elastic-cloud"
        case .elevenlabs: return "elevenlabs"
        case .exoscale: return "exoscale"
        case .fal: return "fal"
        case .fastly: return "fastly"
        case .fireworks: return "fireworks"
        case .fly: return "fly"
        case .gcp: return "gcp"
        case .gemini: return "gemini"
        case .github: return "github"
        case .gitlab: return "gitlab"
        case .gladia: return "gladia"
        case .grafanaCloud: return "grafana-cloud"
        case .groq: return "groq"
        case .hashicorpVault: return "hashicorp-vault"
        case .hcpTerraform: return "hcp-terraform"
        case .heroku: return "heroku"
        case .hetzner: return "hetzner"
        case .honeycomb: return "honeycomb"
        case .huggingface: return "huggingface"
        case .ibmCloud: return "ibm-cloud"
        case .incidentIo: return "incident-io"
        case .infisical: return "infisical"
        case .influxdbCloud: return "influxdb-cloud"
        case .jfrog: return "jfrog"
        case .kafka: return "kafka"
        case .koyeb: return "koyeb"
        case .kubernetes: return "kubernetes"
        case .lambdaCloud: return "lambda-cloud"
        case .linode: return "linode"
        case .mailgun: return "mailgun"
        case .memcached: return "memcached"
        case .metronome: return "metronome"
        case .mistral: return "mistral"
        case .modal: return "modal"
        case .mongodb: return "mongodb"
        case .mongodbAtlas: return "mongodb-atlas"
        case .mssql: return "mssql"
        case .mysql: return "mysql"
        case .nats: return "nats"
        case .neon: return "neon"
        case .netlify: return "netlify"
        case .newrelic: return "newrelic"
        case .nomad: return "nomad"
        case .northflank: return "northflank"
        case .okta: return "okta"
        case .openai: return "openai"
        case .openrouter: return "openrouter"
        case .opensearch: return "opensearch"
        case .openstack: return "openstack"
        case .oracleCloud: return "oracle-cloud"
        case .ovh: return "ovh"
        case .pagerduty: return "pagerduty"
        case .paperspace: return "paperspace"
        case .perplexity: return "perplexity"
        case .pinecone: return "pinecone"
        case .planetscale: return "planetscale"
        case .postgres: return "postgres"
        case .posthog: return "posthog"
        case .postmark: return "postmark"
        case .prometheus: return "prometheus"
        case .proxmox: return "proxmox"
        case .pulumiCloud: return "pulumi-cloud"
        case .qdrantCloud: return "qdrant-cloud"
        case .rabbitmq: return "rabbitmq"
        case .railway: return "railway"
        case .redis: return "redis"
        case .redisCloud: return "redis-cloud"
        case .render: return "render"
        case .replicate: return "replicate"
        case .resend: return "resend"
        case .revai: return "revai"
        case .runpod: return "runpod"
        case .s3Compatible: return "s3-compatible"
        case .sambanova: return "sambanova"
        case .scaleway: return "scaleway"
        case .sendgrid: return "sendgrid"
        case .sentry: return "sentry"
        case .snowflake: return "snowflake"
        case .spacelift: return "spacelift"
        case .speechmatics: return "speechmatics"
        case .splunkObservability: return "splunk-observability"
        case .ssh: return "ssh"
        case .stripe: return "stripe"
        case .supabase: return "supabase"
        case .tailscale: return "tailscale"
        case .temporalCloud: return "temporal-cloud"
        case .timescale: return "timescale"
        case .together: return "together"
        case .turso: return "turso"
        case .twilio: return "twilio"
        case .upcloud: return "upcloud"
        case .uploadthing: return "uploadthing"
        case .upstash: return "upstash"
        case .vastAi: return "vast-ai"
        case .vercel: return "vercel"
        case .voyage: return "voyage"
        case .vsphere: return "vsphere"
        case .vultr: return "vultr"
        case .wasabi: return "wasabi"
        case .weaviateCloud: return "weaviate-cloud"
        case .workos: return "workos"
        case .xai: return "xai"
        case .xata: return "xata"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [PluginId] = [
        .aiven,
        .algolia,
        .alibabaCloud,
        .anthropic,
        .anyscale,
        .assemblyai,
        .auth0,
        .aws,
        .axiom,
        .azure,
        .backblazeB2,
        .baseten,
        .betterStack,
        .bitbucket,
        .buildkite,
        .bunny,
        .cartesia,
        .cerebras,
        .checkly,
        .chronosphere,
        .circleci,
        .civo,
        .clerk,
        .clickhouse,
        .cloudflare,
        .cloudinary,
        .cockroachdbCloud,
        .cohere,
        .confluentCloud,
        .consul,
        .convex,
        .coralogix,
        .coreweave,
        .couchbaseCapella,
        .crusoe,
        .cursor,
        .databricks,
        .datadog,
        .datastaxAstra,
        .deepgram,
        .deepseek,
        .depot,
        .devin,
        .digitalocean,
        .docker,
        .dockerHub,
        .doppler,
        .dynatrace,
        .elasticCloud,
        .elevenlabs,
        .exoscale,
        .fal,
        .fastly,
        .fireworks,
        .fly,
        .gcp,
        .gemini,
        .github,
        .gitlab,
        .gladia,
        .grafanaCloud,
        .groq,
        .hashicorpVault,
        .hcpTerraform,
        .heroku,
        .hetzner,
        .honeycomb,
        .huggingface,
        .ibmCloud,
        .incidentIo,
        .infisical,
        .influxdbCloud,
        .jfrog,
        .kafka,
        .koyeb,
        .kubernetes,
        .lambdaCloud,
        .linode,
        .mailgun,
        .memcached,
        .metronome,
        .mistral,
        .modal,
        .mongodb,
        .mongodbAtlas,
        .mssql,
        .mysql,
        .nats,
        .neon,
        .netlify,
        .newrelic,
        .nomad,
        .northflank,
        .okta,
        .openai,
        .openrouter,
        .opensearch,
        .openstack,
        .oracleCloud,
        .ovh,
        .pagerduty,
        .paperspace,
        .perplexity,
        .pinecone,
        .planetscale,
        .postgres,
        .posthog,
        .postmark,
        .prometheus,
        .proxmox,
        .pulumiCloud,
        .qdrantCloud,
        .rabbitmq,
        .railway,
        .redis,
        .redisCloud,
        .render,
        .replicate,
        .resend,
        .revai,
        .runpod,
        .s3Compatible,
        .sambanova,
        .scaleway,
        .sendgrid,
        .sentry,
        .snowflake,
        .spacelift,
        .speechmatics,
        .splunkObservability,
        .ssh,
        .stripe,
        .supabase,
        .tailscale,
        .temporalCloud,
        .timescale,
        .together,
        .turso,
        .twilio,
        .upcloud,
        .uploadthing,
        .upstash,
        .vastAi,
        .vercel,
        .voyage,
        .vsphere,
        .vultr,
        .wasabi,
        .weaviateCloud,
        .workos,
        .xai,
        .xata,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
