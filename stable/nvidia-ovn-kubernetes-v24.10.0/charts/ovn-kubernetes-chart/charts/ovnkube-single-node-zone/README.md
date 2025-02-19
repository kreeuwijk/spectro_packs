# ovnkube-single-node-zone

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

Helm chart to deploy single node zone stack

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| libovsdbClientLogFile | string | `""` |  |
| logFileMaxAge | int | `5` |  |
| logFileMaxBackups | int | `5` |  |
| logFileMaxSize | int | `100` |  |
| nbLogLevel | string | `"-vconsole:info -vfile:info"` |  |
| northdLogLevel | string | `"-vconsole:info -vfile:info"` |  |
| ovnControllerLogLevel | string | `"-vconsole:info"` |  |
| ovnkubeNodeLogLevel | int | `4` |  |
| sbLogLevel | string | `"-vconsole:info -vfile:info"` |  |

