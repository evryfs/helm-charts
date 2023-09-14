{{/* vim: set filetype=mustache: */}}

{{- define "apiserver.image" -}}
{{- include "common.images.image" ( dict "imageRoot" .Values.apiserver.image "global" .Values.global ) -}}
{{- end -}}

{{- define "frontend.image" -}}
{{- include "common.images.image" ( dict "imageRoot" .Values.frontend.image "global" .Values.global ) -}}
{{- end -}}

{{- define "frontend.labels.user" -}}
{{ if .Values.frontend.labels }}
{{- .Values.frontend.labels | toYaml | indent 0 }}
{{- end }}
{{- if .Values.global.labels }}
{{- .Values.global.labels | toYaml | nindent 0 }}
{{- end }}
{{- end -}}

{{- define "frontend.labels.standard" -}}
{{ include "common.labels.standard" . }}
{{ include "frontend.labels.user" . }}
{{- end -}}

{{- define "frontend.labels.matchLabels" -}}
{{ include "common.labels.matchLabels" . }}
{{ include "frontend.labels.user" . }}
{{- end -}}

{{- define "backend.labels.user" -}}
{{ if .Values.apiserver.labels }}
{{- .Values.apiserver.labels | toYaml | indent 0 }}
{{- end }}
{{- if .Values.global.labels }}
{{- .Values.global.labels | toYaml | nindent 0 }}
{{- end }}
{{- end -}}

{{- define "backend.labels.standard" -}}
{{ include "common.labels.standard" . }}
{{ include "backend.labels.user" . }}
{{- end -}}

{{- define "backend.labels.matchLabels" -}}
{{ include "common.labels.matchLabels" . }}
{{ include "backend.labels.user" . }}
{{- end -}}
