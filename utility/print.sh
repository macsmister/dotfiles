#!/bin/sh

source utility/color.sh
UNDERLINE_SEPARATOR="---"

function print_header() {
  echo "${GREEN}${1}${NOCOLOR}"
  echo "${GREEN}${UNDERLINE_SEPARATOR}${NOCOLOR}"
}

function print_footer() {
  echo "${GREEN}${UNDERLINE_SEPARATOR}${NOCOLOR}"
  echo "${GREEN}${1}${NOCOLOR}"
}

function print_negative() {
  echo "${LIGHT_RED}[x] ${1}${NOCOLOR}"
}

function print_positive() {
  echo "${GREEN}[\xE2\x9C\x94] ${1}${NOCOLOR}"
}

function print_information() {
  echo "${YELLOW}[i] ${1}${NOCOLOR}"
}
