#!/bin/bash

if [ -e ~/.pomodoro_session ]; then rm ~/.pomodoro_session; else echo "25 5" > ~/.pomodoro_session; fi
