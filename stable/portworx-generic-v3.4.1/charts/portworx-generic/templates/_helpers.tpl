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
{{ cat "kubectl -n" .Values.storageCluster.namespace "exec $(kubectl get pods -l name=portworx -n" .Values.storageCluster.namespace "-o jsonpath='{.items[0].metadata.name}') -c portworx -- /opt/pwx/bin/pxctl license activate" .Values.license.enterprise.activationId | indent 14 }}
{{- end }}

{{- define "portworx-generic.CPIversion" -}}
{{- if semverCompare "~1.27.0" .Capabilities.KubeVersion.Version }}
          image: us-docker.pkg.dev/palette-images/packs/csi-vsphere-csi/3.4.0/cpi-manager:v1.27.0
{{- else if semverCompare "~1.28.0" .Capabilities.KubeVersion.Version }}
          image: us-docker.pkg.dev/palette-images/packs/csi-vsphere-csi/3.4.0/cpi-manager:v1.28.0
{{- else if semverCompare "~1.29.0" .Capabilities.KubeVersion.Version }}
          image: us-docker.pkg.dev/palette-images/packs/csi-vsphere-csi/3.4.0/cpi-manager:v1.29.0
{{- else if semverCompare "~1.30.0" .Capabilities.KubeVersion.Version }}
          image: us-docker.pkg.dev/palette-images/packs/csi-vsphere-csi/3.5.0/cpi-manager:v1.30.0
{{- else if semverCompare "~1.31.0" .Capabilities.KubeVersion.Version }}
          image: us-docker.pkg.dev/palette-images/packs/csi-vsphere-csi/3.5.0/cpi-manager:v1.31.0
{{- else if semverCompare "~1.32.0" .Capabilities.KubeVersion.Version }}
          image: us-docker.pkg.dev/palette-images/packs/csi-vsphere-csi/3.5.0/cpi-manager:v1.32.0
{{- else }} # Default to the 1.33.0 CPI
          image: us-docker.pkg.dev/palette-images/packs/csi-vsphere-csi/3.5.0/cpi-manager:v1.33.0
{{- end }}
{{- end }}