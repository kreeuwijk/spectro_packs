{{/*
Expand the name of the chart.
*/}}
{{- define "kube-ovn.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "kube-ovn.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "kube-ovn.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "kube-ovn.labels" -}}
helm.sh/chart: {{ include "kube-ovn.chart" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Get the internal IPs of control plane nodes as a list
*/}}
{{- define "kube-ovn.controlPlaneIPList" -}}
  {{ $ipList := list }}
  {{- range $index, $node := (lookup "v1" "Node" "" "").items }}
    {{- if hasKey $node.metadata.labels "node-role.kubernetes.io/control-plane" }}
      {{- range $key, $val := $node.status.addresses }}
        {{- if eq $val.type "InternalIP" }}
          {{ $ipList = append $ipList $val.address }}
        {{- end }}
      {{- end }}
    {{- end }}
  {{- end }}
  {{ toJson $ipList }}
{{- end }}

{{/*
Get the size of the list
*/}}
{{- define "kube-ovn.controlPlaneSize" -}}
  {{- include "kube-ovn.controlPlaneIPList" . | fromJsonArray | len -}} 
{{- end }}

{{/*
Join the list into a comma-separated string
*/}}
{{- define "kube-ovn.controlPlaneIPs" -}}
  {{- include "kube-ovn.controlPlaneIPList" . | fromJsonArray | join ", " -}} 
{{- end }}