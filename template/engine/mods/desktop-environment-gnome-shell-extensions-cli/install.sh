#!/usr/bin/env bash


################################################################################
# Set up the environment
################################################################################

set -e						# exit on error
set -o pipefail				# exit on pipeline error
set -u						# treat unset variable as error


################################################################################
# Base Path
################################################################################

BASE_DIR_PATH="$(dirname "$(realpath "${0}")")"
LIBS_DIR_PATH="$(realpath "${BASE_DIR_PATH}/../../libs")"


################################################################################
# Init
################################################################################

source "${LIBS_DIR_PATH}/domain/worker/init.sh"




################################################################################
# Model
################################################################################

function mod_pipx_install () {

	print_info "Install pipx ..."

	echo
	echo apt install -y pipx --install-recommends
	echo
	apt install -y pipx --install-recommends

	judge "Install pipx"


}

function mod_gext_install () {

	print_info "Install gext ..."

	echo
	echo pipx install gnome-extensions-cli --global
	echo
	pipx install gnome-extensions-cli --global

	judge "Install gext"

}

function model_desktop_environment_gnome_shell_extensions_cli () {

	mod_pipx_install
	mod_gext_install

}




################################################################################
# Main
################################################################################

function portal_desktop_environment_gnome_shell_extensions_cli () {

	core_check_permission

	print_info "Install gnome-shell-extensions-cli ..."
	model_desktop_environment_gnome_shell_extensions_cli
	judge "Install gnome-shell-extensions-cli"

}

portal_desktop_environment_gnome_shell_extensions_cli
