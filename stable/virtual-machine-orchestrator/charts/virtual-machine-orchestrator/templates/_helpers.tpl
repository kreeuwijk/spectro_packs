{{/*
Expand the name of the chart.
*/}}
{{- define "virtual-machine-orchestrator.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "virtual-machine-orchestrator.fullname" -}}
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
{{- define "virtual-machine-orchestrator.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
  Create namespace
*/}}
{{- define "virtual-machine-orchestrator.namespace" -}}
{{- .Release.Namespace }}   
{{- end }}

{{/*
Common labels
*/}}
{{- define "virtual-machine-orchestrator.labels" -}}
helm.sh/chart: {{ include "virtual-machine-orchestrator.chart" . }}
{{ include "virtual-machine-orchestrator.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "virtual-machine-orchestrator.selectorLabels" -}}
app.kubernetes.io/name: {{ include "virtual-machine-orchestrator.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "virtual-machine-orchestrator.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "virtual-machine-orchestrator.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- /*
 Create custom role binding for custom service account
*/ -}}
{{- define "virtual-machine-orchestrator.createSvcAccont" -}}
{{- if .Values.serviceAccount.create }}
{{- printf "%s" "true" }}
{{- else}}
{{- printf "%s" "false" }}
{{- end }}
{{- end }}