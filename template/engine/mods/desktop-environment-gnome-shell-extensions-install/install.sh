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
# Sub / Init
################################################################################

IS_DEBUG="false"

source "${BASE_DIR_PATH}/sub/init.sh"




################################################################################
# Model
################################################################################

function model_desktop_environment_gnome_shell_extensions_install () {

	sub_gnome_shell_extensions_all_install

}




################################################################################
# Main
################################################################################

function portal_desktop_environment_gnome_shell_extensions_install () {

	core_check_permission

	print_info "Install Gnome Shell Extensions ..."
	model_desktop_environment_gnome_shell_extensions_install
	judge "Install Gnome Shell Extensions"

}

portal_desktop_environment_gnome_shell_extensions_install
