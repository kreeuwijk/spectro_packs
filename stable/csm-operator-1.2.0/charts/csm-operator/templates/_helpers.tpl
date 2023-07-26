{{- define "csm-operator.powerflexVersion" -}}
  {{- if eq .version "v2.7.0" -}}
    {{- if eq .lookup "driver-config" }}v2.7.0{{ end }}
    {{- if eq .lookup "driver-image" }}v2.7.0{{ end }}
    {{- if eq .lookup "module-auth-config" }}v1.7.0{{ end }}
    {{- if eq .lookup "module-auth-image" }}v1.7.0{{ end }}
    {{- if eq .lookup "module-obsv-config" }}v1.5.0{{ end }}
    {{- if eq .lookup "module-obsv-image" }}v1.5.0{{ end }}
    {{- if eq .lookup "metrics-image" }}v1.5.0{{ end }}
    {{- if eq .lookup "repl-config" }}v1.5.0{{ end }}
    {{- if eq .lookup "repl-image-replicator" }}v1.5.0{{ end }}
    {{- if eq .lookup "repl-image-controller" }}v1.5.0{{ end }}
    {{- if eq .lookup "repl-image-init" }}v1.0.1{{ end }}
  {{- else if eq .version "v2.6.0" -}}
    {{- if eq .lookup "driver-config" }}v2.6.0{{ end }}
    {{- if eq .lookup "driver-image" }}v2.6.0{{ end }}
    {{- if eq .lookup "module-auth-config" }}v1.6.0{{ end }}
    {{- if eq .lookup "module-auth-image" }}v1.6.0{{ end }}
    {{- if eq .lookup "module-obsv-config" }}v1.5.0{{ end }}
    {{- if eq .lookup "module-obsv-image" }}v1.5.0{{ end }}
    {{- if eq .lookup "metrics-image" }}v1.5.0{{ end }}
    {{- if eq .lookup "repl-config" }}v1.4.0{{ end }}
    {{- if eq .lookup "repl-image-replicator" }}v1.4.0{{ end }}
    {{- if eq .lookup "repl-image-controller" }}v1.4.0{{ end }}
    {{- if eq .lookup "repl-image-init" }}v1.0.0{{ end }}
  {{- else if eq .version "v2.5.0" -}}
    {{- if eq .lookup "driver-config" }}v2.5.0{{ end }}
    {{- if eq .lookup "driver-image" }}v2.5.0{{ end }}
    {{- if eq .lookup "module-auth-config" }}v1.5.0{{ end }}
    {{- if eq .lookup "module-auth-image" }}v1.5.0{{ end }}
    {{- if eq .lookup "module-obsv-config" }}v1.4.0{{ end }}
    {{- if eq .lookup "module-obsv-image" }}v1.4.0{{ end }}
    {{- if eq .lookup "metrics-image" }}v1.4.0{{ end }}
    {{- if eq .lookup "repl-config" }}v1.4.0{{ end }}
    {{- if eq .lookup "repl-image-replicator" }}""{{ end }}
    {{- if eq .lookup "repl-image-controller" }}""{{ end }}
    {{- if eq .lookup "repl-image-init" }}""{{ end }}
  {{- end }}
{{- end }}
