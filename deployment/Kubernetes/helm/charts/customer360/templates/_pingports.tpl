{{/* Helpers for the Product Port Numbers */}}

{{/* PingDirectory ConfigAPI */}}
{{- define "pingports.pdConfigPort" -}}
    {{- print .Values.devops.pingdirectory.services.https.port }}
{{- end }}

{{/* PingDirectory non-ConfigAPI */}}
{{- define "pingports.pdApiPort" -}}
    {{- print .Values.devops.pingdirectory.services.apis.port }}
{{- end }}

{{/* PingDirectory LDAP */}}
{{- define "pingports.pdLdapPort" -}}
    {{- print .Values.devops.pingdirectory.services.ldap.port }}
{{- end }}

{{/* PingDirectory LDAPS */}}
{{- define "pingports.pdLdapsPort" -}}
    {{- print .Values.devops.pingdirectory.services.ldaps.port }}
{{- end }}

{{/* PingDataConsole HTTPS */}}
{{- define "pingports.pdConsolePort" -}}
    {{- print .Values.devops.pingdataconsole.services.https.port }} 
{{- end }}

{{/* PingFederate Admin */}}
{{- define "pingports.pfAdminPort" -}}
    {{- print (index .Values.devops "pingfederate-admin" ).services.admin.port }} 
{{- end }}

{{/* PingFederate Runtime */}}
{{- define "pingports.pfEnginePort" -}}
    {{- print (index .Values.devops "pingfederate-engine" ).services.engine.port }}
{{- end }}

{{/* PingAccess Admin */}}
{{- define "pingports.paAdminPort" -}}
    {{- print 9000 }} 
{{- end }}

{{/* PingCentral Admin */}}
{{- define "pingports.pcAdminPort" -}}
    {{- print 9022 }} 
{{- end }}

{{/* Playing with Lookups 
{{- define "pingservices.name" -}}
    {{ range $index, $val := (lookup "v1" "Service" .Release.Namespace "").items }}
        {{ if ( index $val.metadata.annotations "meta.helm.sh/release-name" ) }}
            {{ print $val.metadata.name -}}
        {{- end -}}
    {{- end -}}
{{- end -}} */}}
