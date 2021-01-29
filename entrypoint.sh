#!/bin/sh -l

# Add MTA plugin: https://github.com/cloudfoundry-incubator/multiapps-cli-plugin
cf add-plugin-repo CF-Community https://plugins.cloudfoundry.org
cf install-plugin -f -r CF-Community "multiapps"

cf api "$INPUT_CF_API"
cf auth "$INPUT_CF_USERNAME" "$INPUT_CF_PASSWORD"

if [ -n "$INPUT_CF_ORG" ] && [ -n "$INPUT_CF_SPACE" ]; then
  cf target -o "$INPUT_CF_ORG" -s "$INPUT_CF_SPACE"
fi

sh -c "cf $*"