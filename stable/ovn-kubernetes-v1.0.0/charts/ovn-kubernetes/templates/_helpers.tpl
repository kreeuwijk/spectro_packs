{{/*
Check if namespace spec is needed or not
- if namespace doesn't exist, return "true"
- if namespace exists but not managed by Helm, return "true", otherwise the namespace will be deleted
*/}}
{{- define "needNamespace" -}}
{{- $ns := lookup "v1" "Namespace" "" . }}
{{- if not $ns }}
{{- print "true" }}
{{- else }}
{{- $managedBy := get $ns.metadata.labels "app.kubernetes.io/managed-by" }}
  {{- if eq $managedBy "Helm" }}
    {{- print "true" }}
  {{- else }}
    {{- print "false" }}
  {{- end }}
{{- end }}
{{- end }}

{{/*
Generate image
*/}}
{{- define "getImage" -}}
  {{- $image := "" }}
  {{- if and (ne .Values.global.image.repository "") (ne .Values.global.image.tag "") }}
    {{- $image = printf "%s:%s" .Values.global.image.repository .Values.global.image.tag }}
  {{- else if and (ne .Values.image.repository "") (ne .Values.image.tag "") }}
    {{- $image = printf "%s:%s" .Values.image.repository .Values.image.tag }}
  {{- end }}
    {{- if eq $image "" }}
      {{ fail "image not found" }}
    {{- else }}
      {{- print $image }}
    {{- end }}
{{- end }}

{{/*
Output "yes" if enableSsl is true, otherwise "no"
*/}}
{{- define "isSslEnabled" -}}
{{- $sslEnabled := hasKey .Values.global "enableSsl" | ternary .Values.global.enableSsl false }}
{{- if eq $sslEnabled true }}
  {{- print "yes" }}
{{- else }}
  {{- print "no" }}
{{- end }}
{{- end }}

{{/*
Output "yes" if unprivilegedMode is true, otherwise "no"
*/}}
{{- define "isUnprivilegedMode" -}}
{{- $unprivilegedMode := hasKey .Values.global "unprivilegedMode" | ternary .Values.global.unprivilegedMode false }}
{{- if eq $unprivilegedMode true }}
  {{- print "yes" }}
{{- else }}
  {{- print "no" }}
{{- end }}
{{- end }}

{{/*
Enable automatic lookup of k8sAPIServer from the cluster-info ConfigMap (kubeadm-based clusters only)
*/}}
{{- define "k8sAPIServer" }}
  {{- if and (eq .Values.k8sAPIServer "auto") (lookup "v1" "ConfigMap" "kube-public" "cluster-info") }}
    {{- $configmap := (lookup "v1" "ConfigMap" "kube-public" "cluster-info") }}
    {{- $kubeconfig := get $configmap.data "kubeconfig" }}
    {{- $k8sServer := get ($kubeconfig | fromYaml) "clusters" | mustFirst | dig "cluster" "server" "" }}
    {{- $k8sServer | quote }}
  {{- else }}
    {{- .Values.k8sAPIServer | quote }}
  {{- end }}
{{- end }}