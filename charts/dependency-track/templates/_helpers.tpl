{{/* vim: set filetype=mustache: */}}

{{- define "apiserver.image" -}}
{{- include "common.images.image" ( dict "imageRoot" .Values.apiserver.image "global" .Values.global ) -}}
{{- end -}}

{{- define "frontend.image" -}}
{{- include "common.images.image" ( dict "imageRoot" .Values.frontend.image "global" .Values.global ) -}}
{{- end -}}

{{- define "frontend.labels.standard" -}}
{{ include "common.labels.standard" . }}
app.kubernetes.io/component: frontend
{{- end -}}

{{- define "frontend.labels.matchLabels" -}}
{{ include "common.labels.matchLabels" . }}
app.kubernetes.io/component: frontend
{{- end -}}

{{- define "backend.labels.standard" -}}
{{ include "common.labels.standard" . }}
app.kubernetes.io/component: backend
{{- end -}}

{{- define "backend.labels.matchLabels" -}}
{{ include "common.labels.matchLabels" . }}
app.kubernetes.io/component: backend
{{- end -}}
