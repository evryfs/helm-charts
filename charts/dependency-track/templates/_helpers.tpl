{{/* vim: set filetype=mustache: */}}

{{- define "apiserver.image" -}}
{{- include "common.images.image" ( dict "imageRoot" .Values.apiserver.image "global" .Values.global ) -}}
{{- end -}}

{{- define "frontend.image" -}}
{{- include "common.images.image" ( dict "imageRoot" .Values.frontend.image "global" .Values.global ) -}}
{{- end -}}
