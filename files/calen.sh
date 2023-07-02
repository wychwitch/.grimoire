#!/bin/bash

if test -f "$HOME/cal/$(date +"%Y/%m").月"; then
	nvim "$HOME/cal/$(date +"%Y/%m").月"
else 
	mkdir -p "$HOME/cal/$(date +"%Y")"
	cal -m >> "$HOME/cal/$(date +"%Y/%m").月"
	nvim "$HOME/cal/$(date +"%Y/%m").月"
fi
