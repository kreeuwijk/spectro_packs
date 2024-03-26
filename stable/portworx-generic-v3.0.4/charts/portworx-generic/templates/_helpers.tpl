{{- define "portworx-generic.pxLicenseServer" -}}
{{ cat "kubectl -n kube-system exec $(kubectl get pods -l name=portworx -n kube-system -o jsonpath='{.items[0].metadata.name}') -c portworx -- /opt/pwx/bin/pxctl license setls" .Values.license.enterprise.customLicenseServer.url | indent 14 }}{{ template "portworx-generic.pxImportUnknownCa" . }}{{ template "portworx-generic.pxlicenseBorrowInterval" . }}{{ template "portworx-generic.pxAddFeatures" . }}
{{- end }}

{{- define "portworx-generic.pxImportUnknownCa" -}}
{{ if .Values.license.enterprise.customLicenseServer.importUnknownCa }} --import-unknown-ca{{ end }}
{{- end }}

{{- define "portworx-generic.pxlicenseBorrowInterval" -}}
{{ if .Values.license.enterprise.customLicenseServer.licenseBorrowInterval }} --interval {{ .Values.license.enterprise.customLicenseServer.licenseBorrowInterval }}{{ end }}
{{- end }}

{{- define "portworx-generic.pxAddFeatures" -}}
{{ if .Values.license.enterprise.customLicenseServer.addFeatures }} --add {{ join "," .Values.license.enterprise.customLicenseServer.addFeatures }}{{ end }}
{{- end }}

{{- define "portworx-generic.setPxEnterpriseLicense" -}}
|
{{- if .Values.license.enterprise.customLicenseServer }}
{{ template "portworx-generic.pxLicenseServer" . }}
{{- end }}
{{ cat "kubectl -n kube-system exec $(kubectl get pods -l name=portworx -n kube-system -o jsonpath='{.items[0].metadata.name}') -c portworx -- /opt/pwx/bin/pxctl license activate" .Values.license.enterprise.activationId | indent 14 }}
{{- end }}

{{- define "portworx-generic.CPIversion" -}}
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
{{- else if semverCompare "~1.28.0" .Capabilities.KubeVersion.Version }}
          image: gcr.io/cloud-provider-vsphere/cpi/release/manager:v1.28.0
{{- else }} # Default to the 1.28.0 CPI
          image: gcr.io/cloud-provider-vsphere/cpi/release/manager:v1.28.0
{{- end }}
{{- end }}