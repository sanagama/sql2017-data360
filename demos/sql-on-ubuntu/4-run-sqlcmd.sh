#!/bin/bash
set -x

sqlcmd -S . -U sa -Q "SELECT @@version"

