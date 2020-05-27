#!/usr/bin/env bash
_VERSION=$(cat "${REPO_NAME}/Telegram/SourceFiles/kotato/version.h" | grep "AppKotatoVersion " | awk '{print $5}' | sed 's/.$//')
_VERSIONSTR=$(cat "${REPO_NAME}/Telegram/SourceFiles/kotato/version.h" | grep "AppKotatoVersionStr " | awk '{print $5}' | sed 's/.$//' | cut -d'"' -f 2)
_ISBETA=$(cat "${REPO_NAME}/Telegram/SourceFiles/core/version.h" | grep "AppBetaVersion " | awk '{print $5}' | sed 's/.$//')
_BETA_SWITCH=""
_VERSIONSTRFULL=${_VERSIONSTR}
test "$_ISBETA" != "true" || _BETA_SWITCH=" -beta"
test $(awk -F"." '{print NF-1}' <<< "${_VERSIONSTR}") -ge 2 || _VERSIONSTRFULL=${_VERSIONSTR}.0
echo "Version: ${_VERSION}"
echo "Version string: ${_VERSIONSTR}"
echo "Full version string: ${_VERSIONSTRFULL}"
echo "Beta switch for packer: ${_BETA_SWITCH}"
echo "::set-env name=VERSION_NUM::${_VERSION}"
echo "::set-env name=VERSION_STR::${_VERSIONSTR}"
echo "::set-env name=VERSION_STR_FULL::${_VERSIONSTRFULL}"
echo "::set-env name=PACKER_BETA::${_BETA_SWITCH}"
