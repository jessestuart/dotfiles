#!/usr/bin/env zsh
alias pik8s_led_off="echo 0 | sudo tee /sys/class/leds/led1/brightness"
alias pik8s_led_on="echo 1 | sudo tee /sys/class/leds/led1/brightness"
