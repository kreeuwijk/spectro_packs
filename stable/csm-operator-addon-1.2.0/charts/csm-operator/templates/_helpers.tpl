{{- define "csm-operator.powermaxVersion" -}}
  {{- if eq .version "v2.8.0" -}}
    {{- if eq .lookup "driver-config" }}v2.8.0{{ end }}
    {{- if eq .lookup "driver-image" }}v2.8.0{{ end }}
    {{- if eq .lookup "module-csirevprx-config" }}v2.6.0{{ end }}
    {{- if eq .lookup "module-csirevprx-image" }}v2.6.0{{ end }}
    {{- if eq .lookup "module-auth-config" }}v1.7.0{{ end }}
    {{- if eq .lookup "module-auth-image" }}v1.7.0{{ end }}
    {{- if eq .lookup "module-repl-image-replicator" }}v1.5.0{{ end }}
    {{- if eq .lookup "module-repl-image-controller" }}v1.5.0{{ end }}
    {{- if eq .lookup "module-repl-image-init" }}v1.0.1{{ end }}
  {{- end }}
{{- end }}

{{- define "csm-operator.powerflexVersion" -}}
  {{- if eq .version "v2.8.0" -}}
    {{- if eq .lookup "driver-config" }}v2.8.0{{ end }}
    {{- if eq .lookup "driver-image" }}v2.8.0{{ end }}
    {{- if eq .lookup "module-auth-config" }}v1.7.0{{ end }}
    {{- if eq .lookup "module-auth-image" }}v1.7.0{{ end }}
    {{- if eq .lookup "module-obsv-config" }}v1.5.0{{ end }}
    {{- if eq .lookup "module-obsv-image" }}v1.5.0{{ end }}
    {{- if eq .lookup "module-metrics-image" }}v1.5.0{{ end }}
    {{- if eq .lookup "module-repl-config" }}v1.5.0{{ end }}
    {{- if eq .lookup "module-repl-image-replicator" }}v1.5.0{{ end }}
    {{- if eq .lookup "module-repl-image-controller" }}v1.5.0{{ end }}
    {{- if eq .lookup "module-repl-image-init" }}v1.0.1{{ end }}
    {{- if eq .lookup "module-resiliency-config" }}v1.7.0{{ end }}
    {{- if eq .lookup "module-resiliency-image-podmon" }}v1.7.0{{ end }}
  {{- else if eq .version "v2.7.0" -}}
    {{- if eq .lookup "driver-config" }}v2.7.0{{ end }}
    {{- if eq .lookup "driver-image" }}v2.7.0{{ end }}
    {{- if eq .lookup "module-auth-config" }}v1.7.0{{ end }}
    {{- if eq .lookup "module-auth-image" }}v1.7.0{{ end }}
    {{- if eq .lookup "module-obsv-config" }}v1.5.0{{ end }}
    {{- if eq .lookup "module-obsv-image" }}v1.5.0{{ end }}
    {{- if eq .lookup "module-metrics-image" }}v1.5.0{{ end }}
    {{- if eq .lookup "module-repl-config" }}v1.5.0{{ end }}
    {{- if eq .lookup "module-repl-image-replicator" }}v1.5.0{{ end }}
    {{- if eq .lookup "module-repl-image-controller" }}v1.5.0{{ end }}
    {{- if eq .lookup "module-repl-image-init" }}v1.0.1{{ end }}
    {{- if eq .lookup "module-resiliency-config" }}v1.6.0{{ end }}
    {{- if eq .lookup "module-resiliency-image-podmon" }}v1.6.0{{ end }}
  {{- else if eq .version "v2.6.0" -}}
    {{- if eq .lookup "driver-config" }}v2.6.0{{ end }}
    {{- if eq .lookup "driver-image" }}v2.6.0{{ end }}
    {{- if eq .lookup "module-auth-config" }}v1.6.0{{ end }}
    {{- if eq .lookup "module-auth-image" }}v1.6.0{{ end }}
    {{- if eq .lookup "module-obsv-config" }}v1.5.0{{ end }}
    {{- if eq .lookup "module-obsv-image" }}v1.5.0{{ end }}
    {{- if eq .lookup "module-metrics-image" }}v1.5.0{{ end }}
    {{- if eq .lookup "module-repl-config" }}v1.4.0{{ end }}
    {{- if eq .lookup "module-repl-image-replicator" }}v1.4.0{{ end }}
    {{- if eq .lookup "module-repl-image-controller" }}v1.4.0{{ end }}
    {{- if eq .lookup "module-repl-image-init" }}v1.0.0{{ end }}
  {{- else if eq .version "v2.5.0" -}}
    {{- if eq .lookup "driver-config" }}v2.5.0{{ end }}
    {{- if eq .lookup "driver-image" }}v2.5.0{{ end }}
    {{- if eq .lookup "module-auth-config" }}v1.5.0{{ end }}
    {{- if eq .lookup "module-auth-image" }}v1.5.0{{ end }}
    {{- if eq .lookup "module-obsv-config" }}v1.4.0{{ end }}
    {{- if eq .lookup "module-obsv-image" }}v1.4.0{{ end }}
    {{- if eq .lookup "module-metrics-image" }}v1.4.0{{ end }}
    {{- if eq .lookup "module-repl-config" }}v1.4.0{{ end }}
    {{- if eq .lookup "module-repl-image-replicator" }}""{{ end }}
    {{- if eq .lookup "module-repl-image-controller" }}""{{ end }}
    {{- if eq .lookup "module-repl-image-init" }}""{{ end }}
  {{- end }}
{{- end }}
