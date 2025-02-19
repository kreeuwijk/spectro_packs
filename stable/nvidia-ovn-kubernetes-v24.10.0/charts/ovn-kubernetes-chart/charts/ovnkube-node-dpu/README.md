# ovnkube-node-dpu

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

Helm chart to deploy ovnkube-node-dpu

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| externalDHCP | bool | `false` |  |
| gatewayDiscoveryNetwork | string | `"169.254.99.100/32"` |  |
| hostCIDR | string | `""` |  |
| ipamPFIPIndex | string | `"nil"` |  |
| ipamPool | string | `""` |  |
| ipamPoolType | string | `""` |  |
| ipamVTEPIPIndex | string | `"nil"` |  |
| kubernetesSecretName | string | `""` |  |
| logFileMaxAge | int | `5` |  |
| logFileMaxBackups | int | `5` |  |
| logFileMaxSize | int | `100` |  |
| logLevel | int | `4` |  |
| ovnControllerLogLevel | string | `"-vconsole:info"` |  |
| vtepCIDR | string | `""` |  |

