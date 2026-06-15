#!/usr/bin/env bash

SCRIPT_NAME="$(basename "$0")"

show_help() {
  echo "Użyj --help, aby wyświetlić dostępne opcje."
}

case "$1" in
  --help)
    show_help
    ;;
  *)
    show_help
    ;;
esac
