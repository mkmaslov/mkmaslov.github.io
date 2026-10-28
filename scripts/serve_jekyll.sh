#!/usr/bin/env bash
set -euo pipefail

#-------------------------------------------------------------------------------
# Build and serve the Jekyll website locally.
#-------------------------------------------------------------------------------

readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly PROJECT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
readonly RBENV_ROOT="${HOME}/.rbenv"

log() { printf '\n==> %s\n' "$*" ; }
die() { printf 'Error: %s\n' "$*" >&2 ; exit 1 ; }

if [[ ! -x "${RBENV_ROOT}/bin/rbenv" ]]; then
  die "rbenv is not installed. Run ${SCRIPT_DIR}/deploy_jekyll.sh first."
fi

# Initialize rbenv for this non-interactive Bash process:
export RBENV_ROOT
export PATH="${RBENV_ROOT}/bin:${PATH}"
eval "$(rbenv init - bash)"

if ! command -v bundle >/dev/null 2>&1; then
  die "Bundler is not installed. Run ${SCRIPT_DIR}/deploy_jekyll.sh first."
fi

cd "${PROJECT_ROOT}"

if ! bundle check; then
  log "Installing project dependencies"
  bundle install
fi

log "Serving website at http://127.0.0.1:4000"

exec bundle exec jekyll serve \
  --host 127.0.0.1 --port 4000 --watch --incremental "$@"

#-------------------------------------------------------------------------------
