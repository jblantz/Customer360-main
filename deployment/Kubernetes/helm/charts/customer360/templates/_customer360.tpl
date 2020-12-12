{{/* Used to put the right TLD on the P1 URLs based on the Region */}}
{{- define "customer360.pingOneTld" -}}
    {{ if .Values.pingOne.usePingOneServices }}
        {{- if eq ( default "NA" .Values.pingOne.envRegion ) "EU" }}
            {{- print "eu" }}
        {{- else if eq ( default "NA" .Values.pingOne.envRegion ) "AP" }}
            {{- print "asia" }}
        {{- else }}
            {{- print "com" }}
        {{- end}}
    {{- end }}
{{- end }}

{{/* Used to put the right TLD on the P1 URLs based on the Region */}}
{{- define "customer360.pingOneRegion" -}}
    {{ if .Values.pingOne.usePingOneServices }}
        {{- if eq ( default "NA" .Values.pingOne.envRegion ) "EU" }}
            {{- print "eu" }}
        {{- else if eq ( default "NA" .Values.pingOne.envRegion ) "AP" }}
            {{- print "asia" }}
        {{- else }}
            {{- print "na" }}
        {{- end}}
    {{- end }}
{{- end }}

{{/* Used to create the Admin Console Client URLs used in Software */}}
{{- define "customer360.pingOneAdminUrl" }}
    {{- print "https://auth.pingone." }}{{ include "customer360.pingOneTld" . }}{{ print "/" .Values.pingOne.adminConsole.envId "/as" }}
{{- end }}

{{/* Used to build the additional URLs passed into the job/pingconfig */}}
{{- define "customer360.useCaseUrls" -}}
    {{- $useCaseGlobal :=  .Values.useCases }}
    {{- $useCaseDetails := .Values.collections.useCases }}
    {{- $merged := merge $useCaseDetails $useCaseGlobal }}
    {{- printf .Values.collections.solutions.customer360.url }},
    {{- range $key, $val := $merged }}
        {{- if $val.enabled }}
            {{- printf $val.url }}, 
        {{- end }}
    {{- end }}
{{- end }}

{{/* Used to build the of the collections URLs passed into the job/pingconfig */}}
{{- define "customer360.useCaseNames" -}}
    {{- $useCaseGlobal :=  .Values.useCases }}
    {{- $useCaseDetails := .Values.collections.useCases }}
    {{- $merged := merge $useCaseDetails $useCaseGlobal }}
    {{- printf .Values.collections.solutions.customer360.name }}{{- print " --> "}}  
    {{- range $key, $val := $merged }}
        {{- if $val.enabled }}
            {{- printf $val.name }}{{ printf " : " }}  
        {{- end }}
    {{- end }}
{{- end }}

{{/* Helper for the Ingress Hostname */}}
{{- define "customer360.hostname" -}}
    {{- if .Values.global.clientConnection.externalDNS.enabled }}
        {{- .Values.global.clientConnection.externalDNS.externalHostname }}
    {{- else }}
        {{- .Release.Name }}{{- print }}.ping-devops.com
    {{- end }}
{{- end }}