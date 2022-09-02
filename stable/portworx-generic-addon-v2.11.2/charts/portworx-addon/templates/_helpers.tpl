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
