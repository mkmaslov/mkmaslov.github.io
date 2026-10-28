#!/usr/bin/env bash
set -euo pipefail

#-------------------------------------------------------------------------------
# Install a general-purpose Ruby/Jekyll toolchain.
#-------------------------------------------------------------------------------

readonly RBENV_ROOT="${HOME}/.rbenv"
readonly RUBY_VERSION="3.4.9"

log() { printf '\n==> %s\n' "$*" ; }
die() { printf 'Error: %s\n' "$*" >&2 ; exit 1 ; }

clone_or_update() {
  local repository="$1"
  local destination="$2"
  if [[ -d "${destination}/.git" ]]; then
    git -C "${destination}" pull --ff-only
  elif [[ -e "${destination}" ]]; then
    die "${destination} exists but is not a Git folder."
  else
    git clone "${repository}" "${destination}"
  fi
}

if [[ "$(id -u)" -eq 0 ]]; then
  die "Run this script as regular user."
fi

# Check missing packages
missing_packages=()
if ! command -v gcc >/dev/null 2>&1; then
  missing_packages+=(build-essential)
else
  if ! printf '#include <yaml.h>\n' | gcc -E -x c - >/dev/null 2>&1; then
    missing_packages+=(libyaml-dev)
  fi
  if ! printf '#include <zlib.h>\n' | gcc -E -x c - >/dev/null 2>&1; then
    missing_packages+=(zlib1g-dev)
  fi
  if ! printf '#include <ffi.h>\n' | gcc -E -x c - >/dev/null 2>&1; then
    missing_packages+=(libffi-dev)
  fi
fi
if (( ${#missing_packages[@]} > 0 )); then
  die "missing Ruby build dependencies: ${missing_packages[*]}."
fi

log "Installing or updating rbenv"
clone_or_update https://github.com/rbenv/rbenv.git "${RBENV_ROOT}"
mkdir -p "${RBENV_ROOT}/plugins"
clone_or_update \
  https://github.com/rbenv/ruby-build.git \
  "${RBENV_ROOT}/plugins/ruby-build"

log "Installing Ruby ${RUBY_VERSION}"

touch "${HOME}/.zshrc"
if ! grep -Fq '# Local Ruby installation' "${HOME}/.zshrc"; then
  log "Adding rbenv initialization to ${HOME}/.zshrc"
  {
    printf '\n# Local Ruby installation\n'
    printf 'export RBENV_ROOT="${HOME}/.rbenv"\n'
    printf 'export PATH="${RBENV_ROOT}/bin:${PATH}"\n'
    printf 'eval "$(rbenv init - zsh)"\n'
    printf '#-------------------------------------------------------------------------------\n'
  } >> "${HOME}/.zshrc"
fi

# Initialize rbenv for this non-interactive Bash process:
export RBENV_ROOT
export PATH="${RBENV_ROOT}/bin:${PATH}"
eval "$(rbenv init - bash)"

rbenv install --skip-existing "${RUBY_VERSION}"

rbenv global "${RUBY_VERSION}"

log "Installing Bundler"
gem install bundler
rbenv rehash

log "Installation complete"
printf '\nRestart your shell before using Ruby or Jekyll in a new terminal.\n'

#-------------------------------------------------------------------------------
