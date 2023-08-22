{{- define "vsphere.CPIversion" -}}
{{- if semverCompare "~1.19.0" .Capabilities.KubeVersion.Version }}
          image: gcr.io/cloud-provider-vsphere/cpi/release/manager:v1.19.1
{{- else if semverCompare "~1.20.0" .Capabilities.KubeVersion.Version }}
          image: gcr.io/cloud-provider-vsphere/cpi/release/manager:v1.20.1
{{- else if semverCompare "~1.21.0" .Capabilities.KubeVersion.Version }}
          image: gcr.io/cloud-provider-vsphere/cpi/release/manager:v1.21.3
{{- else if semverCompare "~1.22.0" .Capabilities.KubeVersion.Version }}
          image: gcr.io/cloud-provider-vsphere/cpi/release/manager:v1.22.8
{{- else if semverCompare "~1.23.0" .Capabilities.KubeVersion.Version }}
          image: gcr.io/cloud-provider-vsphere/cpi/release/manager:v1.23.4
{{- else if semverCompare "~1.24.0" .Capabilities.KubeVersion.Version }}
          image: gcr.io/cloud-provider-vsphere/cpi/release/manager:v1.24.6
{{- else if semverCompare "~1.25.0" .Capabilities.KubeVersion.Version }}
          image: gcr.io/cloud-provider-vsphere/cpi/release/manager:v1.25.3
{{- else if semverCompare "~1.26.0" .Capabilities.KubeVersion.Version }}
          image: gcr.io/cloud-provider-vsphere/cpi/release/manager:v1.26.2
{{- else if semverCompare "~1.27.0" .Capabilities.KubeVersion.Version }}
          image: gcr.io/cloud-provider-vsphere/cpi/release/manager:v1.27.0
{{- else }} # Default to the 1.27.0 CPI
          image: gcr.io/cloud-provider-vsphere/cpi/release/manager:v1.27.0
{{- end }}
{{- end }}